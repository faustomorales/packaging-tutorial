"""Tools that Python should have had in the first place."""
import typing


def flatten(list_of_lists: typing.List[typing.List[typing.Any]]) -> typing.List[typing.Any]:
    """Flatten a list of lists."""
    if not list_of_lists:
        return []
    return [item for sublist in list_of_lists for item in sublist]
