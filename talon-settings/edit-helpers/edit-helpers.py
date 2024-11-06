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
REPEAT_SPEED = {"one": "100ms", "two": "200ms", "three": "500ms", "four": "1s"}
ctx.lists["user.repeat_speed"] = REPEAT_SPEED.keys()


def move_right():
    actions.edit.right()


def move_left():
    actions.edit.left()


def move_up():
    actions.edit.up()


def move_down():
    actions.edit.down()


def select_right():
    actions.edit.extend_right()


def select_left():
    actions.edit.extend_left()


def select_up():
    actions.edit.extend_line_up()


def select_down():
    actions.edit.extend_line_down()


MOVEMENT_TYPE: dict[str, tuple[callable, str]] = {
    "flies": (move_up, "500ms"),
    "falls": (move_down, "500ms"),
    "steps": (move_right, "100ms"),
    "slinks": (move_left, "100ms"),
    "dusts": (select_up, "200ms"),
    "sweeps": (select_down, "200ms"),
    "snatches": (select_right, "100ms"),
    "chances": (select_left, "100ms"),
}
ctx.lists["user.continuous_movement_type"] = MOVEMENT_TYPE.keys()


@mod.capture(rule="{user.continuous_movement_type} [{user.repeat_speed}]")
def movement_type(m) -> tuple[callable, str]:
    if hasattr(m, "repeat_speed"):
        return (
            MOVEMENT_TYPE[m.continuous_movement_type][0],
            REPEAT_SPEED[m.repeat_speed],
        )
    return MOVEMENT_TYPE[m.continuous_movement_type]


@mod.capture(rule="{user.repeat_speed}")
def repeat_speed(m) -> str:
    return REPEAT_SPEED[m.repeat_speed]


def start_moving(interval: str, move_action: callable):
    global continuous_movement_job
    stop_moving()

    continuous_movement_job = cron.interval(interval, move_action)


def stop_moving():
    global continuous_movement_job
    if continuous_movement_job:
        cron.cancel(continuous_movement_job)


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

    def start_moving(movement_type: tuple[callable, str]):
        """Start moving continuously"""
        start_moving(movement_type[1], movement_type[0])

    def stop_moving():
        """Stop moving continuously"""
        stop_moving()
