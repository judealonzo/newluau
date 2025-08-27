
-- Example: Module System
local M = {}
function M.hello() print("Hello from module!") end
return M

-- Example: Garbage Collection
local t = {}
for i = 1, 1e5 do t[i] = {x = i} end
t = nil
collectgarbage()

-- Example: Type Annotations
local function add(a: number, b: number): number
    return a + b
end

-- Example: Pattern Matching
local s = "abc123"
local num = string.match(s, "%d+")

-- Example: Custom Iterator
local function customIter(tbl)
    local i = 0
    return function()
        i = i + 1
        if tbl[i] then return tbl[i] end
    end
end
for v in customIter({1,2,3}) do print(v) end

-- Example: Environment Manipulation (if available)
if setfenv then
    local f = function() print(x) end
    setfenv(f, {x = 42})
    f()
end

-- Example: Function Arguments
local function greet(name, greeting)
    greeting = greeting or "Hello"
    print(greeting .. ", " .. name)
end
greet("World")

-- Example: Table Packing/Unpacking
local args = {1,2,3}
print(table.unpack(args))

-- Example: Metatables
local mt = {__add = function(a, b) return a.value + b.value end}
local a = setmetatable({value = 5}, mt)
local b = setmetatable({value = 7}, mt)
print(a + b)

-- Example: Closures
local function makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end
local counter = makeCounter()
print(counter(), counter())

-- Example: Coroutines
local co = coroutine.create(function()
    for i = 1, 3 do
        coroutine.yield(i)
    end
end)
while coroutine.status(co) ~= "dead" do
    local ok, val = coroutine.resume(co)
    print(val)
end

-- Example: Error Handling
local ok, err = pcall(function() error("fail") end)
print(ok, err)

-- Example: Math Library
print(math.sqrt(16), math.random())

-- Example: String Library
print(string.upper("hello"), string.rep("ha", 3))

-- Example: Table Library
local t = {a = 1, b = 2}
for k, v in pairs(t) do print(k, v) end

-- Example: Bitwise Operations
local x = 5 | 2
print(x)

-- Example: Type Checking
print(typeof(123), typeof("abc"), typeof({}))

-- Example: Optional Type Packs
local function sum(...: number): number
    local total = 0
    for i = 1, select("#", ...) do
        total = total + select(i, ...)
    end
    return total
end
print(sum(1,2,3,4))

-- Example: Assertion
assert(1 == 1, "Should not fail")

-- Example: Comments
-- This is a single-line comment
--[[
    This is a multi-line comment
]]

-- Example: Control Flow
for i = 1, 3 do
    if i % 2 == 0 then
        print(i, "even")
    else
        print(i, "odd")
    end
end

-- Example: Repeat-Until Loop
local i = 0
repeat
    i = i + 1
until i > 3
print(i)

-- Example: Function as First-Class Value
local f = function(x) return x * x end
print(f(5))

-- Example: Table Manipulation
local t = {1,2,3}
table.insert(t, 4)
print(table.concat(t, ","))

-- Example: Unicode Strings
print("こんにちは世界") -- Hello World in Japanese

-- Example: Numeric for loop
for i = 1, 5 do print(i) end

-- Example: Generic for loop
for k, v in pairs({foo = "bar", baz = "qux"}) do print(k, v) end

-- Example: Nil and Boolean
local x = nil
local y = true
print(x, y)

-- Example: Multiple Return Values
local function foo() return 1, 2, 3 end
local a, b, c = foo()
print(a, b, c)