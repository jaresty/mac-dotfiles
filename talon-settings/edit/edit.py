from enum import Enum
from dataclasses import dataclass
import random
import re
from talon import Context, Module, actions

ctx = Context()
mod = Module()
global last_located_character
last_located_character = " "


# this class keeps track of all of its subclasses
class Move:
    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        cls._subclasses.append(cls)

    _subclasses = []

    # in the initializer it takes a string name for a method that it will call later
    def __init__(self, invoke_function: str):
        self.invoke_function = invoke_function

    # when you call the invoke method it calls the method by the name
    def invoke(self):
        method = getattr(self, self.invoke_function)
        print(f"Invoking {self.invoke_function} on {self.__class__.__name__}")
        if callable(method):
            return method()
        else:
            raise ValueError(f"{self.invoke_function} is not a callable method")


# this subclass of the move class is foregoing to the right
class MoveRight(Move):
    # this static method is the name that will be used to invoke this class wen using talon to invoke by voice. I could also be used to print a textual name for this class
    @staticmethod
    def name():
        return "food"

    def move(self):
        actions.edit.right()


# this iterates over all of the subclasses of the move class and then all of the instance methods on the subclass
# it generates a dictionary which looks something like: {"move ong": lambda : MoveRight("move")}
move_rules = {}
for subclass in Move._subclasses:
    # fix: this should ignore static methods
    for method_name in dir(subclass):
        if not method_name.startswith("_") and callable(getattr(subclass, method_name)):
            # Check if the method is defined in the subclass, not inherited
            if method_name in subclass.__dict__:
                method = getattr(subclass, method_name)
                # Ignore static methods by checking if method is a staticmethod in the class dict
                if not isinstance(subclass.__dict__.get(method_name), staticmethod):
                    move_rules[f"{method_name} {subclass.name()}"] = (
                        lambda mn=method_name: subclass(mn)
                    )

mod.list(
    "movement_command",
    "A movement command",
)
# that the movement command list equals keys of the move rules
ctx.lists["user.movement_command"] = move_rules.keys()

# class MovementCommand(Enum):
#     ROG = "rog"
#     ONG = "ong"
#     JOG = "jog"
#     FOG = "fog"
#     DIG = "dig"
#     BOG = "bog"
#     ROGGER = "rogger"
#     ONGER = "onger"
#     FOGGER = "fogger"
#     DIGGER = "digger"
#     ROGOOM = "rogoom"
#     ONGOOM = "ongoom"
#     BOGOOM = "bogoom"
#     ROGGY = "roggy"
#     ONGY = "ongy"
#     ONT = "ont"
#     RET = "ret"
#     TAP = "tap"
#     TAPPER = "tapper"


@mod.capture(rule="{user.movement_command}")
def move(m) -> Move:
    return move_rules[m.movement_command]()


def locate_character(line_text: str, character: str, offset: int):
    global last_located_character
    if len(character) == 0:
        character = last_located_character
    last_located_character = character
    return line_text.lower().find(character) + offset


def locate_paint(line_text: str, offset: int):
    pattern = r"(\S\s+\S)"
    matches = re.search(pattern, line_text)
    if matches is None:
        return len(line_text)
    elif offset == 1:
        return matches.end() - 1
    else:
        return matches.start() + 1


@mod.action_class
class Actions:
    def poke_keys(keys: list[str] = ["space"]):
        """Insert these keys one to the right of the cursor position"""
        for key in keys:
            actions.key(key)
        for key in keys:
            actions.edit.left()

    def repoke_keys(keys: list[str] = ["space"]):
        """Insert these keys one to the left of the cursor position"""
        actions.edit.left()
        for key in keys:
            actions.key(key)
        for key in keys:
            actions.edit.right()

    def poker_keys(keys: str = ""):
        """Insert these keys on the next line after the cursor position"""
        actions.key("enter")
        actions.key(keys)
        actions.edit.up()
        actions.edit.line_end()

    def go_next_character(character: str, offset: int):
        """Move the cursor to the next character specified"""
        actions.edit.extend_line_end()
        line_end_text = actions.edit.selected_text()
        actions.edit.left()
        index_of_character = locate_character(line_end_text, character, offset)

        for _ in range(index_of_character):
            actions.edit.right()

    def go_previous_character(character: str, offset: int):
        """Move the cursor to the previous character specified"""
        actions.edit.extend_line_start()
        line_start_text = actions.edit.selected_text()[::-1]
        actions.edit.right()
        index_of_character = locate_character(line_start_text, character, offset)

        for _ in range(index_of_character):
            actions.edit.left()

    def go_next_paint(offset: int):
        """Go to the next whitespace to limited word"""
        actions.edit.extend_line_end()
        actions.sleep("50ms")
        line_end_text = actions.edit.selected_text()
        actions.edit.left()
        index_of_character = locate_paint(line_end_text, offset)

        for _ in range(index_of_character):
            actions.edit.right()

    def go_previous_paint(offset: int):
        """Go to the previous whitespace to limited word"""
        actions.edit.extend_line_start()
        actions.sleep("50ms")
        line_start_text = actions.edit.selected_text()[::-1]
        actions.edit.right()
        index_of_character = locate_paint(line_start_text, offset)

        for _ in range(index_of_character):
            actions.edit.left()

    def select_to_next_character(character: str, offset: int):
        """Select to the next character specified"""
        initially_selected_text = actions.edit.selected_text()
        initial_position = len(initially_selected_text) + 1

        actions.edit.extend_line_end()
        actions.sleep("50ms")
        line_end_text = actions.edit.selected_text()

        if initial_position > len(line_end_text):
            initial_position = 0
        additional_text = line_end_text[initial_position:]

        actions.edit.left()
        index_of_character = locate_character(additional_text, character, offset)

        for _ in range(initial_position + index_of_character):
            actions.edit.extend_right()

    def select_to_previous_character(character: str, offset: int):
        """Select to the previous character specified"""
        initially_selected_text = actions.edit.selected_text()
        initial_position = len(initially_selected_text) + 1
        actions.edit.extend_line_start()
        actions.sleep("50ms")
        line_start_text = actions.edit.selected_text()[::-1]

        if initial_position > len(line_start_text):
            initial_position = 0
        additional_text = line_start_text[initial_position:]
        actions.edit.right()
        index_of_character = locate_character(additional_text, character, offset)

        for _ in range(initial_position + index_of_character):
            actions.edit.extend_left()

    def select_to_next_paint(offset: int):
        """Select to the next paint"""
        initially_selected_text = actions.edit.selected_text()
        initial_position = len(initially_selected_text) + 1

        actions.edit.extend_line_end()
        actions.sleep("50ms")
        line_end_text = actions.edit.selected_text()

        if initial_position > len(line_end_text):
            initial_position = 0
        additional_text = line_end_text[initial_position:]

        actions.edit.left()
        index_of_character = locate_paint(additional_text, offset)

        for _ in range(initial_position + index_of_character):
            actions.edit.extend_right()

    def select_to_previous_paint(offset: int):
        """Select to the previous paint"""
        initially_selected_text = actions.edit.selected_text()
        initial_position = len(initially_selected_text) + 1
        actions.edit.extend_line_start()
        actions.sleep("50ms")
        line_start_text = actions.edit.selected_text()[::-1]

        if initial_position > len(line_start_text):
            initial_position = 0
        additional_text = line_start_text[initial_position:]
        actions.edit.right()
        index_of_character = locate_paint(additional_text, offset)

        for _ in range(initial_position + index_of_character):
            actions.edit.extend_left()

    def delete_to_next_character(character: str, offset: int):
        """Move the cursor to the next character specified"""
        actions.edit.extend_line_end()
        line_end_text = actions.edit.selected_text()
        actions.edit.left()
        index_of_character = locate_character(line_end_text, character, offset)

        for _ in range(index_of_character):
            actions.key("delete")

    def delete_to_previous_character(character: str, offset: int):
        """Move the cursor to the previous character specified"""
        actions.edit.extend_line_start()
        line_start_text = actions.edit.selected_text()[::-1]
        actions.edit.right()
        index_of_character = locate_character(line_start_text, character, offset)

        for _ in range(index_of_character):
            actions.key("backspace")

    def delete_to_next_paint(offset: int):
        """Move the cursor to the next character specified"""
        actions.edit.extend_line_end()
        line_end_text = actions.edit.selected_text()
        actions.edit.left()
        index_of_character = locate_paint(line_end_text, offset)

        for _ in range(index_of_character):
            actions.key("delete")

    def delete_to_previous_paint(offset: int):
        """Move the cursor to the previous character specified"""
        actions.edit.extend_line_start()
        line_start_text = actions.edit.selected_text()[::-1]
        actions.edit.right()
        index_of_character = locate_paint(line_start_text, offset)

        for _ in range(index_of_character):
            actions.key("backspace")

    def insert_next_homophone(should_select: bool = False):
        """Inserts the next homophone in the based on the current selection"""
        homophone = actions.edit.selected_text()
        homophone_candidates = actions.user.homophones_get(homophone)
        next_candidate_index = (homophone_candidates.index(homophone) + 1) % len(
            homophone_candidates
        )
        actions.insert(homophone_candidates[next_candidate_index])
        if should_select:
            actions.user.select_text_backward(
                homophone_candidates[next_candidate_index]
            )

    def random_repeat(maximum: int):
        """Repeat up to the specified number of times"""
        times = random.randint(1, maximum)
        actions.core.repeat_partial_phrase(times)

    def invoke_move(move: Move):
        """Invoke the move"""
        move.invoke()
