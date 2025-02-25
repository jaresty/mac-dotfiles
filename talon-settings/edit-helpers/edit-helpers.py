from dataclasses import dataclass
import math
from typing import Optional
from talon import Context, Module, actions, cron

ctx = Context()
mod = Module()

current_job = None


@dataclass
class MovementConfig:
    movement_type: callable
    reverse_movement_type: callable
    repeat_speed: int
    current_step_size: int


continuous_movement_job: Optional[MovementConfig] = None

mod.tag(
    "continuously_moving",
    "A tag enabling continuous movement command modification",
)
mod.list(
    "repeat_speed",
    "The speed at which we repeat a key",
)
mod.list(
    "continuous_movement_type",
    "A continuous movement command",
)
MOVEMENT_SPEEDS = ["25ms", "50ms", "100ms", "200ms", "400ms", "1s"]
REPEAT_SPEED = {"hyper": 1, "fast": 2, "mid": 2, "slow": 4, "lethargic": 5}
ctx.lists["user.repeat_speed"] = REPEAT_SPEED.keys()


def back_off_move():
    global continuous_movement_job
    if not continuous_movement_job:
        return
    for _ in range(continuous_movement_job.current_step_size):
        continuous_movement_job.movement_type()
    continuous_movement_job.current_step_size = math.ceil(
        continuous_movement_job.current_step_size / 2
    )


MOVEMENT_TYPE: dict[str, tuple[callable, callable, int]] = {
    "fly stepstream": (actions.edit.up, actions.edit.down, 2),
    "dip stepstream": (actions.edit.down, actions.edit.up, 2),
    "onstepstream": (actions.edit.right, actions.edit.left, 1),
    "restepstream": (actions.edit.left, actions.edit.right, 1),
    "fly snatchstream": (actions.edit.extend_line_up, actions.edit.extend_line_down, 3),
    "dip snatchstream": (actions.edit.extend_line_down, actions.edit.extend_line_up, 3),
    "onsnatchstream": (actions.edit.extend_right, actions.edit.extend_left, 1),
    "resnatchstream": (actions.edit.extend_left, actions.edit.extend_right, 1),
    "waxstream": (actions.user.wax, actions.user.wane, 4),
    "wanestream": (actions.user.wane, actions.user.wax, 4),
    "size stepstream": (actions.edit.zoom_in, actions.edit.zoom_out, 5),
    "size restepstream": (actions.edit.zoom_out, actions.edit.zoom_in, 5),
    "rewind": (actions.edit.undo, actions.edit.redo, 4),
    "replay": (actions.edit.redo, actions.edit.undo, 4),
    "bouncestream": (actions.core.repeat_command, actions.core.repeat_command, 4),
    "hunt stepstream": (actions.edit.find_next, actions.edit.find_previous, 4),
    "hunt restepstream": (actions.edit.find_previous, actions.edit.find_next, 4),
    "prob stepstream": (actions.user.problem_next, actions.user.problem_last, 4),
    "prob restepstream": (actions.user.problem_last, actions.user.problem_next, 4),
    "pleetstream": (actions.user.complete, actions.user.complete_backward, 4),
    "fold stepstream": (actions.user.fold_more, actions.user.fold_less, 4),
    "fold restepstream": (actions.user.fold_less, actions.user.fold_more, 4),
    "navi restepstream": (actions.user.go_back, actions.user.go_forward, 4),
    "navi stepstream": (actions.user.go_forward, actions.user.go_back, 4),
    "chase stepstream": (actions.user.next_reference, actions.user.last_reference, 4),
    "chase restepstream": (
        actions.user.last_reference,
        actions.user.next_reference,
        4,
    ),
    "fly pannstream": (actions.user.mouse_scroll_up, actions.user.mouse_scroll_down, 2),
    "dip pannstream": (actions.user.mouse_scroll_down, actions.user.mouse_scroll_up, 2),
    "onpannstream": (
        actions.user.mouse_scroll_right,
        actions.user.mouse_scroll_left,
        2,
    ),
    "repannstream": (
        actions.user.mouse_scroll_left,
        actions.user.mouse_scroll_right,
        2,
    ),
}

ctx.lists["user.continuous_movement_type"] = MOVEMENT_TYPE.keys()


@mod.capture(
    rule="{user.continuous_movement_type} [{user.repeat_speed}] [taper <number_small>]"
)
def movement_type(m) -> MovementConfig:
    movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][0]
    reverse_movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][1]
    repeat_speed: int = MOVEMENT_TYPE[m.continuous_movement_type][2]
    number_small = 1

    if hasattr(m, "repeat_speed"):
        repeat_speed = REPEAT_SPEED[m.repeat_speed]

    if hasattr(m, "number_small"):
        number_small = m.number_small

    return MovementConfig(
        movement_type, reverse_movement_type, repeat_speed, number_small
    )


@mod.capture(rule="{user.repeat_speed}")
def repeat_speed(m) -> int:
    return REPEAT_SPEED[m.repeat_speed]


def continuous_move():
    global continuous_movement_job, current_job
    if continuous_movement_job is None:
        return
    stop_moving()

    current_job = cron.interval(
        MOVEMENT_SPEEDS[continuous_movement_job.repeat_speed], back_off_move
    )


def move_faster():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = max(
            0, continuous_movement_job.repeat_speed - 1
        )


def move_slower():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = min(
            len(MOVEMENT_SPEEDS) - 1, continuous_movement_job.repeat_speed + 1
        )


def move_backing():
    global continuous_movement_job
    if continuous_movement_job is None:
        return
    continuous_movement_job.reverse_movement_type()


def stop_moving():
    global current_job
    if current_job is not None:
        cron.cancel(current_job)


def flip_direction():
    global continuous_movement_job
    if continuous_movement_job is None:
        return
    go_foring = continuous_movement_job.movement_type
    continuous_movement_job.movement_type = (
        continuous_movement_job.reverse_movement_type
    )
    continuous_movement_job.reverse_movement_type = go_foring


@mod.action_class
class Actions:
    def numeric_increment():
        """Increment the adjacent number"""
        actions.edit.select_word()
        selected_text = actions.edit.selected_text()
        number_to_insert = int(selected_text) + 1
        actions.auto_insert(str(number_to_insert))

    def numeric_decrement():
        """Decrement the adjacent number"""
        actions.edit.select_word()
        selected_text = actions.edit.selected_text()
        number_to_insert = int(selected_text) - 1
        actions.auto_insert(str(number_to_insert))

    def select_paste():
        """Select last paste"""
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()

    def paste_select():
        """Paste and select"""
        actions.user.paste(actions.clip.text())
        lines = actions.clip.text().split("\n")
        for _ in lines[:-1]:
            actions.edit.extend_up()
        actions.edit.extend_line_end()
        for _ in lines[0]:
            actions.edit.extend_left()

    def set_select_direction_right():
        """Make it so the selection is going to the right"""
        selected_text = actions.edit.selected_text()
        actions.edit.left()
        for _ in selected_text:
            actions.edit.extend_right()

    def set_select_direction_left():
        """Make it so the selection is going to the left"""
        selected_text = actions.edit.selected_text()
        actions.edit.right()
        for _ in selected_text:
            actions.edit.extend_left()

    def start_moving(movement_config: MovementConfig):
        """Start moving continuously"""
        global continuous_movement_job
        stop_moving()
        ctx.tags = ["user.continuously_moving"]
        continuous_movement_job = movement_config

    def move_faster():
        """Increase your movement speed"""
        move_faster()

    def move_slower():
        """Decrease your movement speed"""
        move_slower()

    def flip_direction():
        """Start moving in the other direction"""
        flip_direction()

    def set_taper_step(taper_amount: int):
        """Set the next taper step amount"""
        global continuous_movement_job
        if continuous_movement_job is None:
            return
        continuous_movement_job.current_step_size = taper_amount

    def stop_moving():
        """Stop moving continuously"""
        global continuous_movement_job
        stop_moving()
        continuous_movement_job = None
        ctx.tags = []


@ctx.action_class("user")
class UserActions:
    def noise_trigger_hiss(active: bool):
        if active and actions.speech.enabled():
            continuous_move()
        else:
            stop_moving()

    def noise_trigger_pop():
        if actions.speech.enabled():
            move_backing()


@ctx.action_class("edit")
class LineSwapActions:
    def line_swap_up():
        actions.edit.select_line()
        current_line_text = actions.edit.selected_text().replace("\n", "")
        actions.edit.delete_line()
        actions.edit.line_insert_up()
        actions.insert(current_line_text)

    def line_swap_down():
        actions.edit.select_line()
        current_line_text = actions.edit.selected_text()
        actions.edit.delete_line()
        actions.key("delete")
        actions.edit.line_insert_down()
        actions.insert(current_line_text)
