PROGRAM = "swayimg"
FENNEL_DIR = "/usr/share/lua/5.4"

-- Locate a file relative to the config directory.
local function find_config_file(file)
   local config_home = os.getenv("XDG_CONFIG_HOME")
      or os.getenv("HOME") .. "/.config/"
   return config_home .. "/" .. PROGRAM .. "/" .. file
end

-- Add Fennel to search path.
package.path = package.path .. ";" .. FENNEL_DIR .. "/?.lua"

-- Run Fennel init script.
require("fennel").install().dofile(find_config_file("init.fnl"))
