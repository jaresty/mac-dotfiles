app: vscode
-
settings():
  user.paste_to_insert_threshold = 10

diff <user.cursorless_target> with <user.cursorless_target>:
  user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
  user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

disk files: user.vscode("workbench.action.files.saveFiles")
crumb tap: user.vscode("breadcrumbs.focusAndSelect")

met ex:
  key(tab)
git log:
  user.vscode("gitlens.showGraph")

curse rewalk: user.vscode("cursorUndo")
curse walk: user.vscode("cursorRedo")

split walk: user.vscode("workbench.action.focusNextGroup")
bar type tree: user.vscode("workbench.view.extension.typescript-explorer")
run build: user.vscode("workbench.action.tasks.build")
run test: user.vscode("workbench.action.tasks.test")

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

wax walk: user.wax()
wax rewalk: user.wane()

context tap: user.vscode("editor.action.showContextMenu")

prob [<user.text>] tap:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
prob [<user.text>] walk:
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
prob [<user.text>] onwalk:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)
prob [<user.text>] rewalk:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  insert(text or "")
  key(enter)

change walk: key(alt-f5)
change rewalk: key(shift-alt-f5)

failure walk: user.vscode("testing.goToNextMessage")
failure rewalk: user.vscode("testing.goToPreviousMessage")

refer walk: key(f4)
refer rewalk: key(shift-f4)

# Symbol search
symbol [<user.text>] tappy:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
^symbol [<user.text>] tap:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")

symbol [<user.text>] walky:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
  sleep(300ms)
  key(enter)
^symbol [<user.text>] walk:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")
  sleep(300ms)
  key(enter)

^text [<user.text>] tap:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")
^text [<user.text>] tappy:
  edit.find()
  sleep(50ms)
  insert(text or "")

^text [<user.text>] walk:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")
  key(enter)
^text [<user.text>] walky:
  edit.find()
  sleep(50ms)
  insert(text or "")
  key(enter)

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
file [<user.text>] [{user.file_extension}] walk:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(enter)

project [<user.text>] tap:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)

project [<user.text>] walk:
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

alter walk: user.vscode("alternate.alternateFile")
alter walker: user.vscode("alternate.createAlternateFile")
alter rewalk: user.vscode("alternate.alternateFileInSplit")
alter rewalker: user.vscode("alternate.createAlternateFileInSplit")

snip walk: user.vscode("jumpToNextSnippetPlaceholder")
snip rewalk: user.vscode("jumpToPrevSnippetPlaceholder")

git walk: user.vscode("workbench.scm.action.focusNextInput")
git rewalk: user.vscode("workbench.scm.action.focusPreviousInput")
git resource walk: user.vscode("workbench.scm.action.focusNextResourceGroup")
git resource rewalk: user.vscode("workbench.scm.action.focusPreviousResourceGroup")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

debug walk: user.vscode("workbench.action.debug.walkOver")
debug dip walk: user.vscode("workbench.action.debug.walkInto")
debug fly walk: user.vscode("workbench.action.debug.walkOut")

mark walk: user.vscode("bookmarks.jumpToNext")
mark rewalk: user.vscode("bookmarks.jumpToPrevious")

form <user.formatters> <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)
