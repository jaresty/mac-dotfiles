app: vscode
-
diff <user.cursorless_target> to <user.cursorless_target>:
    user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
    user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

explore: user.vscode("breadcrumbs.focusAndSelect")
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

C D new:
  user.vscode("continue.newSession")
C D file select:
  user.vscode("continue.selectFilesAsContext")
C D history:
  user.vscode("continue.viewHistory")
C D accept:
  user.vscode("continue.acceptDiff")
C D reject:
  user.vscode("continue.rejectDiff")
C D toggle fullscreen:
  user.vscode("continue.toggleFullScreen")
C D next: user.vscode("editor.action.inlineSuggest.showNext")
C D (previous | last): user.vscode("editor.action.inlineSuggest.showPrevious")
bar C D:
  user.vscode("continue.continueGUIView.focus")
