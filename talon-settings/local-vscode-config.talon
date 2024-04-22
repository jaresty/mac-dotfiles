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
emmet expand:
  user.vscode("editor.emmet.action.expandAbbreviation")
git log:
  user.vscode("gitlens.showGraph")
dendron lookup [<user.text>]:
  user.vscode("dendron.lookupNote")
  sleep(50ms)
  user.insert_formatted(text, "DOT_SEPARATED")

complete:                   user.vscode("editor.action.triggerSuggest")
bless:                      user.vscode("cursorUndo")
recurse:                    user.vscode("cursorRedo")

splitter:                   user.vscode("workbench.action.focusNextGroup")

task [<user.text>]:
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
  sleep(50ms)
  user.vscode("problems.action.showQuickFixes")
triage last:
  user.vscode("editor.action.marker.prevInFiles")
  sleep(50ms)
  user.vscode("problems.action.showQuickFixes")
narrow:                     user.vscode("editor.action.peekDefinition")
narrower:                   user.vscode("editor.action.revealDefinition")
widen:                      user.vscode("editor.action.goToReferences")
widest:                     user.vscode("editor.showCallHierarchy")
jump:                       key(f4)
jump back:                  key(shift-f4)

pop deaf:                   user.vscode("editor.action.peekDefinition")
pop type:                   user.vscode("editor.action.peekTypeDefinition")
pop type hierarchy:         user.vscode("editor.showTypeHierarchy")
pop params:                 user.vscode("editor.action.triggerParameterHints")
