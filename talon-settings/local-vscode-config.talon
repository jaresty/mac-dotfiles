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
ref next:
  key("f4")
ref last:
  key("shift-f4")
git log:
  user.vscode("gitlens.showGraph")
dendron lookup [<user.text>]:
  user.vscode("dendron.lookupNote")
  sleep(50ms)
  user.insert_formatted(text, "DOT_SEPARATED")

bless:                      user.vscode("cursorUndo")
recurse:                    user.vscode("cursorRedo")

view [<user.text>]:
  user.vscode("workbench.action.openView")
  insert(user.text or "")

flash <user.cursorless_target>: user.cursorless_get_text(cursorless_target)
