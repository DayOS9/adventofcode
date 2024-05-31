-- day2 of advent 2023
-- Day 2: Cube Conundrum part 2

--open file for reading
local file = io.open("input.txt", "r")
if file == nil then
	print("File doesn to exist or has no values")
end

local line = file:read() -- grab the first line and check if empty

local sum = 0 -- each line possible game id is added

local r = 1
local g = 1
local b = 1

-- the number of cubes total in the bag
Cubes = {}
Cubes["red"] = 12
Cubes["green"] = 13
Cubes["blue"] = 14

local function cube(text)
	--array to perfrom operations
	local oper = {}
	--vars for storing id and numbers of cubes
	local id
	--array to store games section
	local games = ""

	local final = {}

	--split the string with game id on one end and the games on the other end
	local i = 1
	for s in text:gmatch("([^:]+)") do
		oper[i] = s
		i = i + 1
	end
	games = oper[2]

	-- now split further the game id portion to get the id alone
	i = 1
	for s in oper[1]:gmatch("%S+") do
		oper[i] = s
		i = i + 1
	end
	id = oper[2]

	--clear array and then split up the games portion
	oper = {}
	i = 1
	for s in games:gmatch("([^,;]+)") do
		oper[i] = s
		i = i + 1
	end

	--now iterate through all games and check
	i = 1
	for s = 1, #oper do
		for w in oper[s]:gmatch("%S+") do
			final[i] = w
			i = i + 1
		end
		--if tonumber(final[1]) > Cubes[final[2]] then
		--	r = 1
		--	b = 1
		--	g = 1
		--	return
		--end
		-- now check which color it is and find the max
		if final[2] == "red" then
			r = math.max(r, tonumber(final[1]))
		elseif final[2] == "blue" then
			b = math.max(b, tonumber(final[1]))
		else
			g = math.max(g, tonumber(final[1]))
		end
		i = 1
		final = {}
	end
	sum = sum + (r * b * g)
	r = 1
	b = 1
	g = 1
end

while line ~= nil do
	cube(line)
	line = file:read()
end

print(sum)
