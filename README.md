# Zia
A Roblox Library that searches hierarchies using strings

# API

```lua
-- Start
local zia = Zia.new(starting.location)

-- Search
local location = zia("path/from/starting/location")

-- Chain
local location1 = location("path/from/location")
local location2 = location("another/path/from/location")

-- Return Instance
local instance = location()

local instance1 = location1()
local instance2 = location2()
