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
REPEAT_SPEED = {"hyper": "100ms", "fast": "200ms", "mid": "500ms", "slow": "1s"}
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
        continuous_movement_job.movement_type()  # Ensure movement_type is a callable
    continuous_movement_job.current_step_size = math.ceil(
        continuous_movement_job.current_step_size / 2
    )
    # def backoff_move() -> None:
    #     nonlocal number_small
    #     global repeat_count
    #     current_step_size = math.ceil(number_small / (2**repeat_count))
    #     print(f"moving {current_step_size} times")
    #     for _ in range(number_small):
    #         movement_type()  # Ensure movement_type is a callable


MOVEMENT_TYPE: dict[str, tuple[callable, str]] = {
    "flies": (move_up, "500ms"),
    "swoops": (move_up_left, "500ms"),
    "falls": (move_down, "500ms"),
    "drifts": (move_down_right, "500ms"),
    "steppies": (move_right, "100ms"),
    "slinkies": (move_left, "100ms"),
    "dusts": (select_up, "200ms"),
    "sweeps": (select_down, "200ms"),
    "snatches": (select_right, "100ms"),
    "chances": (select_left, "100ms"),
}
ctx.lists["user.continuous_movement_type"] = MOVEMENT_TYPE.keys()


@dataclass
class MovementConfig:
    movement_type: callable
    repeat_speed: str
    current_step_size: int
    current_job: any


@mod.capture(
    rule="{user.continuous_movement_type} [{user.repeat_speed}] [taper <number_small>]"
)
def movement_type(m) -> MovementConfig:
    movement_type: callable = MOVEMENT_TYPE[m.continuous_movement_type][0]
    repeat_speed: str = MOVEMENT_TYPE[m.continuous_movement_type][1]
    number_small = 1

    if hasattr(m, "repeat_speed"):
        repeat_speed = REPEAT_SPEED[m.repeat_speed]

    if hasattr(m, "number_small"):
        number_small = m.number_small

    return MovementConfig(movement_type, repeat_speed, number_small, None)


@mod.capture(rule="{user.repeat_speed}")
def repeat_speed(m) -> str:
    return REPEAT_SPEED[m.repeat_speed]


def start_moving(movement_config: MovementConfig):
    global continuous_movement_job
    stop_moving()
    continuous_movement_job = movement_config

    continuous_movement_job.current_job = cron.interval(
        continuous_movement_job.repeat_speed, back_off_move
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

    def set_taper_step(taper_amount: int):
        """Set the next taper step amount"""
        global continuous_movement_job
        if continuous_movement_job is None:
            return
        continuous_movement_job.current_step_size = taper_amount

    def stop_moving():
        """Stop moving continuously"""
        stop_moving()
