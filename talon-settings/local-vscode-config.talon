app: vscode
-
settings():
  user.paste_to_insert_threshold = 10

diff <user.cursorless_target> with <user.cursorless_target>:
  user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
  user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

disk files: user.vscode("workbench.action.files.saveFiles")
jest: user.vscode("editor.action.triggerSuggest")
crumb step: user.vscode("breadcrumbs.focusAndSelect")

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

wax: user.wax()
wane: user.wane()

context tap: user.vscode("editor.action.showContextMenu")

quack tap: user.vscode("editor.action.quickFix")
quack ontap:
  user.vscode("editor.action.marker.nextInFiles")
  user.vscode("editor.action.quickFix")
quack retap:
  user.vscode("editor.action.marker.prevInFiles")
  user.vscode("editor.action.quickFix")

change step: key(alt-f5)
change restep: key(shift-alt-f5)

refer step: key(f4)
refer restep: key(shift-f4)

# Symbol search
symbol peek [<user.text>]:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")
^symbol peekest [<user.text>]:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")
^text peekest [<user.text>]$:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")

deaf peek: user.vscode("editor.action.peekDefinition")
jest peek: user.vscode("toggleSuggestionDetails")
type peek: user.vscode("editor.action.peekTypeDefinition")
type hierarchy peek: user.vscode("editor.showTypeHierarchy")
param peek: user.vscode("editor.action.triggerParameterHints")

# File Commands
file peek [<user.text>] [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
file peekest [<user.text>]:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)

change peek: user.vscode("editor.action.dirtydiff.next")
change repeek: user.vscode("editor.action.dirtydiff.previous")

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

snip step: user.vscode("jumpToNextSnippetPlaceholder")
snip restep: user.vscode("jumpToPrevSnippetPlaceholder")

git step: user.vscode("workbench.scm.action.focusNextInput")
git restep: user.vscode("workbench.scm.action.focusPreviousInput")
git resource step: user.vscode("workbench.scm.action.focusNextResourceGroup")
git resource restep: user.vscode("workbench.scm.action.focusPreviousResourceGroup")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

<user.formatters> form <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)
