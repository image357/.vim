default_flags = [
        "-std=c++17",
        "-stdlib=libc++",
        "-x",
        "c++",
        "-Wall",
        "-Wextra",
        "-Werror",
]


def Settings(**kwargs):
    return {
            "flags":
                    default_flags
    }
