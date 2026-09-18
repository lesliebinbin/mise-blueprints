"""Enable this project's compiled USD bindings with ``import openusd``."""

import sys
from pathlib import Path

_bindings = (
    Path(__file__).resolve().parent
    / "lib"
    / f"python{sys.version_info.major}.{sys.version_info.minor}"
    / "site-packages"
)

if not (_bindings / "pxr").is_dir():
    raise ImportError(
        f"USD Python bindings not found at {_bindings}. "
        "Run mise setup and mise build with the matching Python version."
    )

if str(_bindings) not in sys.path:
    sys.path.append(str(_bindings))
