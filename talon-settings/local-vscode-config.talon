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

bless: user.vscode("cursorUndo")
recurse: user.vscode("cursorRedo")

split step: user.vscode("workbench.action.focusNextGroup")
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

wax step: user.wax()
wax restep: user.wane()

context tap: user.vscode("editor.action.showContextMenu")

prob [<user.prose>] tap:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] step:
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
  key(enter)
prob [<user.prose>] ontap:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] retap:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
prob [<user.prose>] onstep:
  user.problem_next()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
  key(enter)
prob [<user.prose>] restep:
  user.problem_last()
  user.vscode("editor.action.quickFix")
  sleep(400ms)
  user.insert_formatted(prose or "", "NO_SPACES")
  key(enter)

change step: key(alt-f5)
change restep: key(shift-alt-f5)

failure step: user.vscode("testing.goToNextMessage")
failure restep: user.vscode("testing.goToPreviousMessage")

refer step: key(f4)
refer restep: key(shift-f4)

# Symbol search
symbol [<user.spoken_search>] tappy:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(spoken_search or "")
^symbol [<user.spoken_search>] tap:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(spoken_search or "")

symbol [<user.spoken_search>] steppy:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(spoken_search or "")
  sleep(300ms)
  key(enter)
^symbol [<user.spoken_search>] step:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(spoken_search or "")
  sleep(300ms)
  key(enter)

^text [<user.spoken_search>] tap:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(spoken_search or "")
^text [<user.spoken_search>] tappy:
  edit.find()
  sleep(50ms)
  insert(spoken_search or "")

type tap: user.vscode("editor.action.peekTypeDefinition")
type hierarchy tap: user.vscode("editor.showTypeHierarchy")
param tap: user.vscode("editor.action.triggerParameterHints")

# File Commands
file [<user.prose>] [{user.file_extension}] tap:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(prose or "")
  insert(file_extension or "")
  sleep(300ms)
file [<user.prose>] [{user.file_extension}] step:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(prose or "")
  insert(file_extension or "")
  sleep(300ms)
  key(enter)

project [<user.prose>] tap:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(prose or "")
  sleep(250ms)

project [<user.prose>] step:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(prose or "")
  sleep(250ms)
  key(enter)

change tap: user.vscode("editor.action.dirtydiff.next")
change retap: user.vscode("editor.action.dirtydiff.previous")

file step:
  user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
file forge:
  user.vscode("fileutils.duplicateFile")
file punch:
  user.vscode("fileutils.removeFile")
  sleep(150ms)

alter step: user.vscode("alternate.alternateFile")
alter stepper: user.vscode("alternate.createAlternateFile")
alter restep: user.vscode("alternate.alternateFileInSplit")
alter restepper: user.vscode("alternate.createAlternateFileInSplit")

snip step: user.vscode("jumpToNextSnippetPlaceholder")
snip restep: user.vscode("jumpToPrevSnippetPlaceholder")

git step: user.vscode("workbench.scm.action.focusNextInput")
git restep: user.vscode("workbench.scm.action.focusPreviousInput")
git resource step: user.vscode("workbench.scm.action.focusNextResourceGroup")
git resource restep: user.vscode("workbench.scm.action.focusPreviousResourceGroup")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

debug step: user.vscode("workbench.action.debug.stepOver")
debug dip step: user.vscode("workbench.action.debug.stepInto")
debug fly step: user.vscode("workbench.action.debug.stepOut")

mark step: user.vscode("bookmarks.jumpToNext")
mark restep: user.vscode("bookmarks.jumpToPrevious")

form <user.formatters> <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)
