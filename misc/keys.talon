go <user.arrow_keys>: key(arrow_keys)
#disabled due to https://github.com/talonvoice/beta/issues/90
#<user.number_key>: key(number_key)
<number>: insert("{number}")
<user.letter>: key(letter)
(sky | hip | uppercase) <user.letters> [(lowercase | sunk)]:
    user.insert_formatted(letters, "ALL_CAPS")
<user.symbol_key>: key(symbol_key)
<user.function_key>: key(function_key)
<user.special_key>: key(special_key)
<user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")
