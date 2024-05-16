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

while line ~= nil do
	for i = 1, string.len(line) do
		if type(tonumber(line:sub(i, i))) == "number" and first_digit == "" then -- check if specific index is a number and no other number was found
			first_digit = line:sub(i, i)
		end
		if
			type(tonumber(line:sub(string.len(line) - (i - 1), string.len(line) - (i - 1)))) == "number" -- here we sub by 1 to account for start index 1
			and second_digit == ""
		then
			second_digit = line:sub(string.len(line) - (i - 1), string.len(line) - (i - 1))
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
