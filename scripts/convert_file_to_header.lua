local function convert_file_to_header(input_file, output_header, var_name)
    local file = io.open(input_file, "rb")
    local byte_array = file:read("*all")
    file:close()

    local header = io.open(output_header, "w")
    header:write("const unsigned char " .. var_name .. "[] = {\n")
    for i=1, #byte_array do
        if(i-1)%12==0 then
            header:write("\n")
        end
        header:write(string.format("0x%02x, ", byte_array(i)))
    end
    header:write("\n};\n")
    header:write("const unsigned int " .. var_name .. "_size = " .. #byte_array .. ";\n")
    header:close()
end

local input_file = arg[1]
local output_header = arg[2]
local var_name = arg[3]

if not input_file or not output_header or not var_name then
    print("Usage: lua convert_file_to_header.lua <input_file> <output_file> <variable_name>")
    os.exit(1)
end

convert_file_to_header(input_file, output_header, var_name)