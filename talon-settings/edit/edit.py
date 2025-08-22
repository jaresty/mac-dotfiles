import random
import re
from typing import Union
from talon import Context, Module, actions

ctx = Context()
mod = Module()
global last_located_character
last_located_character = " "
global last_move


# this class keeps track of all of its subclasses
class Move:
    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        # ignores subclasses that do not have an abstract method called name
        if not hasattr(cls, "name"):
            return
        cls._subclasses.append(cls)

    _subclasses = []

    # in the initializer it takes a string name for a method that it will call later
    def __init__(self, invoke_function: str):
        self.invoke_function = invoke_function

    def _flip_instance(self, new_verb: str):
        if new_verb == "veer":
            new_verb = self.invoke_function

        opposite_command = f"{new_verb} {self.__class__.__flip_name__()}"
        return movement_instance(opposite_command)

    @classmethod
    def __flip_name__(cls):
        """This method should be overridden by subclasses to provide a flip name."""
        raise NotImplementedError("Subclasses must implement __flip_name__ method.")

    # when you call the invoke method it calls the method by the name
    def _invoke(self):
        method = getattr(self, self.invoke_function)
        print(f"Invoking {self.invoke_function} on {self.__class__.__name__}")
        if callable(method):
            return method()
        else:
            raise ValueError(f"{self.invoke_function} is not a callable method")


class Tap(Move):
    @staticmethod
    def name():
        return "tap"

    def clip(self):
        actions.key("cmd-alt-ctrl-shift-v")

    def reef(self):
        actions.user.tap_reference()

    def context(self):
        actions.key("ctrl-enter")


class AbstractMove(Move):
    def pick(self):
        pass

    def veer(self):
        global last_move
        self.invoke_function = last_move.invoke_function
        self._invoke()

    def lift(self):
        self.pick()
        actions.edit.cut()

    def zap(self):
        self.pick()
        actions.key("delete")

    def plant(self):
        self.pick()
        actions.edit.paste()

    def mem(self):
        self.pick()
        actions.edit.copy()

    def forge(self):
        self.pick()
        actions.edit.selection_clone()


class VeerMove(Move):
    @staticmethod
    def name():
        return "veer"

    def zap(self):
        pass

    def pick(self):
        pass

    def phones(self):
        pass

    def go(self):
        pass

    def hop(self):
        pass

    def nav(self):
        pass

    def hunt(self):
        pass

    def zoom(self):
        pass

    def folding(self):
        pass

    def look(self):
        pass

    def pok(self):
        pass

    def reef(self):
        pass

    def tag(self):
        pass

    def numeric(self):
        pass


class NeutralMove(AbstractMove):
    @staticmethod
    def name():
        return "jog"

    def zap(self):
        actions.key("delete")

    def pick(self):
        pass

    def phones(self):
        actions.user.insert_next_homophone(True)


class SmallMoveRight(AbstractMove):
    @staticmethod
    def name():
        return "ongy"

    @classmethod
    def __flip_name__(cls):
        return "roggy"

    def go(self):
        actions.edit.right()

    def zap(self):
        actions.key("delete")

    def pick(self):
        actions.key("shift-right")


class MoveRight(AbstractMove):
    @staticmethod
    def name():
        return "ong"

    @classmethod
    def __flip_name__(cls):
        return "rog"

    def go(self):
        actions.edit.word_right()

    def pick(self):
        actions.edit.extend_word_right()

    def hop(self):
        actions.edit.select_word()
        actions.sleep("100ms")
        dodge_word = actions.edit.selected_text()
        actions.edit.delete()
        actions.edit.extend_word_right()
        actions.edit.extend_word_left()
        actions.sleep("100ms")
        spacer = actions.edit.selected_text()
        actions.edit.delete()
        self.go()
        actions.insert(f"{spacer}{dodge_word}")

    def nav(self):
        actions.user.go_forward()

    def hunt(self):
        actions.edit.find_next()

    def zoom(self):
        actions.edit.zoom_in()

    def folding(self):
        actions.user.fold_more()

    def look(self):
        actions.user.mouse_scroll_right()

    def pok(self):
        actions.user.poke_keys()

    def phones(self):
        self.pick()
        actions.user.insert_next_homophone()
        actions.edit.word_left()

    def reef(self):
        actions.user.last_reference()

    def tag(self):
        actions.mimic("pre next click this")

    def numeric(self):
        actions.user.numeric_increment()

    def tab(self):
        actions.app.tab_next()

    def pit(self):
        actions.user.split_next()

    def wax(self):
        actions.user.wax()

    def nip(self):
        actions.user.move_cursor_to_next_snippet_stop()

    def patch(self):
        actions.user.patch_forward()


class MovePaintRight(AbstractMove):
    @staticmethod
    def name():
        return "paint ong"

    @classmethod
    def __flip_name__(cls):
        return "paint rog"

    def go(self):
        actions.user.go_next_paint(1)

    def pick(self):
        actions.user.select_to_next_paint(1)


class MovePaintLeft(AbstractMove):
    @staticmethod
    def name():
        return "paint rog"

    @classmethod
    def __flip_name__(cls):
        return "paint ong"

    def go(self):
        actions.user.go_previous_paint(1)

    def pick(self):
        actions.user.select_to_previous_paint(1)


class MoveWayRight(AbstractMove):
    @staticmethod
    def name():
        return "onger"

    @classmethod
    def __flip_name__(cls):
        return "rogger"

    def go(self):
        actions.edit.line_end()

    def pick(self):
        actions.edit.extend_line_end()

    def pok(self):
        actions.user.poker_keys()

    def forge(self):
        self.pick()
        selection = actions.edit.selected_text()
        actions.edit.line_insert_down()
        actions.insert(selection)
        actions.edit.line_start()


class MoveChunkRight(AbstractMove):
    @staticmethod
    def name():
        return "ongeroom"

    @classmethod
    def __flip_name__(cls):
        return "roggeroom"

    def go(self):
        actions.edit.paragraph_end()

    def pick(self):
        actions.edit.extend_paragraph_end()


class MoveEndRight(AbstractMove):
    @staticmethod
    def name():
        return "ongoom"

    @classmethod
    def __flip_name__(cls):
        return "rogoom"

    def go(self):
        actions.edit.file_end()

    def pick(self):
        actions.edit.extend_file_end()


class SmallMoveLeft(AbstractMove):
    @staticmethod
    def name():
        return "roggy"

    @classmethod
    def __flip_name__(cls):
        return "ongy"

    def go(self):
        actions.edit.left()

    def zap(self):
        actions.key("backspace")

    def pick(self):
        actions.key("shift-left")


class MoveLeft(AbstractMove):
    @staticmethod
    def name():
        return "rog"

    @classmethod
    def __flip_name__(cls):
        return "ong"

    def go(self):
        actions.edit.word_left()

    def pick(self):
        actions.edit.extend_word_left()

    def hop(self):
        actions.edit.select_word()
        actions.sleep("100ms")
        dodge_word = actions.edit.selected_text()
        actions.edit.delete()
        actions.edit.extend_word_left()
        actions.edit.extend_word_right()
        actions.sleep("100ms")
        spacer = actions.edit.selected_text()
        actions.edit.delete()
        self.go()
        actions.insert(f"{dodge_word}{spacer}")

    def nav(self):
        actions.user.go_back()

    def hunt(self):
        actions.edit.find_previous()

    def zoom(self):
        actions.edit.zoom_out()

    def folding(self):
        actions.user.fold_less()

    def look(self):
        actions.user.mouse_scroll_left()

    def pok(self):
        actions.user.repoke_keys()

    def phones(self):
        self.pick()
        actions.user.insert_next_homophone()

    def reef(self):
        actions.user.next_reference()

    def tag(self):
        actions.mimic("pre last click this")

    def numeric(self):
        actions.user.numeric_decrement()

    def tab(self):
        actions.app.tab_previous()

    def pit(self):
        actions.user.split_last()

    def wax(self):
        actions.user.wane()

    def nip(self):
        actions.key("shift-tab")

    def patch(self):
        actions.user.patch_back()


class MoveWayLeft(AbstractMove):
    @staticmethod
    def name():
        return "rogger"

    @classmethod
    def __flip_name__(cls):
        return "onger"

    def go(self):
        actions.edit.line_start()

    def pick(self):
        actions.edit.extend_line_start()

    def forge(self):
        self.pick()
        selection = actions.edit.selected_text()
        actions.edit.line_insert_up()
        actions.insert(selection)


class MoveChunkLeft(AbstractMove):
    @staticmethod
    def name():
        return "roggeroom"

    @classmethod
    def __flip_name__(cls):
        return "ongeroom"

    def go(self):
        actions.edit.paragraph_start()

    def pick(self):
        actions.edit.extend_paragraph_start()


class MoveEndLeft(AbstractMove):
    @staticmethod
    def name():
        return "rogoom"

    @classmethod
    def __flip_name__(cls):
        return "ongoom"

    def go(self):
        actions.edit.file_start()

    def pick(self):
        actions.edit.extend_file_start()

    def zoom(self):
        actions.user.unfold_recursively()


class MoveBigBoth(AbstractMove):
    @staticmethod
    def name():
        return "bogger"

    def go(self):
        actions.user.line_middle()

    def zap(self):
        actions.edit.delete_line()

    def pick(self):
        actions.edit.select_line()

    def forge(self):
        actions.edit.line_clone()


class MoveSmallBoth(AbstractMove):
    @staticmethod
    def name():
        return "boggy"

    def zap(self):
        actions.key("delete")
        actions.key("backspace")

    def pick(self):
        actions.edit.extend_right()
        selected_text = actions.edit.selected_text()
        actions.edit.left()
        actions.edit.left()
        for _ in range(len(selected_text) + 1):
            actions.edit.extend_right()


class MoveBoth(AbstractMove):
    @staticmethod
    def name():
        return "bog"

    def go(self):
        self.pick()
        selected_text = actions.edit.selected_text()
        actions.edit.left()
        for _ in range(int(len(selected_text) / 2)):
            actions.edit.right()

    def zap(self):
        actions.key("alt-delete")
        actions.key("alt-backspace")

    def pick(self):
        actions.edit.select_word()


class MoveChunkBoth(AbstractMove):
    @staticmethod
    def name():
        return "bogeroom"

    def zap(self):
        actions.edit.delete_paragraph()

    def pick(self):
        actions.edit.select_paragraph()


class MoveMaxBoth(AbstractMove):
    @staticmethod
    def name():
        return "bogoom"

    def pick(self):
        actions.edit.select_all()


class MoveUp(AbstractMove):
    @staticmethod
    def name():
        return "fog"

    @classmethod
    def __flip_name__(cls):
        return "dig"

    def go(self):
        actions.edit.up()

    def pick(self):
        actions.edit.extend_up()

    def look(self):
        actions.user.mouse_scroll_up()

    def pok(self):
        actions.edit.line_insert_up()

    def plant(self):
        actions.edit.line_insert_up()
        actions.edit.paste()

    def hop(self):
        actions.edit.line_swap_up()


class MoveUpEnd(AbstractMove):
    @staticmethod
    def name():
        return "fogger"

    @classmethod
    def __flip_name__(cls):
        return "digger"

    def go(self):
        actions.edit.up()
        actions.edit.line_start()

    def pick(self):
        actions.edit.extend_up()
        actions.edit.extend_line_start()


class MoveDown(AbstractMove):
    @staticmethod
    def name():
        return "dig"

    @classmethod
    def __flip_name__(cls):
        return "fog"

    def go(self):
        actions.edit.down()

    def pick(self):
        actions.edit.extend_down()

    def look(self):
        actions.user.mouse_scroll_down()

    def hop(self):
        actions.edit.line_swap_down()

    def pok(self):
        actions.edit.line_insert_down()

    def plant(self):
        actions.edit.line_insert_down()
        actions.edit.paste()


class MoveDownEnd(AbstractMove):
    @staticmethod
    def name():
        return "digger"

    @classmethod
    def __flip_name__(cls):
        return "fogger"

    def go(self):
        actions.edit.down()
        actions.edit.line_end()

    def pick(self):
        actions.edit.extend_down()
        actions.edit.extend_line_end()

    def hop(self):
        actions.edit.line_swap_down()


class MovePoint(AbstractMove):
    @staticmethod
    def name():
        return "point"

    def pick(self):
        actions.mouse_click()
        actions.mouse_click()


class MoveBigPoint(AbstractMove):
    @staticmethod
    def name():
        return "pointer"

    def pick(self):
        actions.mouse_click()
        actions.mouse_click()
        actions.mouse_click()


class MoveAllPoint(AbstractMove):
    @staticmethod
    def name():
        return "pointoom"

    def pick(self):
        actions.mouse_click()
        actions.edit.select_all()


class MoveSplit(Move):
    @staticmethod
    def name():
        return "pit"

    def zap(self):
        actions.user.split_clear()

    def forge(self):
        actions.user.split_window()


class MoveAllSplit(Move):
    @staticmethod
    def name():
        return "pitoom"

    def zap(self):
        actions.user.split_clear_all()


class MoveTab(Move):
    @staticmethod
    def name():
        return "tab"

    def zap(self):
        actions.user.tab_close_wrapper()

    def forge(self):
        actions.user.tab_duplicate()

    def nop(self):
        actions.app.tab_reopen()


# this iterates over all of the subclasses of the move class and then all of the instance methods on the subclass
# it generates a dictionary which looks something like: {"move rog": lambda : MoveLeft("move")}
move_rules = {}
for subclass in Move._subclasses:
    # fix: this should ignore static methods
    for method_name in dir(subclass):
        if not method_name.startswith("_") and callable(getattr(subclass, method_name)):
            method = getattr(subclass, method_name)
            # Ignore static methods by checking if method is a staticmethod in the class dict
            if not isinstance(subclass.__dict__.get(method_name), staticmethod):
                move_rules[f"{method_name} {subclass.name()}"] = [
                    subclass,
                    method_name,
                ]
print(f"Move rules: {move_rules}")
mod.list(
    "movement_command",
    "A movement command",
)
mod.list(
    "movement_verbs",
    "movement verbs",
)
# that the movement command list equals keys of the move rules
ctx.lists["user.movement_command"] = move_rules.keys()
ctx.lists["user.movement_verbs"] = [
    "go",
    "pick",
    "lift",
    "zap",
    "plant",
    "mem",
    "forge",
    "phones",
    "hunt",
    "pok",
    "reef",
    "tag",
    "numeric",
    "tab",
    "pit",
    "wax",
    "veer",
]

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


def move_flop_instance(new_verb: str) -> Move:
    global last_move
    return last_move.__class__(new_verb)


def move_flip_instance(new_verb: str) -> Move:
    global last_move
    return last_move._flip_instance(new_verb)


@mod.capture(rule="{user.movement_verbs} flop")
def move_flop(m) -> Move:
    return move_flop_instance(m.movement_verbs)


@mod.capture(rule="{user.movement_verbs} flip")
def move_flip(m) -> Move:
    return move_flip_instance(m.movement_verbs)


@mod.capture(rule="{user.movement_command}|<user.move_flop>|<user.move_flip>")
def move(m) -> Move:
    if hasattr(m, "move_flop"):
        return m.move_flop
    elif hasattr(m, "move_flip"):
        return m.move_flip

    return movement_instance(m.movement_command)


def movement_instance(movement_command):
    return move_rules[movement_command][0](move_rules[movement_command][1])


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

    def random_number(maximum: int):
        """Insert a random number"""
        actions.insert(str(random.randint(1, maximum)))

    def invoke_move(
        move: Union[
            MoveAllPoint,
            MoveAllSplit,
            MoveBigBoth,
            MoveBigPoint,
            MoveBoth,
            MoveChunkBoth,
            MoveChunkLeft,
            MoveChunkRight,
            MoveDown,
            MoveDownEnd,
            MoveEndLeft,
            MoveEndRight,
            MoveLeft,
            MoveMaxBoth,
            MoveRight,
            MoveSmallBoth,
            MoveSmallBoth,
            MoveSplit,
            MoveTab,
            MoveUp,
            MoveUpEnd,
            MoveWayLeft,
            MoveWayRight,
            NeutralMove,
            SmallMoveLeft,
            SmallMoveRight,
            VeerMove,
        ],
    ):
        """Invoke the move"""
        global last_move
        move._invoke()
        last_move = move
