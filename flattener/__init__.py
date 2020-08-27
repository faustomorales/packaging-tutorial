"""Tools that Python should have had in the first place."""

from ._version import get_versions
__version__ = get_versions()['version']
del get_versions
