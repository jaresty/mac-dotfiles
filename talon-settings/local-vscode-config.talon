app: vscode
-
settings():
  user.paste_to_insert_threshold = 10

diff <user.cursorless_target> with <user.cursorless_target>:
  user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
  user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

pop change next: user.vscode("editor.action.dirtydiff.next")
pop change last: user.vscode("editor.action.dirtydiff.previous")

disk files: user.vscode("workbench.action.files.saveFiles")
complete: user.vscode("editor.action.triggerSuggest")
perfect:
  user.vscode("editor.action.triggerSuggest")
  key(enter)

^explore: user.vscode("breadcrumbs.focusAndSelect")
^scry [<user.text>]$:
  user.vscode("workbench.action.quickTextSearch")
  sleep(50ms)
  insert(text or "")

^lookup [<user.text>]:
  user.vscode("workbench.action.showAllSymbols")
  sleep(50ms)
  insert(text or "")

met ex:
  key(tab)
git log:
  user.vscode("gitlens.showGraph")

bless: user.vscode("cursorUndo")
recurse: user.vscode("cursorRedo")

splitter: user.vscode("workbench.action.focusNextGroup")
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

wax: user.vscode("editor.action.smartSelect.expand")
wane: user.vscode("editor.action.smartSelect.shrink")

triage:
  user.vscode("editor.action.marker.nextInFiles")
  user.vscode("editor.action.quickFix")
triage last:
  user.vscode("editor.action.marker.prevInFiles")
  user.vscode("editor.action.quickFix")

widen: user.vscode("editor.unfoldAll")
ref next: key(f4)
ref last: key(shift-f4)
# Symbol search
jump [<user.text>]:
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(text or "")

track <user.cursorless_target>:
  symbol = user.cursorless_get_text(cursorless_target)
  user.vscode("workbench.action.gotoSymbol")
  sleep(50ms)
  insert(symbol)

pop deaf: user.vscode("editor.action.peekDefinition")
pop jest: user.vscode("toggleSuggestionDetails")
pop type: user.vscode("editor.action.peekTypeDefinition")
pop type hierarchy: user.vscode("editor.showTypeHierarchy")
pop param: user.vscode("editor.action.triggerParameterHints")

testing start: user.vscode("testing.startContinuousRun")
testing stop: user.vscode("testing.stopContinuousRun")

# File Commands
docs [<user.text>] [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
docs pop <user.text> [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(enter)
  sleep(150ms)
docs split <user.text> [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(cmd-right)
  sleep(150ms)
  key(escape)
  user.split_next()
docs pop:
  user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
project [<user.text>]:
  user.vscode("workbench.action.openRecent")
  sleep(50ms)
  insert(text or "")
  sleep(250ms)
pop alter: user.vscode("alternate.alternateFile")
make alter: user.vscode("alternate.createAlternateFile")
split alter: user.vscode("alternate.alternateFileInSplit")
compare clip: user.vscode("extension.partialDiff.diffSelectionWithClipboard")

preview j s start: user.vscode("previewjs.start")
preview j s stop: user.vscode("previewjs.stop")

<user.formatters> form <user.cursorless_target>:
  user.cursorless_reformat(cursorless_target, formatters)

git focus next: user.vscode("workbench.scm.action.focusNextInput")
git focus last: user.vscode("workbench.scm.action.focusPreviousInput")
git focus next resource: user.vscode("workbench.scm.action.focusNextResourceGroup")
git focus last resource: user.vscode("workbench.scm.action.focusPreviousResourceGroup")
journal [<user.text>]:
  user.vscode("journal.day")
  sleep(50ms)
  insert(text or "")

{user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  user.search_with_search_engine(search_engine, text)

model {user.search_engine} scout <user.cursorless_target>:
  text = user.cursorless_get_text(cursorless_target)
  result = user.gpt_search_engine(search_engine, text)
  user.search_with_search_engine(search_engine, result)

append <user.keys> <user.cursorless_target>:
  starting_text = user.cursorless_get_text(cursorless_target, true)
  destination = user.cursorless_create_destination(cursorless_target)
  user.cursorless_insert(destination, "{starting_text}{keys}")

snacks: user.vscode("jumpToNextSnippetPlaceholder")
snazz: user.vscode("jumpToPrevSnippetPlaceholder")
