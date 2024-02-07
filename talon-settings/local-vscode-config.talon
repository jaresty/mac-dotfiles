app: vscode
-
diff <user.cursorless_target> to <user.cursorless_target>:
    user.cursorless_ide_command("extension.partialDiff.markSection1", cursorless_target_1)
    user.cursorless_ide_command("extension.partialDiff.markSection2AndTakeDiff", cursorless_target_2)

explore: user.vscode("breadcrumbs.focusAndSelect")
