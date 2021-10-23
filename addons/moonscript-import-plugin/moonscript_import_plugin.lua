local moonc_bin = os.getenv('MOONC_BIN') or 'moonc'

local function moonc(...)
	local output = Array()
	local code = OS:execute(moonc_bin, Array(...), true, output, true)
	return code, output:join()
end

do
	local moonc_v, err = moonc('-v')
	assert(moonc_v == 0, string.format("Error running '%s -v': %s", moonc_bin, err))
end

return {
	is_tool = true,
	extends = "EditorImportPlugin",

	get_importer_name = function(self)
		return "moonscript_import_plugin"
	end,

	get_visible_name = function(self)
		return "MoonScript"
	end,

	get_recognized_extensions = function(self)
		return Array("moon")
	end,

	get_save_extension = function(self)
		return "lua"
	end,

	get_resource_type = function(self)
		return "PluginScript"
	end,

	get_preset_count = function(self)
		return 0
	end,

	get_preset_name = function(self)
		return "Default"
	end,

	get_import_options = function(self)
		return Array()
	end,

	import = function(self, source_file, save_path, options, platform_variants, gen_files)
		source_file = ProjectSettings:globalize_path(source_file)
		save_path = ProjectSettings:globalize_path(string.format("%s.%s", save_path, self:get_save_extension()))

		local ret, output = moonc('-o', save_path, source_file)
		if ret ~= 0 then
			GD.print_error(string.format("Error importing %q: %s", source_file, output))
			return GD.FAILED
		end
		return GD.OK
	end,
}
