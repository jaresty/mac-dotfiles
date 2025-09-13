tag: terminal
-
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.readline
settings():
	key_wait = 5

mob start: "mob start\n"
mob start <user.number_string>: "mob start {number_string}\n"
mob next: "mob next\n"
mob done: "mob done\n"

siginter: key(ctrl-c)
sigend: key(ctrl-d)
editor: key(alt-e)
bam ong: key("alt-d")
file [<user.text>] tap:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
file [<user.text>] ong:
	key(ctrl-t)
	sleep(60ms)
	insert(text)
	key(enter)
project [<user.text>] tap$:
	insert("z {text}")
	key(tab)
project [<user.text>] ong$:
	insert("z {text}")
	key(enter)
text <user.text> tap:
	insert("rg {text}")
	key(enter)
dir fog:
	insert("cd ..")
	key(enter)
dir <user.text> ong:
	key(alt-c)
	sleep(60ms)
	insert(text)
	key(enter)
dir [<user.text>] tap:
	key(alt-c)
	sleep(60ms)
	insert(text or "")
dir rog:
	insert("cd -")
	key(enter)

flag [<user.text>] ong:
	insert("--")
	user.complete_from_start(text or "", 1)

flag [<user.text>] tap:
	insert("--")
	user.complete_tap(text or "")

lamb [<user.text>] ong:
	insert("# ")
	insert(text or "")
	key(ctrl-p)

lamb [<user.text>] tap:
	insert("# ")
	insert(text or "")
	key(ctrl-\)

env [<user.text>] tap:
	key(ctrl-v)
	insert(text or "")

yes: key(y enter)
no: key(n enter)
git autocommit: 'git commit -m "$(git diff --staged | mods "summarize this as a conventional commit")"'

mods presenterm: user.paste("mods 'Transform the input into a valid multi-slide presenterm deck; output raw Markdown only (no code fences). Front matter exactly: \"--- newline title: <use a descriptive title based on the input, never leave blank; in the title, encode any colon ':' as &#58; and encode < and > as &lt; and &gt;> newline author: Generated (or authors: [...] ) newline date: YYYY-MM-DD newline --- newline\"; no other keys. Produce up to 12 slides (no minimum required); each slide MUST start with a Setext header (Title line, next line exactly ---), include content and references, and end with an HTML comment named end_slide on its own line with nothing else, then a blank line; the final slide MAY omit the closing end_slide. Emit directives only as HTML comments on their own line with exact syntax and nothing else on the line: end_slide = \"<!-- end_slide -->\"; pause = \"<!-- pause -->\"; column_layout with weights = \"<!-- column_layout: [7, 3] -->\"; column with index = \"<!-- column: 0 -->\"; reset_layout = \"<!-- reset_layout -->\"; jump_to_middle = \"<!-- jump_to_middle -->\". CODE FENCE SAFETY: when opening any fenced code block (e.g., ```mermaid +render, ```bash +exec, ```latex +render, ```d2 +render), you MUST emit a matching closing fence of exactly three backticks on its own line BEFORE any non-code content, directive, or end_slide; if a fence is open at slide end, AUTO-EMIT the closing fence first. Executable snippets: fences start with a language then +exec (optionally +id:<name>) or +exec_replace or +image; only emit \"<!-- snippet_output: name -->\" if a snippet with +id:name exists. Hide code lines with # or /// prefixes per language; other code blocks only if relevant (name the language); images only if valid paths/URLs. HTML SAFETY IN SLIDE BODY (outside all fenced/inline code and outside HTML directives): raw HTML is NOT allowed; therefore you MUST replace EVERY literal '<' with &lt; and EVERY literal '>' with &gt; in body text (including list items and headings) so examples like <img>, <link rel=\"preload\">, or attributes appear as &lt;img&gt;, &lt;link rel=&quot;preload&quot;&gt;, etc.; NEVER output raw '<' or '>' in body text. Markdown safety in SLIDE BODY: prevent accidental styling by encoding isolated control chars unless part of valid syntax; encode every standalone or path-embedded '~' as \"&#126;\" (so \"~/foo\" becomes \"&#126;/foo\"), but keep intentional \"~~text~~\" unchanged. Mermaid safety: inside mermaid code blocks, preserve Mermaid grammar and delimiters unchanged ([], (), [[]], (()), [/ /]); for NODE/EDGE LABEL TEXT you MUST wrap the label text in ASCII double quotes and escape any inner double quote as \\\" and any closing square bracket \"]\" as &#93;; do not otherwise entity-encode label text; leave ampersands \"&\" and other characters as-is; do not double-encode. Avoid # headers. This instruction itself must contain no literal newline characters. Talon note: every literal curly brace in this instruction is doubled (\"{{\" and \"}}\").' > presentation.md")
mods code tour: user.paste("mods 'You are an assistant that generates VS Code CodeTour `.tour` JSON files (schema: https://raw.githubusercontent.com/microsoft/codetour/main/schema.json). You know about all tour-level fields (title, description, ref, isPrimary, nextTour, when) and step types (content-only, directory, file+line, file+regex pattern, uri, commands, view). When I give you input, output only a valid `.tour` JSON using the relevant features—do not include explanations or extra text outside the JSON.' > tour.tour")
mods walk through: user.paste("mods 'Explain this as a clear walkthrough, step by step, focusing only on the high-level ideas so the audience gradually builds understanding.'")
