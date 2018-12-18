def FlagsForFile( filename, **kwargs ):
    default_flags = [
            "-x",
            "c++",
            "-Wall",
            "-Wextra",
            "-Werror",
    ]

    return {
            "flags":
                    default_flags
    }
