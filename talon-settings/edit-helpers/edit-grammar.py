from dataclasses import dataclass
from talon import Context, Module, actions

ctx = Context()
mod = Module()
mod.list(
    "vertical_direction",
    "The direction of vertical movement",
)
mod.list(
    "horizontal_direction",
    "The direction of horizontal movement",
)
mod.list(
    "horizontal_degree",
    "The degree of horizontal movement",
)

mod.list(
    "action_commands",
    "The commands to do once the selection is set",
)


def do_nothing():
    pass


SELECTION_MAP = {
    "UP": {
        False: actions.edit.extend_line_down,
        True: actions.edit.extend_line_up,
    },
    "CHARACTER": {
        True: actions.edit.extend_right,
        False: actions.edit.extend_left,
    },
    "WORD": {
        True: actions.edit.extend_word_right,
        False: actions.edit.extend_word_left,
    },
    "LINE": {
        True: actions.edit.extend_line_end,
        False: actions.edit.extend_line_start,
    },
}

VERTICAL_DIRECTION = {
    "dip": ["UP", False],
    "fly": ["UP", True],
}
HORIZONTAL_DIRECTION = {
    "on": {"y": ["CHARACTER", True], "er": ["LINE", True], "": ["WORD", True]},
    "re": {"y": ["CHARACTER", False], "er": ["LINE", False], "": ["WORD", False]},
}
ACTION_COMMANDS = {"chance": do_nothing}
ctx.lists["user.vertical_direction"] = VERTICAL_DIRECTION.keys()
ctx.lists["user.horizontal_direction"] = HORIZONTAL_DIRECTION.keys()
ctx.lists["user.action_commands"] = ACTION_COMMANDS.keys()
ctx.lists["user.horizontal_degree"] = ["y", "er"]


@dataclass
class SelectionActionConfiguration:
    set_selection: callable
    perform_action: callable


@mod.capture(
    rule="[{user.vertical_direction}] {user.horizontal_direction} {user.action_commands}[{user.horizontal_degree}]"
)
def selection_action(m) -> SelectionActionConfiguration:
    vertical_step = do_nothing
    vertical_ex_toggle = False
    horizontal_degree = ""
    if hasattr(m, "vertical_direction"):
        vertical_ex_toggle = VERTICAL_DIRECTION[m.vertical_direction][1]
        vertical_step = SELECTION_MAP[VERTICAL_DIRECTION[m.vertical_direction][0]][
            vertical_ex_toggle
        ]
    if hasattr(m, "horizontal_degree"):
        horizontal_degree = m.horizontal_degree

    horizontal_ex_toggle = HORIZONTAL_DIRECTION[m.horizontal_direction][
        horizontal_degree
    ][1]
    horizontal_step = SELECTION_MAP[
        HORIZONTAL_DIRECTION[m.horizontal_direction][horizontal_degree][0]
    ][horizontal_ex_toggle ^ vertical_ex_toggle]

    def set_selection():
        vertical_step()
        horizontal_step()

    return SelectionActionConfiguration(
        set_selection, ACTION_COMMANDS[m.action_commands]
    )


# SELECTION_METHODS = {
#     "UP": {
#         "NEXT_CHARACTER": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_left(),
#         ),
#         "NEXT_WORD": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_word_left(),
#         ),
#         "LINE_END": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_line_start(),
#         ),
#         "LAST_CHARACTER": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_right(),
#         ),
#         "LAST_WORD": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_word_right(),
#         ),
#         "LINE_START": lambda: (
#             actions.edit.extend_up(),
#             actions.edit.extend_line_end(),
#         ),
#     },
#     "RIGHT": {
#         "NEXT_CHARACTER": actions.edit.extend_right,
#         "NEXT_WORD": actions.edit.extend_word_right,
#         "LINE_END": actions.edit.extend_line_end,
#         "LAST_CHARACTER": actions.edit.extend_left,
#         "LAST_WORD": actions.edit.extend_word_left,
#         "LINE_START": actions.edit.extend_line_start,
#     },
#     "LEFT": {
#         "NEXT_CHARACTER": actions.edit.extend_left,
#         "NEXT_WORD": actions.edit.extend_word_left,
#         "LINE_END": actions.edit.extend_line_start,
#         "LAST_CHARACTER": actions.edit.extend_right,
#         "LAST_WORD": actions.edit.extend_word_right,
#         "LINE_START": actions.edit.extend_line_end,
#     },
#     "UP": {
#         "NEXT_CHARACTER": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_right(),
#         ),
#         "NEXT_WORD": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_word_right(),
#         ),
#         "LINE_END": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_line_end(),
#         ),
#         "LAST_CHARACTER": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_left(),
#         ),
#         "LAST_WORD": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_word_left(),
#         ),
#         "LINE_START": lambda: (
#             actions.edit.extend_down(),
#             actions.edit.extend_line_start(),
#         ),
#     },
# }


# SELECTION_DIRECTIONS = {
#     "fly": "UP",
#     "dip": "UP",
#     "on": "RIGHT",
#     "re": "LEFT",
# }
# SELECTION_EXTENTS = {
#     "y": {
#         "fly": "NEXT_CHARACTER",
#         "dip": "LAST_CHARACTER",
#         "on": "NEXT_CHARACTER",
#         "re": "LAST_CHARACTER",
#     },
#     "fly": "NEXT_WORD",
#     "dip": "LAST_WORD",
#     "on": "NEXT_WORD",
#     "re": "LAST_WORD",
#     "er": {
#         "fly": "",
#         "dip": "LAST_CHARACTER",
#         "on": "NEXT_CHARACTER",
#         "re": "LAST_CHARACTER",
#     },
#     "y": {
#         "fly": "NEXT_CHARACTER",
#         "dip": "LAST_CHARACTER",
#         "on": "NEXT_CHARACTER",
#         "re": "LAST_CHARACTER",
#     },
# }


@mod.action_class
class Actions:
    def selection_action(selection_action: SelectionActionConfiguration):
        """Run an action on a selection after adjusting"""
        selection_action.set_selection()
        selection_action.perform_action()
