-- lets open a file in read only mode
local file = io.open("input.txt", "r")
if file == nil then
	print("file does not exist or has no values")
end

-- grab the first line and check if it is empty or not
local line = file:read()

-- keep track of numbers added
local sum = 0
local first_digit = ""
local second_digit = ""
Numbers = {}
Numbers["one"] = "1"
Numbers["two"] = "2"
Numbers["three"] = "3"
Numbers["four"] = "4"
Numbers["five"] = "5"
Numbers["six"] = "6"
Numbers["seven"] = "7"
Numbers["eight"] = "8"
Numbers["nine"] = "9"

--function which will take a substring and check whether a number exists
function Number(text, index)
	if index + 4 <= string.len(text) then
		if Numbers[text:sub(index, index + 4)] ~= nil then
			return Numbers[text:sub(index, index + 4)]
		end
	end
	if index + 3 <= string.len(text) then
		if Numbers[text:sub(index, index + 3)] ~= nil then
			return Numbers[text:sub(index, index + 3)]
		end
	end
	if index + 2 <= string.len(text) then
		if Numbers[text:sub(index, index + 2)] ~= nil then
			return Numbers[text:sub(index, index + 2)]
		end
	end
	--if ctx == "second" then
	--	if index - 5 >= 1 then
	--		if Numbers[text:sub(index - 5, index)] ~= nil then
	--			return Numbers[text:sub(index - 5, index)]
	--		end
	--	end
	--	if index - 4 >= 1 then
	--		if Numbers[text:sub(index - 4, index)] ~= nil then
	--			return Numbers[text:sub(index - 4, index)]
	--		end
	--	end
	--	if index - 3 >= 1 then
	--		if Numbers[text:sub(index - 3, index)] ~= nil then
	--			return Numbers[text:sub(index - 3, index)]
	--		end
	--	end
	--end
	return "-1"
end

while line ~= nil do
	for i = 1, string.len(line) do
		if type(tonumber(line:sub(i, i))) == "number" and first_digit == "" then -- check if specific index is a number and no other number was found
			first_digit = line:sub(i, i)
		end
		if Number(line:sub(i, string.len(line)), 1) ~= "-1" and first_digit == "" then
			first_digit = Number(line:sub(i, string.len(line)), 1)
		end
		if
			type(tonumber(line:sub(string.len(line) - (i - 1), string.len(line) - (i - 1)))) == "number" -- here we sub by 1 to account for start index 1
			and second_digit == ""
		then
			second_digit = line:sub(string.len(line) - (i - 1), string.len(line) - (i - 1))
		end
		if Number(line:sub(string.len(line) - (i - 1), string.len(line)), 1) ~= "-1" and second_digit == "" then
			second_digit = Number(line:sub(string.len(line) - (i - 1), string.len(line)), 1)
		end
	end
	-- check if no number was found
	if second_digit == "" and first_digit == "" then
		first_digit = "0"
		second_digit = "0"
	end
	-- combine the numbers together to get the number for the line
	local combined = tonumber(first_digit .. second_digit)

	sum = sum + combined
	-- reset the values for first and second digit before looking into next line
	first_digit = ""
	second_digit = ""

	line = file:read()
end
file:close()
print("The total sum is " .. sum)
