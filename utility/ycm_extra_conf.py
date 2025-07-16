import os
import subprocess

def get_cpp_include_flags():
    result = subprocess.run([
        "c++",
        "-x",
        "c++",
        "/dev/null",
        "-E",
        "-Wp,-v",
    ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out = result.stderr.decode("utf-8")

    include_flags = []
    search_mode = "init"
    matcher = "#include <...>"
    for line in out.split("\n"):
        if search_mode == "collect":
            path = line.strip()
            if os.path.isdir(path):
                include_flags += [
                        "-isystem",
                        path,
                ]
            else:
                search_mode = "init"
        if search_mode == "init":
            if matcher in line:
                search_mode = "collect"

    return include_flags

def get_cpp_flags():
    flags = []

    flags += [
            "-x",
            "c++",
            "-std=c++17",
            "-stdlib=libc++",
            "-Wall",
            "-Wextra",
    ]

    flags += get_cpp_include_flags()

    return [i for i in flags if i]


def get_python_sys_path():
    sys_path = []

    return [i for i in sys_path if i]


def Settings(**kwargs):
    language = kwargs["language"]

    if language == "cfamily":
        return {
                "flags": get_cpp_flags(),
        }

    if language == "python":
        return {
                "interpreter_path": "python3",
                "sys_path": get_python_sys_path(),
        }

    return {}
