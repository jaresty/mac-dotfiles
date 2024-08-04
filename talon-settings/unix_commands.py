import subprocess

from talon import Context, Module, actions

mod = Module()


ctx = Context()


mod.list("git_subcommand", desc="Git subcommands from fish shell completion")


@ctx.dynamic_list("user.git_subcommand")
def user_git_subcommand(m) -> dict[str, str]:
    """A dynamic list of available git subcommands using fish shell completion"""
    ps = subprocess.Popen(
        ["fish", "-c", "complete -C 'git '"],
        stdout=subprocess.PIPE,
    )
    output = ps.communicate()[0].decode("utf-8")
    if not output:
        print("no output")
        return {}

    commands = []
    for line in output.splitlines():
        if "\t" in line:
            line = line.split("\t")[0]
        commands.append(line.strip())
    return actions.user.create_spoken_forms_from_list(commands)
