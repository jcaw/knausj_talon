import openai

import json
from talon import actions, Context, Module, resource

mod = Module()
mod.list("openai_tag", desc="openai tags")


@mod.capture(rule="{user.openai_tag}")
def openai_tag(m) -> str:
    return m.openai_tag


def get_line_contents():
    actions.edit.select_line()
    return actions.edit.selected_text()


def load_config_json(filename, default=dict):
    try:
        f = resource.open(filename, "r")
        f.close()
    except FileNotFoundError:
        print("creating missing resource file ", filename)
        with resource.open(filename, "w") as f:
            f.write(json.dumps(default()))
    try:
        return json.load(resource.open(filename))
    except Exception as e:
        print(f"error opening {filename}: {e}")
        return default()


def save_config_json(filename, config):
    with resource.open(filename, "w") as f:
        f.write(json.dumps(config, indent=4))


openai.api_key = json.load(resource.open("openai_key.json", "rb"))["api_key"]


def make_input_output_context(patterns, tag):
    prompt = ""
    for pattern in patterns:
        if tag in pattern["tags"]:
            prompt += "input: {input}\noutput: {output}\n\n".format(**pattern)

    return prompt


last_input = None
last_tag = None
last_output = None


def fix_line(tag, text):
    global last_input, last_tag, last_output

    text = text.strip()
    last_input = text
    last_tag = tag

    context = make_input_output_context(patterns, tag)
    if context:
        prompt = "{context}input: {text}\noutput:".format(context=context, text=text)
        print("prompt", prompt)
        response = openai.Completion.create(
            engine="davinci",
            prompt=prompt,
            max_tokens=150,
            stop=["\n\n"],
            temperature=0,
            top_p=1,
        )
        last_output = response["choices"][0]["text"][1:]
    else:
        last_output = ""

    return last_output


@mod.action_class
class Actions:
    def openai_fix_line(openai_tag: str) -> str:
        """use Open AI to fix a line of text"""
        contents = get_line_contents()
        new_contents = fix_line(openai_tag, contents)
        actions.user.paste(new_contents + "\n")

    def openai_fix_selected(openai_tag: str) -> str:
        """use Open AI to fix a line of text"""
        contents = actions.edit.selected_text()
        new_contents = fix_line(openai_tag, contents)
        actions.user.paste(new_contents + "\n")

    def openai_save_last_change():
        """save the last fix line in history of successful patterns"""
        patterns.append(
            {"tags": [last_tag], "input": last_input, "output": last_output}
        )
        save_config_json("openai.json", patterns)

    def openai_save_correction():
        """save the current line as the expected output of the previous attempted fix in history of successful patterns"""
        correction = get_line_contents().strip()
        patterns.append({"tags": [last_tag], "input": last_input, "output": correction})
        save_config_json("openai.json", patterns)

    def openai_save_selected():
        """save the selected text as the expected output of the previous attempted fix in history of successful patterns"""
        correction = actions.edit.selected_text()
        print("selected_text", correction)
        patterns.append({"tags": [last_tag], "input": last_input, "output": correction})
        save_config_json("openai.json", patterns)

    def openai_new_tag(text: str):
        """create a new openai tag"""
        ctx.lists["user.openai_tag"][text] = text
        print(ctx.lists["user.openai_tag"])


patterns = load_config_json("openai.json", [])

tags = set()
for pattern in patterns:
    tags = tags.union(pattern["tags"])

ctx = Context()
ctx.lists["user.openai_tag"] = tags
