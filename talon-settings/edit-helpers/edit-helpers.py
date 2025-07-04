from dataclasses import dataclass
import math
from typing import Optional
from talon import Context, Module, actions, cron
from datetime import datetime

ctx = Context()
mod = Module()

current_job = None
hiss_cron = None


@dataclass
class MovementConfig:
    movement_type: callable
    reverse_movement_type: callable
    repeat_speed: int
    current_step_size: int
    last_used_at: datetime
    current_iteration_count: int = 0


ACCELERATION_MODIFIER = 10


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
# MOVEMENT_SPEEDS = ["50ms", "100ms", "200ms", "400ms", "1s"]
MOVEMENT_SPEEDS = [1, 2, 4, 8, 16]
REPEAT_SPEED = {"hyper": 1, "fast": 2, "mid": 2, "slow": 4, "lethargic": 5}
ctx.lists["user.repeat_speed"] = REPEAT_SPEED.keys()


MOVEMENT_TYPE: dict[str, tuple[callable, callable, int]] = {
    "flow choose": (
        actions.edit.down,
        lambda: (actions.key("enter")),
        4,
    ),
    "flow bop": (actions.core.repeat_command, actions.core.repeat_command, 4),
}

ctx.lists["user.continuous_movement_type"] = MOVEMENT_TYPE.keys()


@mod.capture(rule="flow <user.move> | {user.continuous_movement_type}")
def simple_movement(m) -> tuple[callable, callable, int]:
    if hasattr(m, "continuous_movement_type"):
        movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][0]
        reverse_movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][1]
        repeat_speed: int = MOVEMENT_TYPE[m.continuous_movement_type][2]
        return (movement_type, reverse_movement_type, repeat_speed)

    return (
        lambda: actions.user.invoke_move(m.move),
        lambda: actions.user.invoke_move(m.move.flip_instance("veer")),
        1,
    )


@mod.capture(rule="<user.simple_movement> [{user.repeat_speed}] [taper <number_small>]")
def movement_type(m) -> MovementConfig:
    movement_type: callable = m.simple_movement[0]
    reverse_movement_type: callable = m.simple_movement[1]
    repeat_speed: int = m.simple_movement[2]
    number_small = 1

    if hasattr(m, "repeat_speed"):
        repeat_speed = REPEAT_SPEED[m.repeat_speed]

    if hasattr(m, "number_small"):
        number_small = m.number_small

    return MovementConfig(
        movement_type, reverse_movement_type, repeat_speed, number_small, datetime.now()
    )


@mod.capture(rule="{user.repeat_speed}")
def repeat_speed(m) -> int:
    return REPEAT_SPEED[m.repeat_speed]


def back_off_move():
    global continuous_movement_job
    if continuous_movement_job is None:
        return

    continuous_movement_job.last_used_at = datetime.now()

    movement_speed_index = continuous_movement_job.repeat_speed
    movement_speed_index = max(
        0,
        movement_speed_index
        - (continuous_movement_job.current_iteration_count // ACCELERATION_MODIFIER),
    )
    if (
        continuous_movement_job.current_iteration_count
        % MOVEMENT_SPEEDS[movement_speed_index]
        == 0
    ):
        for _ in range(continuous_movement_job.current_step_size):
            continuous_movement_job.movement_type()
    continuous_movement_job.current_step_size = math.ceil(
        continuous_movement_job.current_step_size / 2
    )
    continuous_movement_job.current_iteration_count += 1


def continuous_move():
    global current_job

    current_job = cron.interval("50ms", back_off_move)


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
    continuous_movement_job.last_used_at = datetime.now()
    continuous_movement_job.reverse_movement_type()


def stop_moving():
    global current_job
    cron.cancel(current_job)
    current_job = None


def reset_speed():
    global continuous_movement_job
    if continuous_movement_job is not None:
        continuous_movement_job.current_iteration_count = 0


def flip_direction():
    global continuous_movement_job
    if continuous_movement_job is None:
        return
    go_forward = continuous_movement_job.movement_type
    continuous_movement_job.movement_type = (
        continuous_movement_job.reverse_movement_type
    )
    continuous_movement_job.reverse_movement_type = go_forward
    continuous_movement_job.movement_type()


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

    def select_text_backward(text: str):
        """Select the text to the left for the length of the passed text"""
        lines = text.split("\n")
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
        movement_config.movement_type()
        continuous_movement_job = MovementConfig(
            movement_config.movement_type,
            movement_config.reverse_movement_type,
            movement_config.repeat_speed,
            movement_config.current_step_size,
            datetime.now(),
            movement_config.current_iteration_count,
        )

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
        global hiss_cron, current_job, continuous_movement_job

        if continuous_movement_job is None:
            return
        if (
            continuous_movement_job.last_used_at
            and (datetime.now() - continuous_movement_job.last_used_at).total_seconds()
            > 60
        ):
            actions.app.notify(
                "Disabling continuous move since it has been more than 60 seconds"
            )
            actions.user.stop_moving()
            return

        if active and actions.speech.enabled():
            hiss_cron = cron.after(
                str("300ms"),
                continuous_move,
            )
        else:
            cron.cancel(hiss_cron)
            cron.cancel(current_job)
            reset_speed()
            stop_moving()

    def noise_trigger_pop():
        global continuous_movement_job
        if continuous_movement_job is None:
            return
        if (
            continuous_movement_job.last_used_at
            and (datetime.now() - continuous_movement_job.last_used_at).total_seconds()
            > 60
        ):
            actions.app.notify(
                "Disabling continuous move since it has been more than 60 seconds"
            )
            actions.user.stop_moving()
            return

        if actions.speech.enabled():
            move_backing()


@ctx.action_class("edit")
class LineSwapActions:
    def line_swap_up():
        actions.edit.select_line()
        current_line_text = actions.edit.selected_text().replace("\n", "")
        actions.edit.delete_line()
        actions.key("backspace")
        actions.edit.line_insert_up()
        actions.insert(current_line_text)

    def line_swap_down():
        actions.edit.select_line()
        current_line_text = actions.edit.selected_text()
        actions.edit.delete_line()
        actions.key("delete")
        actions.edit.line_insert_down()
        actions.insert(current_line_text)
