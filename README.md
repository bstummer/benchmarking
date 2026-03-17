# Benchmarking

A simple and efficient module for measuring the execution time of your Lua or Luau code. This tool helps developers identify bottlenecks and compare performance across different code implementations by calculating both total and average execution times.

Designed with Luau in mind (utilizing functions like `typeof` and `warn`), it is heavily applicable to Roblox development but can be easily adapted for standard Lua environments.

<br>

## Features

- Single Function Benchmarking: Measure exactly how long a specific function takes to run over multiple iterations.
- Multiple Function Comparison: Pass multiple functions at once to easily compare their performance sequentially.
- High Precision: Calculates execution times down to 10 decimal places.

<br>

## API Reference

### `module.Single(func, times)`

Measures the execution time of a single function.

- **Parameters:**
  - `func` (function): The function you want to benchmark.
  - `times` (number, optional): The number of iterations to run. Defaults to `100000` if not provided.
- **Returns:**
  - `result` (number): The total execution time.
  - `average` (number): The average execution time per iteration.

> Note: This function will automatically output the results to the console using `warn()`.

### `module.Multiple(...)`

Measures the execution time of multiple functions sequentially.

- **Parameters:**
  - `...` (functions): A list of functions to benchmark.
  - `times` (number, optional): If the very last argument provided is a number, it will be used as the iteration count for all functions. Defaults to `100000`.

<br>

## Usage Examples

### Benchmarking a Single Function

```lua
local Benchmark = require(path.to.Benchmarking)

local function testMath()
    local x = 0
    for i = 1, 100 do
        x = x + math.sqrt(i)
    end
end

-- Run the function 50,000 times
Benchmark.Single(testMath, 50000)
```

### Comparing Multiple Functions

```lua
local Benchmark = require(path.to.Benchmarking)

local function methodOne()
    return string.format("%s %s", "Hello", "World")
end

local function methodTwo()
    return "Hello " .. "World"
end

-- Compare both methods, running each 200,000 times
Benchmark.Multiple(methodOne, methodTwo, 200000)
```
