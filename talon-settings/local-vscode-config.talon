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

curse rog: user.vscode("cursorUndo")
curse ong: user.vscode("cursorRedo")

pit ong: user.vscode("workbench.action.focusNextGroup")
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

wax ong: user.wax()
wax rog: user.wane()

context tap: user.vscode("editor.action.showContextMenu")

prob [<user.text>] tap:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] ong:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)
prob [<user.text>] ont:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] ret:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] ong:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)
prob [<user.text>] rog:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)

change ong: key(alt-f5)
change rog: key(shift-alt-f5)

error ong: user.vscode("editor.action.marker.next")
error rog: user.vscode("editor.action.marker.prev")

refer ong: key(f4)
refer rog: key(shift-f4)

# Symbol search
tag [<user.text>] tap:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
^tag [<user.text>] tapper:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")

tag [<user.text>] ong:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
  sleep(300ms)
  key(enter)
^tag [<user.text>] onger:
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

^text <user.text> onger:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")
  key(enter)

^text <user.text> ong:
  edit.find(user.formatted_text(text, "NO_SPACES"))
  edit.find_next()
  key("esc")
  edit.right()

^text <user.text> rog:
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
file [<user.text>] [{user.file_extension}] ong:
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

proj [<user.text>] ong:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)
  key(enter)

change ont: user.vscode("editor.action.dirtydiff.next")
change ret: user.vscode("editor.action.dirtydiff.previous")

forge file:
  user.vscode("fileutils.duplicateFile")
kick file:
  user.vscode("fileutils.removeFile")
  sleep(150ms)

alter ong: user.vscode("alternate.alternateFile")
alter onger: user.vscode("alternate.createAlternateFile")
alter rog: user.vscode("alternate.alternateFileInSplit")
alter roger: user.vscode("alternate.createAlternateFileInSplit")

nip ong: user.vscode("jumpToNextSnippetPlaceholder")
nip rog: user.vscode("jumpToPrevSnippetPlaceholder")
nip {user.snippet}: user.insert_snippet_by_name(snippet)

nip {user.snippet_with_phrase} <user.text>:
  user.insert_snippet_by_name_with_phrase(snippet_with_phrase, text)

git ong: user.vscode("workbench.scm.action.focusNextInput")
git rog: user.vscode("workbench.scm.action.focusPreviousInput")
git resource ong: user.vscode("workbench.scm.action.focusNextResourceGroup")
git resource rog: user.vscode("workbench.scm.action.focusPreviousResourceGroup")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

debug ong: user.vscode("workbench.action.debug.walkOver")
debug dig: user.vscode("workbench.action.debug.walkInto")
debug fog: user.vscode("workbench.action.debug.walkOut")

mark ong: user.vscode("bookmarks.jumpToNext")
mark rog: user.vscode("bookmarks.jumpToPrevious")

form <user.formatters> <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)
