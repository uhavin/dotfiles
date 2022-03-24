local _base = {
	Color = " ",
	Added = " ",
	Changed = " ",
	Deleted = " ",
	Error = " ",
	Hint = "",
	Info = " ",
	Warning = " ",
}

local Code = {
	Array = "",
	Boolean = "ﭾ",
	Class = "拾",
	Constructor = "華",
	Enum = "ﱔ",
	EnumMember = "",
	Event = "",
	Field = "ﰠ",
	Function = "",
	Interface = "璉",
	Keyword = "ﮒ",
	Method = "",
	Module = "",
    Namespace = "שּ",
    Null = "ﱵ ",
    Number = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Struct = "פּ",
	Text = "",
	TypeParameter = "",
	Unit = "塞",
	Value = "",
	Variable = "",
	Constant = "車",
}

local OS = {
	Linux = "",
	Windows = "",
	Mac = "",
}

local Files = {
	File = "",
	Folder = "",
}

local Fileformat = {
	dos = OS.Windows,
	mac = OS.Mac,
	unix = OS.Linux,
}

local Git = {
	Branch = "",
	Compare = " ",
	Added = _base.Added,
	Modified = _base.Changed,
	Removed = _base.Deleted,
}

local Diagnostics = {
	Error = _base.Error,
	Hint = _base.Hint,
	Info = _base.Info,
	Warning = _base.Warning,
}

return {
	Code = Code,
	Diagnostics = Diagnostics,
	Files = Files,
	Fileformat = Fileformat,
	Git = Git,
	OS = OS,
}
