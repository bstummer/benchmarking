--[[

Benchmarking module (measure how fast your code is)

This module © 2021 by Vaschex is licensed under CC BY-NC 4.0. 
https://creativecommons.org/licenses/by-nc/4.0/

]]

local clock = os.clock
local module = {}

--single function
function module.Single(func:any, times:number?):(number, number)
	times = times or 100000
	local s:number, e:number
	
	s = clock()
	for _ = 1, times do func() end
	e = clock()
	
	local result = e - s
	local average = result / times

	warn("Results:\nTotal time: "..result.."\nAverage: "
		..average.." ("..string.format("%.10f", average)..")")
	return result, average
end

--multiple functions, last argument can be times
function module.Multiple(...):()
	local args = {...}
	local times = 100000
	if typeof(args[#args]) == "number" then
		times = args[#args]
		table.remove(args, #args)
	end
	
	for _, func in ipairs(args) do
		module.Single(func, times)
	end
end

return module
