import os
import re
import tkinter as tk
from tkinter import filedialog

def select_folder():
    root = tk.Tk()
    root.withdraw()
    folder_path = filedialog.askdirectory(title="Seleziona la cartella dove cercare i file di programmazione")
    return folder_path

def find_comment_lines(folder_path, file_extensions=(".prg", ".c", ".cpp", ".h", ".hpp", ".java", ".py", ".html", ".js", ".css",
                                                     ".php", ".rb", ".swift", ".go", ".kt", ".kts", ".ts", ".rs", ".sh")):
    comment_patterns = [
        re.compile(r"^\s*\*"),                 # FoxPro
        re.compile(r"^\s*//"),                 # C/C++/Java/JavaScript/TypeScript/Swift/Go/Rust
        re.compile(r"^\s*/\*"),                # C/C++/Java/JavaScript/TypeScript/Swift/Go/Rust/CSS
        re.compile(r"^\s*\*/"),                # C/C++/Java/JavaScript/TypeScript/Swift/Go/Rust/CSS
        re.compile(r"^\s*#"),                  # Python/Ruby/Shell
        re.compile(r"^\s*<!--"),               # HTML
        re.compile(r"^\s*-->"),                # HTML
        re.compile(r"^\s*<!---"),              # Kotlin
        re.compile(r"^\s*--->"),               # Kotlin
        re.compile(r"^\s*<%--"),               # PHP
        re.compile(r"^\s*--%>")                # PHP
    ]
    comment_lines = []

    for root, _, files in os.walk(folder_path):
        for file in files:
            if file.endswith(file_extensions):
                file_path = os.path.join(root, file)
                with open(file_path, encoding="utf-8", errors="ignore") as f:
                    for line_number, line in enumerate(f, start=1):
                        for pattern in comment_patterns:
                            if pattern.match(line):
                                comment_lines.append((file_path, line_number, line.strip()))
                                break

    return comment_lines

def main():
    folder_path = select_folder()
    if not folder_path:
        print("Nessuna cartella selezionata. Uscita.")
        return

    comment_lines = find_comment_lines(folder_path)

    if comment_lines:
        print(f"\nRighe di commento trovate nei file di programmazione ({len(comment_lines)}):")
        for file_path, line_number, comment in comment_lines:
            print(f"{file_path}:{line_number}: {comment}")
    else:
        print("Nessuna riga di commento trovata nei file di programmazione.")

if __name__ == "__main__":
    main()
