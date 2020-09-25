from urllib import parse
from typing import Tuple, List

from talon import Context, Module, actions, clip

browser = actions.browser


module = Module()


# TODO: Test this still works after porting
def _update_parameters(url, parameters):
    parts = list(parse.urlparse(url))
    query = dict(parse.parse_qsl(parts[4]))
    query.update(parameters)

    query_string = parse.urlencode(query).replace("%3A", ":")
    # some manual modification because urllib insists on putting the fragment
    # identifier after the query parameters, which is not what we want here
    parts[4] = ""
    parts[5] = parts[5].split("?")[0]
    return parse.urlunparse(parts) + "?" + query_string


def _update_range(start, end=None):
    # TODO: Find an alternative to this URL method. Seems fragile & somewhat
    #   risky.
    if end:
        new_range = "{},{}:{},{}".format(start[0], start[1], end[0], end[1])
    else:
        new_range = "{},{}".format(start[0], start[1])
    url = browser.address()
    new_url = _update_parameters(url, {"range": new_range})
    browser.go(new_url)


@module.capture(rule="<number>")
def sheet_row(m) -> str:
    return str(m.number)


@module.capture(rule="<user.letter>+")
def sheet_column(m) -> str:
    return "".join(m)


@module.capture(rule="<user.sheet_column> <user.sheet_row>")
def sheet_cell(m) -> Tuple[str, str]:
    return (m.sheet_column, m.sheet_row)


module.list("sheet_named_cells", "Named cells for quick jumping.")


@module.action_class
class Actions:
    def sheet_select_cell(cell: Tuple[str, str]) -> None:
        """Go to a specific cell in a spreadsheet."""
        # TODO: Extract to action
        _update_range(cell)

    def sheet_select_range(start: Tuple[str, str], end: Tuple[str, str]) -> None:
        """Select a range in a spreadsheet."""
        _update_range(start, end)

    def sheet_select_row(row: int) -> None:
        """Select a row in a spreadsheet."""
        row = str(row)
        _update_range(("", row), ("", row))

    def sheet_select_column(column: List[str]) -> None:
        """Select a column in a spreadsheet."""
        column = "".join(column)
        _update_range((column, ""), (column, ""))
