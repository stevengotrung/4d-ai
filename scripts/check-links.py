"""Check relative Markdown links: the target exists, and links inside skills/<name>/ stay inside it.
Usage: python3 -I scripts/check-links.py [root]"""
import os
import re
import sys

LINK = re.compile(r"\[[^\]]*\]\(([^)\s]+)(?:\s+\"[^\"]*\")?\)")


def main(root):
    root = os.path.abspath(root)
    problems = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in (".git", ".superpowers")]
        for name in filenames:
            if not name.endswith(".md"):
                continue
            path = os.path.join(dirpath, name)
            rel = os.path.relpath(path, root)
            parts = rel.split(os.sep)
            skill_dir = os.path.join(root, parts[0], parts[1]) if parts[0] == "skills" and len(parts) > 2 else None
            with open(path, encoding="utf-8") as f:
                text = f.read()
            text = re.sub(r"```.*?```", "", text, flags=re.S)
            for target in LINK.findall(text):
                if re.match(r"^[a-z]+:", target) or target.startswith("#"):
                    continue
                target_path = target.split("#", 1)[0]
                if not target_path:
                    continue
                resolved = os.path.normpath(os.path.join(dirpath, target_path))
                if not os.path.exists(resolved):
                    problems.append(f"{rel}: missing link target {target}")
                elif skill_dir and not (resolved + os.sep).startswith(skill_dir + os.sep):
                    problems.append(f"{rel}: link leaves its skill folder: {target}")
    for p in problems:
        print(p)
    if problems:
        return 1
    print("links: ok")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(__file__), "..")))
