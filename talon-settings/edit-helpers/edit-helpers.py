from dataclasses import dataclass
import math
from talon import Context, Module, actions, cron

ctx = Context()
mod = Module()

continuous_movement_job = None


mod.list(
    "repeat_speed",
    "The speed at which we repeat a key",
)
mod.list(
    "continuous_movement_type",
    "A continuous movement command",
)
MOVEMENT_SPEEDS = ["100ms", "200ms", "500ms", "1s"]
REPEAT_SPEED = {"hyper": 0, "fast": 1, "mid": 2, "slow": 3}
ctx.lists["user.repeat_speed"] = REPEAT_SPEED.keys()


def move_right():
    actions.edit.right()


def move_left():
    actions.edit.left()


def move_up():
    actions.edit.up()


def move_down():
    actions.edit.down()


def move_down_right():
    actions.edit.down()
    actions.edit.right()


def move_up_left():
    actions.edit.up()
    actions.edit.left()


def select_right():
    actions.edit.extend_right()


def select_left():
    actions.edit.extend_left()


def select_up():
    actions.edit.extend_line_up()


def select_down():
    actions.edit.extend_line_down()


def back_off_move():
    global continuous_movement_job
    if not continuous_movement_job:
        return
    for _ in range(continuous_movement_job.current_step_size):
        continuous_movement_job.movement_type()
    continuous_movement_job.current_step_size = math.ceil(
        continuous_movement_job.current_step_size / 2
    )


MOVEMENT_TYPE: dict[str, tuple[callable, int]] = {
    "flies": (move_up, 3),
    "swoops": (move_up_left, 3),
    "falls": (move_down, 3),
    "drifts": (move_down_right, 3),
    "steppies": (move_right, 0),
    "slinkies": (move_left, 0),
    "dusts": (select_up, 1),
    "sweeps": (select_down, 1),
    "snatchies": (select_right, 0),
    "chancies": (select_left, 0),
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

    continuous_movement_job.current_job = cron.interval(
        MOVEMENT_SPEEDS[continuous_movement_job.repeat_speed], back_off_move
    )


def move_faster():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = max(
            0, continuous_movement_job.repeat_speed - 1
        )
        restart_movement_job()


def move_slower():
    global continuous_movement_job
    if continuous_movement_job:
        continuous_movement_job.repeat_speed = min(
            len(MOVEMENT_SPEEDS) - 1, continuous_movement_job.repeat_speed + 1
        )
        restart_movement_job()


def restart_movement_job():
    if continuous_movement_job is None:
        return
    stop_moving()
    continuous_movement_job.current_job = cron.interval(
        MOVEMENT_SPEEDS[continuous_movement_job.repeat_speed], back_off_move
    )


def stop_moving():
    global continuous_movement_job
    if continuous_movement_job and continuous_movement_job.current_job:
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
