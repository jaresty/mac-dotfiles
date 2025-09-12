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

mods presenterm: user.paste("mods 'Transform the input into a valid multi-slide presenterm deck; output raw Markdown only (no code fences). Front matter exactly: \"--- newline title: <use a descriptive title based on the input, never leave blank, do not use colons or disallowed characters> newline author: Generated (or authors: [...] ) newline date: YYYY-MM-DD newline --- newline\"; no other keys. Produce up to 12 slides (no minimum required); each slide MUST start with a Setext header (Title line, next line exactly ---), include content and references, and end with an HTML comment named end_slide on its own line, then a blank line. Emit directives only as HTML comments on their own line with exact syntax: end_slide = \"<!-- end_slide -->\"; pause = \"<!-- pause -->\"; column_layout with weights = \"<!-- column_layout: [7, 3] -->\"; column with index = \"<!-- column: 0 -->\"; reset_layout = \"<!-- reset_layout -->\"; jump_to_middle = \"<!-- jump_to_middle -->\". Use bullets/prose; support mermaid diagrams via code blocks tagged mermaid +render; support LaTeX via code blocks tagged latex +render; support D2 via code blocks tagged d2 +render; support executable snippets via fenced code blocks whose info string starts with a language then +exec (optionally +id:<name>) or +exec_replace or +image (e.g., \"```bash +exec\", \"```python +exec +id:foo\"); reference outputs with \"<!-- snippet_output: name -->\". Hide code lines with # or /// prefixes per language; other code blocks only if relevant (name the language); images only if valid paths/URLs. Escape all raw < and > characters in slide content to &lt; and &gt; except inside the required HTML comment directives. Mermaid safety: inside mermaid code blocks, do NOT encode Mermaid grammar or shape delimiters; ONLY HTML-encode reserved characters inside node/edge LABEL TEXT (the characters between the first matching pair of delimiters immediately following a node id: [], [[]], (), (()), {{}} , {{{{}}}} , [/ /], and inside link labels |...|). Within those label texts only, replace \"[\"->\"&#91;\", \"]\"->\"&#93;\", \"{{\"->\"&#123;\", \"}}\"->\"&#125;\", \"<\"->\"&lt;\", \">\"->\"&gt;\", \"&\"->\"&amp;\"; NEVER encode parentheses \"(\" or \")\" anywhere and NEVER encode the outer delimiters themselves ([], (), {{}} , [[]], (()), {{{{}}}} , [/ /], [\\\\ \\\\]); do not double-encode. Markdown safety in SLIDE BODY (outside all fenced/inline code and outside HTML directives): HTML-encode tildes unless they form valid strikethrough markup; i.e., encode every standalone or path-embedded \"~\" as \"&#126;\" so \"~/foo\" becomes \"&#126;/foo\", but keep intentional \"~~text~~\" unchanged; you MAY also encode bare \"*\"->\"&#42;\", \"_\"->\"&#95;\", and \"`\"->\"&#96;\" when not part of valid emphasis/code to prevent accidental styling. Avoid # headers. This instruction itself must contain no literal newline characters.' > presentation.md")
mods code tour: user.paste("mods 'You are an assistant that generates VS Code CodeTour `.tour` JSON files (schema: https://raw.githubusercontent.com/microsoft/codetour/main/schema.json). You know about all tour-level fields (title, description, ref, isPrimary, nextTour, when) and step types (content-only, directory, file+line, file+regex pattern, uri, commands, view). When I give you input, output only a valid `.tour` JSON using the relevant features—do not include explanations or extra text outside the JSON.' > tour.tour")
mods walk through: user.paste("mods 'Explain this as a clear walkthrough, step by step, focusing only on the high-level ideas so the audience gradually builds understanding.'")
