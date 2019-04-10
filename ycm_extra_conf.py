def get_cpp_flags():
    flags = [
            "-x",
            "c++",
            "-std=c++17",
            "-stdlib=libc++",
            "-Wall",
            "-Wextra",
    ]

    return flags


def get_python_sys_path():
    sys_path = []

    return sys_path


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
