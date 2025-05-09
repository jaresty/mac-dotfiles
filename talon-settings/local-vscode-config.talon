app: vscode
-
settings():
  user.paste_to_insert_threshold = 10

diff <user.cursorless_target> with <user.cursorless_target>:
  user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
  user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

exec <user.cursorless_target>:
  x = user.cursorless_get_text(cursorless_target)
  user.vscode("workbench.action.terminal.focus")
  insert(x)

disk files: user.vscode("workbench.action.files.saveFiles")
crumb tap: user.vscode("breadcrumbs.focusAndSelect")

met ex:
  key(tab)
git log:
  user.vscode("gitlens.showGraph")

curse rejog: user.vscode("cursorUndo")
curse jog: user.vscode("cursorRedo")

pit jog: user.vscode("workbench.action.focusNextGroup")
bar type tree: user.vscode("workbench.view.extension.typescript-explorer")
run build: user.vscode("workbench.action.tasks.build")
run test: user.vscode("workbench.action.tasks.test")
run test again: user.vscode("testing.reRunLastRun")

mob start:
  user.vscode("workbench.action.quickOpen")
  insert("task mob start\n")

mob next:
  user.vscode("workbench.action.quickOpen")
  insert("task mob next\n")

mob done:
  user.vscode("workbench.action.quickOpen")
  insert("task mob done\n")

flash <user.cursorless_target>: user.cursorless_get_text_list(cursorless_target)
wax <user.cursorless_target>:
  user.cursorless_command("setSelection", cursorless_target)
  user.vscode("editor.action.smartSelect.expand")

wax jog: user.wax()
wax rejog: user.wane()

context tap: user.vscode("editor.action.showContextMenu")

prob [<user.text>] tap:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] jog:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)
prob [<user.text>] ontap:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] retap:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] onjog:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)
prob [<user.text>] rejog:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)

change jog: key(alt-f5)
change rejog: key(shift-alt-f5)

error jog: user.vscode("editor.action.marker.next")
error rejog: user.vscode("editor.action.marker.prev")

refer jog: key(f4)
refer rejog: key(shift-f4)

# Symbol search
tag [<user.text>] tap:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
^tag [<user.text>] tapper:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")

tag [<user.text>] jog:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
  sleep(300ms)
  key(enter)
^tag [<user.text>] joger:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")
  sleep(300ms)
  key(enter)

^text [<user.text>] tapper:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")
^text [<user.text>] tap:
  edit.find(text or "")

^text <user.text> joger:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")
  key(enter)

^text <user.text> jog:
  edit.find(user.formatted_text(text, "NO_SPACES"))
  edit.find_next()
  key("esc")
  edit.right()

^text <user.text> rejog:
  edit.find(user.formatted_text(text, "NO_SPACES"))
  edit.find_previous()
  edit.find_previous()
  key("esc")
  edit.right()

type tap: user.vscode("editor.action.peekTypeDefinition")
type hierarchy tap: user.vscode("editor.showTypeHierarchy")
param tap: user.vscode("editor.action.triggerParameterHints")

# File Commands
file [<user.text>] [{user.file_extension}] tap:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
file [<user.text>] [{user.file_extension}] jog:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(enter)

proj [<user.text>] tap:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)

proj [<user.text>] jog:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)
  key(enter)

change tap: user.vscode("editor.action.dirtydiff.next")
change retap: user.vscode("editor.action.dirtydiff.previous")

file forge:
  user.vscode("fileutils.duplicateFile")
file punch:
  user.vscode("fileutils.removeFile")
  sleep(150ms)

alter jog: user.vscode("alternate.alternateFile")
alter joger: user.vscode("alternate.createAlternateFile")
alter rejog: user.vscode("alternate.alternateFileInSplit")
alter rejoger: user.vscode("alternate.createAlternateFileInSplit")

nip jog: user.vscode("jumpToNextSnippetPlaceholder")
nip rejog: user.vscode("jumpToPrevSnippetPlaceholder")
nip {user.snippet}: user.insert_snippet_by_name(snippet)

nip {user.snippet_with_phrase} <user.text>:
  user.insert_snippet_by_name_with_phrase(snippet_with_phrase, text)

git jog: user.vscode("workbench.scm.action.focusNextInput")
git rejog: user.vscode("workbench.scm.action.focusPreviousInput")
git resource jog: user.vscode("workbench.scm.action.focusNextResourceGroup")
git resource rejog: user.vscode("workbench.scm.action.focusPreviousResourceGroup")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

debug jog: user.vscode("workbench.action.debug.jogOver")
debug dip jog: user.vscode("workbench.action.debug.jogInto")
debug fly jog: user.vscode("workbench.action.debug.jogOut")

mark jog: user.vscode("bookmarks.jumpToNext")
mark rejog: user.vscode("bookmarks.jumpToPrevious")

form <user.formatters> <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)
