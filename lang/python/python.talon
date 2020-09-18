mode: user.python
mode: command
and code.language: python
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda): ""
action(user.code_operator_subscript):
    insert("[]")
    key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " and "
action(user.code_operator_or): " or "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_self): "self"
action(user.code_null): "None"
action(user.code_is_null): " is None"
action(user.code_is_not_null): " is not None"
action(user.code_state_if):
    insert("if :")
    key(left)
action(user.code_state_else_if):
    insert("elif :")
    key(left)
action(user.code_state_else):
    insert("else:")
    key(enter)
action(user.code_state_switch):
    insert("switch ()")
    edit.left()
action(user.code_state_case):
    insert("case \nbreak;")
    edit.up()
action(user.code_state_for): "for "
action(user.code_state_for_each):
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_state_while):
    insert("while :")
    edit.left()
action(user.code_type_class): "class "
action(user.code_import): "import "
action(user.code_from_import):
    insert("from import ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_comment): "# "
action(user.code_private_function):
    insert("def _")
action(user.code_protected_function):
    user.code_private_function()
action(user.code_public_function):
	insert("def ")
action(user.code_state_return):
	insert("return ")
action(user.code_true): "True"
action(user.code_false): "False"
action(user.code_document_string): user.insert_cursor("\"\"\"[|]\"\"\"")

#python-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
self taught: "self."
pie test: "pytest"
state past: "pass"

#^funky <user.text>$: user.code_private_function(text)
#^pro funky <user.text>$: user.code_protected_function(text)
^pub funky <user.text>$: user.code_public_function(text)
#^static funky <user.text>$: user.code_private_static_function(text)
#^pro static funky <user.text>$: user.code_protected_static_function(text)
#^pub static funky <user.text>$: user.code_public_static_function(text)

self: "self"
self dot: "self."
self [(dot | doubt)] <user.optional_snake_text> [over]: "self.{optional_snake_text}"
self [(dot | doubt)] private <user.optional_snake_text> [over]: "self._{optional_snake_text}"
from <user.optional_snake_text> import {user.optional_snake_text_2} [over]: "from {optional_snake_text} import {optional_snake_text_2}"

star (arguments | args): "*args"
star star K wargs: "**kwargs"

true: " True"
champ true: " True"
false: " False"
champ false: " False"
none: " None"
champ none: " None"
F string: user.insert_cursor('f"[|]"')
wrap call <user.optional_text>:
    key("(")
    key("left")
    insert(optional_text)
py in <user.optional_snake_text>: "in {optional_snake_text}"
py is not: " is not "
py if <user.optional_snake_text>:
    insert("if {optional_snake_text}:")
    key("left")
py else: "else:\n"
py elif: user.insert_cursor("elif [|]:")
py with: user.insert_cursor("with [|]:")
py while: user.insert_cursor("while [|]:")
py try: "try:"
py import <user.optional_snake_text> [over]: "import {optional_snake_text}"
py from <user.optional_snake_text> [over]: "from {optional_snake_text}"
py from <user.optional_snake_text> import: "from {optional_snake_text} import "
return <user.optional_snake_text> [over]: "return {optional_snake_text}"
set trace: "import ipdb; ipdb.set_trace()"
import numb pie [as N P]: "import numpy as np"

raise {user.python_exception}: user.insert_cursor("raise {python_exception}([|])")

# for annotating function parameters
is type {user.python_type_list}:
    insert(": {python_type_list}")
returns [type] {user.python_type_list}:
    insert(" -> {python_type_list}")
# for generic reference of types
type {user.python_type_list}:
    insert("{python_type_list}")
dock {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
    edit.left()
dock type {user.python_type_list}:
    user.insert_cursor(":type [|]: {python_type_list}")
dock returns type {user.python_type_list}:
    user.insert_cursor(":rtype [|]: {python_type_list}")
toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)
