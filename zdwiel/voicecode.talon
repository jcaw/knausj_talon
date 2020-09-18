quatches: '"'
quatchet: "'"
tick: "`"
crunder: "_"
questo: "?"
dolly: "$"
shock: "\n"
tarsh: key("shift-tab")
tarp: "\t"
tarpy: "\t\t"

coalgap: ": "
swipe: ", "
dee pipe: " | "
divy: " / "
equeft: " = "
longqual: " == "
L brace: "{"
R brace: "}"
L angle: "<"
R angle: ">"

kirk:
    insert("{}")
    key("left")
angler:
    insert("<>")
    key("left")


wink: core.repeat_command(1)
soup: core.repeat_command(2)
trace: core.repeat_command(3)
quarr: core.repeat_command(4)
fypes: core.repeat_command(5)

spring <number>: edit.jump_line(number)
sprinkler <number>:
    edit.jump_line(number)
    edit.line_end()
springcone <number>:
    edit.jump_line(number)
    edit.line_end()
    key("enter")

# deleting
snip line:
    edit.delete_line()
snip line <number>:
    edit.jump_line(number)
    user.select_range(number, number)
    edit.delete()

shiby: app.window_next()

stoosh: edit.copy()
snatch: edit.cut()
spark: edit.paste()
dizzle: edit.undo()
rizzle: edit.redo()

sage: edit.save()

# generic_editor.talon

marco:
    edit.find()
marneck:
    edit.find_next()
marprev:
    edit.find_previous()

fame:
    edit.word_left()
fish:
    edit.word_right()

go left:
    edit.left()
go right:
    edit.right()
go up:
    edit.up()
go down:
    edit.down()

lefty:
    edit.line_start()
ricky:
    edit.line_end()

doomway:
    edit.file_end()
jeepway:
    edit.file_start()

# selecting
select line:
    edit.line_start()
    edit.extend_line_end()

ali:
    edit.select_all()

shrim:
    edit.extend_left()
shrish:
    edit.extend_right()

shreep:
    edit.extend_line_up()
shroom:
    edit.extend_line_down()

scram:
    edit.extend_word_left()
scrish:
    edit.extend_word_right()

lecksy:
    edit.extend_line_start()
ricksy:
    edit.extend_line_end()

shroomway:
    edit.extend_file_end()
shreepway:
    edit.extend_file_start()

junk:
    key(backspace)
spunk:
    key(delete)

trough:
    edit.extend_word_left()
    edit.delete()
kite:
    edit.extend_word_right()
    edit.delete()
