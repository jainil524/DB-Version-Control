import importlib
from subprocess import call


def check_install_dependency(module_names):
    for module_name in module_names:
        try:
            importlib.import_module(module_name)
        except ImportError:
            print(f"{module_name} not found. Installing...")
            call(["pip", "install", module_name])


def InitiallizePackages():
    # check if the required packages are installed
    # if not, install them

    check_install_dependency(["questionary", "re", "os"])


InitiallizePackages()


import os
import re
import questionary


def parse_sql_file(file):
    return file.read()


# get the commits from the git log and return the result as a file object
def getCommits(date=None):
    #  git log --since=<date-from> --until=<date-to>
    command = "git log"
    if date is not None:
        command += f" --until={date}"

    out = os.popen(command)
    return out


def extract_commits():
    content = parse_sql_file(getCommits())
    commits = []
    commit = None

    # Define the regex pattern
    pattern = re.compile(r"^\s{4}[A-Za-z0-9 ]*")

    for line in content.split("\n"):
        line = line.rstrip()

        if line.startswith("commit"):
            if commit:
                commits.append(commit)
            commit = {"id": line.split(" ")[1], "message": []}

        elif line.startswith("Author") and commit is not None:
            author_info = line.split(" ", 2)[1:]
            commit["Author"] = {
                "name": author_info[0],
                "email": re.search(r"\<(.*?)\>", author_info[1]).group(1),
            }

        elif commit is not None:
            # Find matching lines with the regex
            match = pattern.match(line)
            if match:
                commit["message"].append(match.group().strip())

    if commit:
        commits.append(commit)

    return commits


def display_commit(commit):
    print(f"Commit ID: {commit['id']}")
    print(f"Author: {commit['Author']['name']} <{commit['Author']['email']}>")
    print("Message:")
    for msg in commit["message"]:
        print(f"    {msg}")
    print("-" * 40)


def main():

    commits = extract_commits()
    choices = [f"{commit['id']} - {commit['Author']['name']}" for commit in commits]

    while True:
        choice = questionary.select(
            "Choose a commit to display:", choices=choices
        ).ask()

        if choice is None:
            break

        selected_commit = commits[choices.index(choice)]
        display_commit(selected_commit)


if __name__ == "__main__":
    main()
