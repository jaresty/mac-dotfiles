app: vscode
-
diff <user.cursorless_target> to <user.cursorless_target>:
  user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
  user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

explore:                    user.vscode("breadcrumbs.focusAndSelect")
fuzzy [<user.text>]:
  user.vscode("fuzzySearch.activeTextEditor")
  sleep(50ms)
  insert(text or "")
met ex:
  key(tab)
git log:
  user.vscode("gitlens.showGraph")
dendron lookup [<user.text>]:
  user.vscode("dendron.lookupNote")
  sleep(50ms)
  user.insert_formatted(text, "DOT_SEPARATED")

complete this:              user.vscode("editor.action.triggerSuggest")
bless:                      user.vscode("cursorUndo")
recurse:                    user.vscode("cursorRedo")

splitter:                   user.vscode("workbench.action.focusNextGroup")

task run [<user.text>]:
  user.vscode("workbench.action.quickOpen")
  insert("task ")
  revealDefinitionAside(user.text or "")

mob start:
  revealDefinitionAside.vscode("workbench.action.quickOpen")
  insert("task mob start\n")

mob next:
  user.vscode("workbench.action.quickOpen")
  insert("task mob next\n")

mob done:
  user.vscode("workbench.action.quickOpen")
  insert("task mob done\n")

flash <user.cursorless_target>: user.cursorless_get_text(cursorless_target)

wax:                        user.vscode("editor.action.smartSelect.expand")
wane:                       user.vscode("editor.action.smartSelect.shrink")

triage:
  user.vscode("editor.action.marker.nextInFiles")
  user.vscode("editor.action.quickFix")
triage last:
  user.vscode("editor.action.marker.prevInFiles")
  user.vscode("editor.action.quickFix")
widen:                      user.vscode("editor.unfoldAll")
jump:                       key(f4)
jump back:                  key(shift-f4)

pop deaf:                   user.vscode("editor.action.peekDefinition")
pop jest:                   user.vscode("toggleSuggestionDetails")
pop type:                   user.vscode("editor.action.peekTypeDefinition")
pop type hierarchy:         user.vscode("editor.showTypeHierarchy")
pop params:                 user.vscode("editor.action.triggerParameterHints")

testing start:              user.vscode("testing.startContinuousRun")
testing stop:               user.vscode("testing.stopContinuousRun")

# File Commands
dock [<user.text>] [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
dock pop <user.text> [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(enter)
  sleep(150ms)
dock split <user.text> [{user.file_extension}] [over]:
  user.vscode("workbench.action.quickOpen")
  sleep(400ms)
  insert(text or "")
  insert(file_extension or "")
  sleep(300ms)
  key(cmd-right)
  sleep(150ms)
  key(escape)
  user.split_next()
dock pop:
  user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
pop alter:                  user.vscode("alternate.alternateFile")
make alter:                 user.vscode("alternate.createAlternateFile")
split alter:                user.vscode("alternate.alternateFileInSplit")
