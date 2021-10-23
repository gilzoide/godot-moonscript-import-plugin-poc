tool
extends EditorPlugin

const MoonScriptImportPlugin = preload("moonscript_import_plugin.lua")

var _moonscript_importer

func _enter_tree() -> void:
	_moonscript_importer = MoonScriptImportPlugin.new()
	add_import_plugin(_moonscript_importer)


func _exit_tree() -> void:
	remove_import_plugin(_moonscript_importer)
	_moonscript_importer = null
