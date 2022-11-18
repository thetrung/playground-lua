-- Lua implementation of PHP scandir function
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
        -- print(filename)
    end
    pfile:close()
    return t
end

local files = scandir('.')

for _,old_name in pairs(files) do
    local found = string.find(old_name, ".png")
    if found then
        -- let trim them :
        local new_name = string.sub(old_name, 13, string.len(old_name))
        os.rename(old_name, new_name)
        print(old_name .. "->" .. new_name)
    end
end