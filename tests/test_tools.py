from flattener import tools


def test_flatten():
    assert tools.flatten([[1, 2, 3], [4, 5, 6]]) == [1, 2, 3, 4, 5, 6]
