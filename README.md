# MoonScript EditorImportPlugin
Proof of concept [import plugin](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/import_plugins.html)
for using [MoonScript](https://moonscript.org/) in [Godot](https://godotengine.org/),
based on [Lua PluginScript](https://github.com/gilzoide/godot-lua-pluginscript).

MoonScript code is compiled ahead-of-time to Lua code on import by calling the
`moonc` executable.
Check out the [import plugin implementation](addons/moonscript-import-plugin/moonscript_import_plugin.lua).

A [Hello World scene](HelloMoonScript.tscn) is included, as a super basic example of usage.


## Caveats
- MoonScript must be installed and available in the system's `PATH`.
  Follow these instructions to [install MoonScript](https://leafo.net/posts/getting_started_with_moonscript.html).
- MoonScript must be edited in an external editor. Since MoonScript code is
  imported as Lua code, Godot shows the compiled Lua code when opening `.moon`
  files in the script editor.
- Imported files cannot be changed and I've experienced alert popups with the
  message: `Imported resources can't be saved`.
- Script classes must follow the Lua PluginScript architecture, being defined
  as tables instead of MoonScript classes.
  Check out [hello.moon](hello.moon) for an example.
