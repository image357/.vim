def get_cpp_flags():
    flags = [
            "-x",
            "c++",
            "-std=c++17",
            "-stdlib=libc++",
            "-Wall",
            "-Wextra",
    ]

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
