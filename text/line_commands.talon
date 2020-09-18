tag: user.line_commands
-
#this defines some common line commands. More may be defined that are ide-specific.
lend: edit.line_end()
bend: edit.line_start()
go <number>: edit.jump_line(number)
go <number> end:
    edit.jump_line(number)
    edit.line_end()

comment line <number>:
    user.select_range(number, number)
    code.toggle_comment()
comment line <number> until <number>:
    user.select_range(number_1, number_2)
    code.toggle_comment()
(clear | snip) line <number>:
    edit.jump_line(number)
    user.select_range(number, number)
    edit.delete()
(clear | snip) <number> until <number>:
    user.select_range(number_1, number_2)
    edit.delete()
copy [line] <number>: 
    user.select_range(number, number)
    edit.copy()
copy line <number> until <number>:
    user.select_range(number_1, number_2)
    edit.copy()
(cut | snip) line <number>:
    user.select_range(number, number)
    edit.cut()
(cut | snip) line <number> until <number>:
    user.select_range(number_1, number_2)
    edit.cut()
paste <number>:
    # user.select_range(number, number)
    edit.jump_line(number)
    edit.paste()
paste line <number> until <number>:
    user.select_range(number, number)
    # edit.jump_line(number)
    edit.paste()
replace line <number> until <number>:
    user.select_range(number_1, number_2)
    edit.paste()
select line <number>: user.select_range(number, number)
select line <number> until <number>: user.select_range(number_1, number_2)
indent <number>:
    edit.jump_line(number)
    edit.indent_more()
indent line <number> until <number>:
    user.select_range(number_1, number_2)
    edit.indent_more()
retab that: edit.indent_less()
retab [line] <number>:
    user.select_range(number, number)
    edit.indent_less()
unindent line <number> until <number>:
    user.select_range(number_1, number_2)
    edit.indent_less()
drag [line] down: edit.line_swap_down()
drag [line] up: edit.line_swap_up()
drag up [line] <number>:
    user.select_range(number, number)
    edit.line_swap_up()
drag up [line] <number> until <number>:
    user.select_range(number_1, number_2)
    edit.line_swap_up()
drag down [line] <number>: 
    user.select_range(number, number)
    edit.line_swap_down()
drag down [line] <number> until <number>:
    user.select_range(number_1, number_2)
    edit.line_swap_down()
clone (line|that): edit.line_clone()

