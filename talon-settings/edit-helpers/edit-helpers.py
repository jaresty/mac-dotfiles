from math import floor
from dataclasses import dataclass
import math
from talon import Context, Module, actions, cron

ctx = Context()
mod = Module()

continuous_movement_job = None

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
MOVEMENT_SPEEDS = ["100ms", "200ms", "500ms", "1s"]
REPEAT_SPEED = {"hyper": 1, "fast": 2, "mid": 3, "slow": 4}
ctx.lists["user.repeat_speed"] = REPEAT_SPEED.keys()


def move_down_right():
    actions.edit.down()
    actions.edit.right()


def move_up_left():
    actions.edit.up()
    actions.edit.left()


def back_off_move():
    global continuous_movement_job
    if not continuous_movement_job:
        return
    for _ in range(continuous_movement_job.current_step_size):
        continuous_movement_job.movement_type()
    continuous_movement_job.current_step_size = math.ceil(
        continuous_movement_job.current_step_size / 2
    )


def cycle_move(cycle_size: int, move_forward: callable, move_backward: callable):
    n = 0

    def cycle_move_step():
        nonlocal n
        n = n % (cycle_size * 2)
        direction_flag = floor(n / cycle_size)
        if direction_flag == 0:
            move_forward()
            n += 1
        else:
            for _ in range(cycle_size):
                move_backward()
            n += cycle_size

    return cycle_move_step


MOVEMENT_TYPE: dict[str, tuple[callable, int]] = {
    "flyward": (actions.edit.up, 3),
    "swoopward": (move_up_left, 3),
    "dipward": (actions.edit.down, 3),
    "driftward": (move_down_right, 3),
    "steppyward": (actions.edit.right, 1),
    "slinkyward": (actions.edit.left, 1),
    "stepward": (actions.edit.word_right, 2),
    "slinkward": (actions.edit.word_left, 2),
    "dustward": (actions.edit.extend_line_up, 3),
    "sweepward": (actions.edit.extend_line_down, 3),
    "snatchyward": (actions.edit.extend_right, 1),
    "chancyward": (actions.edit.extend_left, 1),
    "snatchward": (actions.edit.extend_word_right, 2),
    "chanceward": (actions.edit.extend_word_left, 2),
    "waxward": (actions.user.wax, 3),
    "waneward": (actions.user.wane, 3),
    "narrowward": (actions.edit.zoom_in, 3),
    "widenward": (actions.edit.zoom_out, 3),
}
ctx.lists["user.continuous_movement_type"] = MOVEMENT_TYPE.keys()


@dataclass
class MovementConfig:
    movement_type: callable
    repeat_speed: int
    current_step_size: int
    current_job: any


@mod.capture(
    rule="{user.continuous_movement_type} [{user.repeat_speed}] [taper <number_small>]"
)
def movement_type(m) -> MovementConfig:
    movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][0]
    repeat_speed: int = MOVEMENT_TYPE[m.continuous_movement_type][1]
    number_small = 1

    if hasattr(m, "repeat_speed"):
        repeat_speed = REPEAT_SPEED[m.repeat_speed]

    if hasattr(m, "number_small"):
        number_small = m.number_small

    return MovementConfig(movement_type, repeat_speed, number_small, None)


@mod.capture(rule="{user.repeat_speed}")
def repeat_speed(m) -> int:
    return REPEAT_SPEED[m.repeat_speed]


def start_moving(movement_config: MovementConfig):
    global continuous_movement_job
    stop_moving()
    continuous_movement_job = movement_config

    ctx.tags = ["user.continuously_moving"]
    continuous_movement_job.current_job = cron.interval(
        MOVEMENT_SPEEDS[continuous_movement_job.repeat_speed], back_off_move
    )


def move_faster():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = max(
            0, continuous_movement_job.repeat_speed - 1
        )
        start_moving(continuous_movement_job)


def move_slower():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = min(
            len(MOVEMENT_SPEEDS) - 1, continuous_movement_job.repeat_speed + 1
        )
        start_moving(continuous_movement_job)


def stop_moving():
    global continuous_movement_job
    if continuous_movement_job and continuous_movement_job.current_job:
        ctx.tags = []
        cron.cancel(continuous_movement_job.current_job)


@mod.action_class
class Actions:
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
        start_moving(movement_config)

    def cycle_move(cycle_size: int):
        """Cycle moving up and down"""
        movement_config = MovementConfig(
            cycle_move(cycle_size, actions.edit.down, actions.edit.up), 3, 1, None
        )
        start_moving(movement_config)

    def move_faster():
        """Increase your movement speed"""
        move_faster()

    def move_slower():
        """Decrease your movement speed"""
        move_slower()

    def set_taper_step(taper_amount: int):
        """Set the next taper step amount"""
        global continuous_movement_job
        if continuous_movement_job is None:
            return
        continuous_movement_job.current_step_size = taper_amount

    def stop_moving():
        """Stop moving continuously"""
        stop_moving()
