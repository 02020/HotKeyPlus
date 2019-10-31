function readfile(path)
    local file = io.open(path, "r")
    if file then
        local content = file:read("*a")
        io.close(file)
        return content
    end
    return nil
end

function writefile(path, content, mode)
    mode = mode or "w+b"
    local file = io.open(path, mode)
    if file then
        if file:write(content) == nil then
            return false
        end
        io.close(file)
        return true
    else
        return false
    end
end

function log(content)
    local fielPath = "D:\\log.txt"
    local _c = readfile(fielPath)
    local _l = get_log_content_title()
    if content == nil then
        content = _l .. "__null__"
    else
        content = _l .. content
    end
    writefile(fielPath, _c .. content)
end

function get_log_content_title()
    local s1 =
        "--------------------------------------------------------------------------------------"
    local s2 = "\n" .. ">> 操作时间" .. os.date("%Y-%m-%d %H:%M:%S")
    local s3 = "\n" .. ">> 内容" .. "\n"
    return "\n" .. "\n" .. s1 .. s2 .. s3
end
