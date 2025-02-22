# CORE CONFIGURATION OPTIONS
complete -c mame -f -o readconfig -d "Enable loading of configuration files"
complete -c mame -f -o writeconfig -d "Write configuration to (driver).ini on exit"

# CORE SEARCH PATH OPTIONS
complete -c mame -r -o homepath -d "Path to base folder for plugin data (read/write)"
complete -c mame -r -o rompath -d "Path to ROM sets and hard disk images"
complete -c mame -r -o hashpath -d "Path to software definition files"
complete -c mame -r -o samplepath -d "Path to audio sample sets"
complete -c mame -r -o artpath -d "Path to artwork files"
complete -c mame -r -o ctrlrpath -d "Path to controller definitions"
complete -c mame -r -o inipath -d "Path to ini files"
complete -c mame -r -o fontpath -d "Path to font files"
complete -c mame -r -o cheatpath -d "Path to cheat files"
complete -c mame -r -o crosshairpath -d "Path to crosshair files"
complete -c mame -r -o pluginspath -d "Path to plugin files"
complete -c mame -r -o languagepath -d "Path to UI translation files"
complete -c mame -r -o swpath -d "Path to loose software"

# CORE OUTPUT DIRECTORY OPTIONS
complete -c mame -r -o cfg_directory -d "Directory to save configurations"
complete -c mame -r -o nvram_directory -d "Directory to save NVRAM contents"
complete -c mame -r -o input_directory -d "Directory to save input device logs"
complete -c mame -r -o state_directory -d "Directory to save states"
complete -c mame -r -o snapshot_directory -d "Directory to save/load screenshots"
complete -c mame -r -o diff_directory -d "Directory to save hard drive image difference files"
complete -c mame -r -o comment_directory -d "Directory to save debugger comments"
complete -c mame -r -o share_directory -d "Directory to share with emulated machines"

# CORE STATE/PLAYBACK OPTIONS
complete -c mame -r -o state -d "Saved state to load"
complete -c mame -f -o autosave -d "Automatically restore state on start and save on exit for supported systems"
complete -c mame -f -o rewind -d "Enable rewind savestates"
complete -c mame -x -o rewind_capacity -d "Rewind buffer size in megabytes"
complete -c mame -r -o playback -d "Playback an input file"
complete -c mame -r -o record -d "Record an input file"
complete -c mame -f -o exit_after_playback -d "Close the program at the end of playback"
complete -c mame -r -o mngwrite -d "Optional filename to write a MNG movie of the current session"
complete -c mame -r -o aviwrite -d "Optional filename to write an AVI movie of the current session"
complete -c mame -r -o wavwrite -d "Optional filename to write a WAV file of the current session"
complete -c mame -x -o snapname -d "Override of the default snapshot/movie naming; %g == gamename, %i == index"
complete -c mame -x -o snapsize -d "Specify snapshot/movie resolution (<width>x<height>) or 'auto' to use minimal size"
complete -c mame -x -o snapview -d "Snapshot/movie view - 'auto' for default, or 'native' for per-screen pixel-aspect views"
complete -c mame -f -o snapbilinear -d "Specify if the snapshot/movie should have bilinear filtering applied"
complete -c mame -x -o statename -d "Override of the default state subfolder naming; %g == gamename"
complete -c mame -f -o burnin -d "Create burn-in snapshots for each screen"

# CORE PERFORMANCE OPTIONS
complete -c mame -f -o autoframeskip -d "Enable automatic frameskip adjustment to maintain emulation speed"
complete -c mame -o frameskip -d "Set frameskip to fixed value, 0-10 (upper limit with autoframeskip)"
complete -c mame -o seconds_to_run -d "Number of emulated seconds to run before automatically exiting"
complete -c mame -o throttle -d "Throttle emulation to keep system running in sync with real time"
complete -c mame -f -o sleep -d "Enable sleeping, which gives time back to other applications when idle"
complete -c mame -o speed -d "Controls the speed of gameplay, relative to realtime; smaller numbers are slower"
complete -c mame -o refreshspeed -d "Automatically adjust emulation speed to keep the emulated refresh rate slower than the host screen"
complete -c mame -o lowlatency -d "Draws new frame before throttling to reduce input latency"

# CORE RENDER OPTIONS
complete -c mame -f -o keepaspect -d "Maintain aspect ratio when scaling to fill output screen/window"
complete -c mame -f -o unevenstretch -d "Allow non-integer ratios when scaling to fill output screen/window horizontally or vertically"
complete -c mame -f -o unevenstretchx -d "Allow non-integer ratios when scaling to fill output screen/window horizontally"
complete -c mame -f -o unevenstretchy -d "Allow non-integer ratios when scaling to fill otuput screen/window vertially"
complete -c mame -f -o autostretchxy -d "Automatically apply -unevenstretchx/y based on source native orientation"
complete -c mame -f -o intoverscan -d "Allow overscan on integer scaled targets"
complete -c mame -x -o intscalex -d "Set horizontal integer scale factor"
complete -c mame -x -o intscaley -d "Set vertical integer scale factor"

# CORE ROTATION OPTIONS
complete -c mame -f -o rotate -d "Rotate the game screen according to the game's orientation when needed"
complete -c mame -f -o ror -d "Rotate screen clockwise 90 degrees"
complete -c mame -f -o rol -d "Rotate screen counterclockwise 90 degrees"
complete -c mame -f -o autoror -d "Automatically rotate screen clockwise 90 degrees if vertical"
complete -c mame -f -o autorol -d "Automatically rotate screen counterclockwise 90 degrees if vertical"
complete -c mame -f -o flipx -d "Flip screen left-right"
complete -c mame -f -o flipy -d "Flip screen upside-down"

# CORE ARTWORK OPTIONS
complete -c mame -o artwork_crop -d "Crop artwork so emulated screen image fills output screen/window in one axis"
complete -c mame -o fallback_artwork -d "Fallback artwork if no external artwork or internal driver layout defined"
complete -c mame -o override_artwork -d "Override artwork for external artwork and internal driver layout"

# CORE SCREEN OPTIONS
complete -c mame -x -o brightness -d "Default game screen brightness correction"
complete -c mame -x -o contrast -d "Default game screen contrast correction"
complete -c mame -x -o gamma -d "Default game screen gamma correction"
complete -c mame -x -o pause_brightness -d "Amount to scale the screen brightness when paused"
complete -c mame -r -o effect -d "Name of a PNG file to use for visual effects, or 'none'"

# CORE VECTOR OPTIONS
complete -c mame -x -o beam_width_min -d "Set vector beam width minimum"
complete -c mame -x -o beam_width_max -d "Set vector beam width maximum"
complete -c mame -x -o beam_dot_size -d "Set vector beam size for dots"
complete -c mame -x -o beam_intensity_weight -d "Set vector beam intensity weight"
complete -c mame -x -o flicker -d "Set vector flicker effect"

# CORE SOUND OPTIONS
complete -c mame -x -o samplerate -d "Set sound output sample rate"
complete -c mame -f -o samples -d "Enable the use of external samples if available"
complete -c mame -x -o volume -d "Sound volume in decibels (-32 min, 0 max)"
complete -c mame -f -o compressor -d "Enable compressor for sound"
complete -c mame -x -o speaker_report -d "Print report of speaker ouput maxima (0=none, or 1-4 for more detail)" -a "0 1 2 3 4"

# CORE INPUT OPTIONS
complete -c mame -f -o coin_lockout -d "Ignore coin inputs if coin lockout output is active"
complete -c mame -x -o ctrlr -d "Preconfigure for specified controller"
complete -c mame -f -o mouse -d "Enable mouse input"
complete -c mame -f -o joystick -d "Enable joystick input"
complete -c mame -f -o lightgun -d "Enable lightgun input"
complete -c mame -f -o multikeyboard -d "Enable separate input from each keyboard device (if present)"
complete -c mame -f -o multimouse -d "Enable separate input from each mouse device (if present)"
complete -c mame -f -o steadykey -d "Enable steadykey support"
complete -c mame -f -o ui_active -d "Enable user interface on top of emulated keyboard (if present)"
complete -c mame -f -o offscreen_reload -d "Convert lightgun button 2 into offscreen reload"
complete -c mame -x -o joystick_map -d "Explicit joystick map, or auto to auto-select"
complete -c mame -x -o joystick_deadzone -d "Center deadzone range for joystick where change is ignored (0.0 center, 1.0 end)"
complete -c mame -x -o joystick_saturation -d "End of axis saturation range for joystick where change is ignored (0.0 center, 1.0 end)"
complete -c mame -x -o joystick_threshold -d "Threshold for joystick to be considered active as a switch (0.0 center, 1.0 end)"
complete -c mame -f -o natural -d "Specifies whether to use a natural keyboard or not"
complete -c mame -f -o joystick_contradictory -d "Enable contradictory direction digital joystick input at the same time"
complete -c mame -x -o coin_impulse -d "Set coin impulse time (n<0 disable impulse, n==0 obey driver, 0<n set time n)"

# CORE INPUT AUTOMATIC ENABLE OPTIONS
complete -c mame -x -o paddle_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a paddle control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o adstick_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if an analog joystick control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o pedal_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a pedal control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o dial_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a dial control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o trackball_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a trackball control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o lightgun_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a lightgun control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o positional_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a positional control is present" -a "none keyboard mouse lightgun joystick"
complete -c mame -x -o mouse_device -d "Enable (none|keyboard|mouse|lightgun|joystick) if a mouse control is present" -a "none keyboard mouse lightgun joystick"

# CORE DEBUGGING OPTIONS
complete -c mame -f -o verbose -d "Display additional diagnostic information"
complete -c mame -f -o log -d "Generate an error.log file"
complete -c mame -f -o oslog -d "Output error.log data to system diagnostic output (debugger or standard error)"
complete -c mame -f -o debug -d "Enable/disable debugger"
complete -c mame -f -o update_in_pause -d "Keep calling video updates while in pause"
complete -c mame -f -o debugscript -d "Script for debugger"
complete -c mame -f -o debuglog -d "Write debug console output to debug.log"

# CORE COMM OPTIONS
complete -c mame -x -o comm_localhost -d "Local address to bind to"
complete -c mame -x -o comm_localport -d "Local port to bind to"
complete -c mame -x -o comm_remotehost -d "Remote address to connect to"
complete -c mame -x -o comm_remoteport -d "Remote port to connect to"
complete -c mame -o comm_framesync -d "Sync frames"

# CORE MISC OPTIONS
complete -c mame -f -o drc -d "Enable DRC CPU core if available"
complete -c mame -f -o drc_use_c -d "Force DRC to use C backend"
complete -c mame -f -o drc_log_uml -d "Write DRC UML disassembly log"
complete -c mame -f -o drc_log_native -d "Write DRC native disassembly log"
complete -c mame -x -o bios -d "Select the system BIOS to use"
complete -c mame -f -o cheat -d "Enable cheat subsystem"
complete -c mame -f -o skip_gameinfo -d "Skip displaying the system information screen at startup"
complete -c mame -x -o uifont -d "Specify a font to use"
complete -c mame -x -o ui -d "Type of UI (simple|cabinet)" -a "simple cabinet"
complete -c mame -x -o ramsize -d "Size of RAM (if supported by driver)"
complete -c mame -f -o confirm_quit -d "Ask for confirmation before exiting"
complete -c mame -f -o ui_mouse -d "Display UI mouse cursor"
complete -c mame -x -o language -d "Set UI display language"
complete -c mame -f -o nvram_save -d "Save NVRAM data on exit"

# SCRIPTING OPTIONS
complete -c mame -x -o autoboot_command -d "Command to execute after machine boot"
complete -c mame -x -o autoboot_delay -d "Delay before executing autoboot command (seconds)"
complete -c mame -x -o autoboot_script -d "Lua script to execute after machine boot"
complete -c mame -f -o console -d "Enable emulator Lua console"
complete -c mame -f -o plugins -d "Enable Lua plugin support"
complete -c mame -x -o plugin -d "List of plugins to enable"
complete -c mame -x -o noplugin -d "List of plugins to disable"

# HTTP SERVER OPTIONS
complete -c mame -f -o http -d "Enable HTTP server"
complete -c mame -x -o http_port -d "HTTP server port"
complete -c mame -r -o http_root -d "HTTP server document root"

# OSD INPUT MAPPING OPTIONS
complete -c mame -x -o uimodekey -d "Key to enable/disable MAME controls when emulated system has keyboard inputs"
complete -c mame -r -o controller_map -d "Game controller mapping file"
complete -c mame -f -o background_input -d "Don't ignore input when losing UI focus"

# OSD FONT OPTIONS
complete -c mame -x -o uifontprovider -d "Provider for UI font: sdl or none" -a "sdl none"

# OSD OUTPUT OPTIONS
complete -c mame -x -o output -d "Provider for output notifications: none, console or network" -a "none console network"

# OSD INPUT OPTIONS
complete -c mame -x -o keyboardprovider -d "Provider for keyboard input: sdl or none" -a "sdl none"
complete -c mame -x -o mouseprovider -d "Provider for mouse input: sdl or none" -a "sdl none"
complete -c mame -x -o lightgunprovider -d "Provider for lightgun input: sdl, x11 or none" -a "sdl x11 none"
complete -c mame -x -o joystickprovider -d "Provider for joystick input: sdlgame, sdljoy or none" -a "sdlgame sdljoy none"

# OSD CLI OPTIONS
complete -c mame -f -o listmidi -d "List available MIDI I/O devices"
complete -c mame -f -o listnetwork -d "List available network adapters"

# OSD DEBUGGING OPTIONS
complete -c mame -x -o debugger -d "Debugger used: qt, imgui, gdbstub or none" -a "qt imgui gdbstub none"
complete -c mame -o debugger_host -d "Address to bind to for gdbstub debugger"
complete -c mame -o debugger_port -d "Port to use for gdbstub debugger"
complete -c mame -o debugger_font -d "Font to use for debugger views"
complete -c mame -o debugger_font_size -d "Font size to use for debugger views"
complete -c mame -o watchdog -d "Force the program to terminate if no updates within specified number of seconds"

# OSD PERFORMANCE OPTIONS
complete -c mame -o numprocessors -d "Number of processors; this overrides the number the system reports"
complete -c mame -o bench -d "Benchmark for the given number of emulated seconds; implies -video none -sound none -nothrottle"

# OSD VIDEO OPTIONS
complete -c mame -x -o video -d "Video output method: opengl, bgfx, accel, soft or none" -a "opengl bgfx accel soft none"
complete -c mame -x -o numscreens -d "Number of output screens/windows to create; usually, you want just one"
complete -c mame -f -o window -d "Enable window mode; otherwise, full screen mode is assumed"
complete -c mame -f -o maximize -d "Default to maximized windows"
complete -c mame -f -o waitvsync -d "Enable waiting for the start of VBLANK before flipping screens (reduces tearing effects)"
complete -c mame -f -o syncrefresh -d "Enable using the start of VBLANK for throttling instead of the game time"
complete -c mame -x -o monitorprovider -d "Monitor discovery method: sdl" -a "sdl"

# OSD PER-WINDOW VIDEO OPTIONS
complete -c mame -x -o screen -d "Explicit name of the first screen; 'auto' here will try to make a best guess"
complete -c mame -x -o aspect -d "Aspect ratio for all screens; 'auto' here will try to make a best guess"
complete -c mame -x -o resolution -d "Preferred resolution for all screens; format is <width>x<height>[@<refreshrate>] or 'auto'"
complete -c mame -x -o view -d "Preferred view for all screens"
complete -c mame -x -o screen0 -d "Explicit name of the first screen; 'auto' here will try to make a best guess"
complete -c mame -x -o aspect0 -d "Aspect ratio of the first screen; 'auto' here will try to make a best guess"
complete -c mame -x -o resolution0 -d "Preferred resolution of the first screen; format is <width>x<height>[@<refreshrate>] or 'auto'"
complete -c mame -x -o view0 -d "Preferred view for the first screen"
complete -c mame -x -o screen1 -d "Explicit name of the second screen; 'auto' here will try to make a best guess"
complete -c mame -x -o aspect1 -d "Aspect ratio of the second screen; 'auto' here will try to make a best guess"
complete -c mame -x -o resolution1 -d "Preferred resolution of the second screen; format is <width>x<height>[@<refreshrate>] or 'auto'"
complete -c mame -x -o view1 -d "Preferred view for the second screen"
complete -c mame -x -o screen2 -d "Explicit name of the third screen; 'auto' here will try to make a best guess"
complete -c mame -x -o aspect2 -d "Aspect ratio of the third screen; 'auto' here will try to make a best guess"
complete -c mame -x -o resolution2 -d "Preferred resolution of the third screen; format is <width>x<height>[@<refreshrate>] or 'auto'"
complete -c mame -x -o view2 -d "Preferred view for the third screen"
complete -c mame -x -o screen3 -d "Explicit name of the fourth screen; 'auto' here will try to make a best guess"
complete -c mame -x -o aspect3 -d "Aspect ratio of the fourth screen; 'auto' here will try to make a best guess"
complete -c mame -x -o resolution3 -d "Preferred resolution of the fourth screen; format is <width>x<height>[@<refreshrate>] or 'auto'"
complete -c mame -x -o view3 -d "Preferred view for the fourth screen"

# OSD FULL SCREEN OPTIONS
complete -c mame -f -o switchres -d "Enable resolution switching"

# OSD ACCELERATED VIDEO OPTIONS
complete -c mame -o filter -d "Use bilinear filtering when scaling emulated video"
complete -c mame -o prescale -d "Scale emulated video by this factor before applying filters/shaders"

# OpenGL-SPECIFIC OPTIONS
complete -c mame -o gl_forcepow2texture -d "Force power-of-two texture sizes (default no)"
complete -c mame -o gl_notexturerect -d "Don't use OpenGL GL_ARB_texture_rectangle (default on)"
complete -c mame -o gl_vbo -d "Enable OpenGL VBO if available (default on)"
complete -c mame -o gl_pbo -d "Enable OpenGL PBO if available (default on)"
complete -c mame -o gl_glsl -d "Enable OpenGL GLSL if available (default off)"
complete -c mame -o gl_glsl_filter -d "Enable OpenGL GLSL filtering instead of FF filtering 0-plain, 1-bilinear (default), 2-bicubic"
complete -c mame -o glsl_shader_mame0 -d "Custom OpenGL GLSL shader set mame bitmap 0"
complete -c mame -o glsl_shader_mame1 -d "Custom OpenGL GLSL shader set mame bitmap 1"
complete -c mame -o glsl_shader_mame2 -d "Custom OpenGL GLSL shader set mame bitmap 2"
complete -c mame -o glsl_shader_mame3 -d "Custom OpenGL GLSL shader set mame bitmap 3"
complete -c mame -o glsl_shader_mame4 -d "Custom OpenGL GLSL shader set mame bitmap 4"
complete -c mame -o glsl_shader_mame5 -d "Custom OpenGL GLSL shader set mame bitmap 5"
complete -c mame -o glsl_shader_mame6 -d "Custom OpenGL GLSL shader set mame bitmap 6"
complete -c mame -o glsl_shader_mame7 -d "Custom OpenGL GLSL shader set mame bitmap 7"
complete -c mame -o glsl_shader_mame8 -d "Custom OpenGL GLSL shader set mame bitmap 8"
complete -c mame -o glsl_shader_mame9 -d "Custom OpenGL GLSL shader set mame bitmap 9"
complete -c mame -o glsl_shader_screen0 -d "Custom OpenGL GLSL shader screen bitmap 0"
complete -c mame -o glsl_shader_screen1 -d "Custom OpenGL GLSL shader screen bitmap 1"
complete -c mame -o glsl_shader_screen2 -d "Custom OpenGL GLSL shader screen bitmap 2"
complete -c mame -o glsl_shader_screen3 -d "Custom OpenGL GLSL shader screen bitmap 3"
complete -c mame -o glsl_shader_screen4 -d "Custom OpenGL GLSL shader screen bitmap 4"
complete -c mame -o glsl_shader_screen5 -d "Custom OpenGL GLSL shader screen bitmap 5"
complete -c mame -o glsl_shader_screen6 -d "Custom OpenGL GLSL shader screen bitmap 6"
complete -c mame -o glsl_shader_screen7 -d "Custom OpenGL GLSL shader screen bitmap 7"
complete -c mame -o glsl_shader_screen8 -d "Custom OpenGL GLSL shader screen bitmap 8"
complete -c mame -o glsl_shader_screen9 -d "Custom OpenGL GLSL shader screen bitmap 9"

# OSD SOUND OPTIONS
complete -c mame -x -o sound -d "Sound output method: sdl, portaudio, pulse or none" -a "sdl portaudio pulse none"
complete -c mame -o audio_latency -d "Set audio latency (increase to reduce glitches, decrease for responsiveness)"

# PORTAUDIO OPTIONS
complete -c mame -o pa_api -d "PortAudio API"
complete -c mame -o pa_device -d "PortAudio device"
complete -c mame -o pa_latency -d "Suggested latency in seconds, 0 for default"

# OSD MIDI OPTIONS
complete -c mame -x -o midiprovider -d "MIDI I/O method: pm or none" -a "pm none"

# OSD EMULATED NETWORKING OPTIONS
complete -c mame -x -o networkprovider -d "Emulated networking provider: taptun or none" -a "taptun none"

# BGFX POST-PROCESSING OPTIONS
complete -c mame -r -o bgfx_path -d "Path to BGFX-related files"
complete -c mame -x -o bgfx_backend -d "BGFX backend to use (d3d9, d3d11, d3d12, metal, opengl, gles, vulkan)" -a "d3d9 d3d11 d3d12 metal opengl gles vulkan"
complete -c mame -f -o bgfx_debug -d "Enable BGFX debugging statistics"
complete -c mame -x -o bgfx_screen_chains -d "Comma-delimited list of screen chain JSON names, colon-delimited per-window"
complete -c mame -x -o bgfx_shadow_mask -d "Shadow mask texture name"
complete -c mame -x -o bgfx_lut -d "LUT texture name"
complete -c mame -r -o bgfx_avi_name -d "Filename for BGFX output logging"

# SDL PERFORMANCE OPTIONS
complete -c mame -f -o sdlvideofps -d "Show sdl video performance"

# SDL VIDEO OPTIONS
complete -c mame -f -o centerh -d "Center horizontally within the view area"
complete -c mame -f -o centerv -d "Center vertically within the view area"
complete -c mame -x -o scalemode -d "Scale mode: none, hwblit, hwbest, yv12, yuy2, yv12x2, yuy2x2 (-video soft only)" -a "none hwblit hwbest yv12 yuy2 yv12x2 yuy2x2"

# SDL FULL SCREEN OPTIONS
complete -c mame -f -o useallheads -d "Split full screen image across monitors"
complete -c mame -o attach_window -d "Attach to arbitrary window"

# SDL KEYBOARD MAPPING
complete -c mame -f -o keymap -d "Enable keymap"
complete -c mame -r -o keymap_file -d "Keymap filename"

# SDL INPUT OPTIONS
complete -c mame -f -o enable_touch -d "Enable touch input support"
complete -c mame -f -o sixaxis -d "Use special handling for PS3 Sixaxis controllers"
complete -c mame -f -o dual_lightgun -d "Enable dual lightgun input"

# SDL LIGHTGUN MAPPING
complete -c mame -x -o lightgun_index1 -d "Name of lightgun mapped to lightgun #1"
complete -c mame -x -o lightgun_index2 -d "Name of lightgun mapped to lightgun #2"
complete -c mame -x -o lightgun_index3 -d "Name of lightgun mapped to lightgun #3"
complete -c mame -x -o lightgun_index4 -d "Name of lightgun mapped to lightgun #4"
complete -c mame -x -o lightgun_index5 -d "Name of lightgun mapped to lightgun #5"
complete -c mame -x -o lightgun_index6 -d "Name of lightgun mapped to lightgun #6"
complete -c mame -x -o lightgun_index7 -d "Name of lightgun mapped to lightgun #7"
complete -c mame -x -o lightgun_index8 -d "Name of lightgun mapped to lightgun #8"

# SDL LOW-LEVEL DRIVER OPTIONS
complete -c mame -x -o videodriver -d "SDL video driver to use ('x11', 'directfb', ... or 'auto' for SDL default"
complete -c mame -x -o renderdriver -d "SDL render driver to use ('software', 'opengl', 'directfb' ... or 'auto' for SDL default"
complete -c mame -x -o audiodriver -d "SDL audio driver to use ('alsa', 'arts', ... or 'auto' for SDL default"
complete -c mame -x -o gl_lib -d "Alternative libGL.so to use; 'auto' for system default"

# CORE COMMANDS
complete -c mame -f -o help -d "Show help message"
complete -c mame -f -o validate -d "Perform validation on system drivers and devices"

# CONFIGURATION COMMANDS
complete -c mame -f -o createconfig -d "Create the default configuration file"
complete -c mame -f -o showconfig -d "Display running parameters"
complete -c mame -f -o showusage -d "Show this help"

# FRONTEND COMMANDS
complete -c mame -f -o listxml -d "All available info on driver in XML format"
complete -c mame -f -o listfull -d "Short name, full name"
complete -c mame -f -o listsource -d "Driver sourcefile"
complete -c mame -f -o listclones -d "Show clones"
complete -c mame -f -o listbrothers -d "Show \"Brothers\", or other drivers from same sourcefile"
complete -c mame -f -o listcrc -d "CRC-32s"
complete -c mame -f -o listroms -d "List required ROMs for a driver"
complete -c mame -f -o listsamples -d "List optional samples for a driver"
complete -c mame -f -o verifyroms -d "Report romsets that have problems"
complete -c mame -f -o verifysamples -d "Report samplesets that have problems"
complete -c mame -f -o romident -d "Compare files with known MAME ROMs"
complete -c mame -f -o listdevices -d "List devices in a system"
complete -c mame -f -o listslots -d "List available slots and slot devices"
complete -c mame -f -o listbios -d "List BIOS options for a system"
complete -c mame -f -o listmedia -d "List available media for the system"
complete -c mame -f -o listsoftware -d "List known software for the system"
complete -c mame -f -o verifysoftware -d "Verify known software for the system"
complete -c mame -f -o getsoftlist -d "Retrieve software list by name"
complete -c mame -f -o verifysoftlist -d "Verify software list by name"
complete -c mame -f -o version -d "Get MAME version"

# FRONTEND COMMAND OPTIONS
complete -c mame -f -o dtd -d "Include DTD in XML output"
