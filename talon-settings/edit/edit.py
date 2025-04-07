import re
from talon import Context, Module, actions

ctx = Context()
mod = Module()
global last_located_character
last_located_character = " "


@mod.capture(rule="<user.spoken_text_search>| <user.cursorless_formatted>")
def spoken_search(m) -> str:
    if hasattr(m, "spoken_text_search"):
        return m.spoken_text_search
    elif hasattr(m, "cursorless_formatted"):
        return m.cursorless_formatted
    return ""


@mod.capture(
    rule="<user.formatted_text> | <user.formatted_paste> | <user.last_phrase> | spell <user.letters> | brief {user.abbreviation}"
)
def spoken_text_search(m) -> str:
    if hasattr(m, "formatted_text"):
        return m.formatted_text
    elif hasattr(m, "formatted_paste"):
        return m.formatted_paste
    elif hasattr(m, "last_phrase"):
        return m.last_phrase
    elif hasattr(m, "letters"):
        return m.letters
    elif hasattr(m, "abbreviation"):
        return m.abbreviation
    return ""


@mod.capture(rule="bring [<user.formatters>] <user.cursorless_target>")
def cursorless_formatted(m) -> str:
    target_text = actions.user.cursorless_get_text(m.cursorless_target)
    if hasattr(m, "formatters"):
        return actions.user.reformat_text(target_text, m.formatters)

    return target_text


@mod.capture(rule="say <user.text>")
def formatted_text(m) -> str:
    return m.text


@mod.capture(rule="<user.formatters> paste")
def formatted_paste(m) -> str:
    return actions.user.reformat_text(actions.clip.text(), m.formatters)


@mod.capture(rule="echo")
def last_phrase(_) -> str:
    return actions.user.get_last_phrase()


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
