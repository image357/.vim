default_flags = [
        "-x",
        "c++",
        "-std=c++17",
        "-stdlib=libc++",
        "-Wall",
        "-Wextra",
]


def Settings(**kwargs):
    return {
            "flags":
                    default_flags
    }
