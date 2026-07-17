-- Zia

-- 7/16/26
-- Author: speedinspider

local Zia = {}
Zia.__index = Zia

-- [[ Creates a new Zia object ]]
-- @param path The root location
-- @constructor Zia.new(path)
-- @treturn Zia
function Zia.new(path)
	return setmetatable({
		_path = path
	}, Zia)
end

-- [[ Returns the value of path[key] ]]
-- @return The value of path[key]
function Zia:__index(index)
	local path = self._path
	local key = path[index]

	if path and key then
		if type(key) == "function" then
			return function(...)
				return pcall(key, path, ...)
			end
		else
			return path[key]
		end
	end
end

-- [[ Set the value of path[key] ]]
function Zia:__newindex(key, value)
	self._path[key] = value
end

-- [[ Extends the path or returns the instance if blank ]]
-- @param path The path to extend
function Zia:__call(path)
	if path then
		path = string.split(path, "/")

		local location = self._path
		for _, connector in path do
			location = self._path[connector] or
				self._path:FindFirstChild(connector) or 
				self._path:WaitForChild(connector)
		end

		self:Extend(location)
	else
		return self._path
	end
end

-- [[ Extends the path ]]
-- @param path The path to extend
-- @treturn Zia
function Zia:Extend(path)
	return Zia.new(path)
end

return Zia