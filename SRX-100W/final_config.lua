function readformatEvent()
    if result() == 2 then
        return "READ_ERROR"
    end

    local o_data
    local data = readResult():cornerCoordinates()
    local x1_y1 = field(data, 1, ":")
    local x2_y2 = field(data, 2, ":")
    local x1 = tonumber(field(x1_y1, 1, "/"))
    local y1 = tonumber(field(x1_y1, 2, "/"))
    local x2 = tonumber(field(x2_y2, 1, "/"))
    local y2 = tonumber(field(x2_y2, 2, "/"))

    local data2 = readResult():centerCoordinate() -- Returns the center coordinates (format X1/Y1)
    local center_x = field(data2, 1, "/")         
    local center_y = field(data2, 2, "/")

    local compile_data

    if (x1 - x2) == 0 then
        o_data = "90"
        compile_data = o_data .. ":" .. center_x .. ":" .. center_y .. ":" .. readResult():readData()
        return compile_data  -- Print data in terminal (format: id:angle:centerX:centerY)
        
    elseif (y1 - y2) == 0 then
        o_data = "0"
        compile_data = o_data .. ":" .. center_x .. ":" .. center_y .. ":" .. readResult():readData()
        return compile_data
    else
        o_data = (y1 - y2) / (x2 - x1)
        o_data = math.atan(o_data)
        o_data = math.deg(o_data)
        o_data = math.floor(o_data)
        compile_data = o_data .. ":" .. center_x .. ":" .. center_y .. ":" .. readResult():readData()
        return compile_data
    end
end
