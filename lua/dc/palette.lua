-- Dracula palette (MIT), jittered once per session.
local original = {
  background = "#282a36",
  current_line = "#44475a",
  foreground = "#f8f8f2",
  comment = "#6272a4",
  cyan = "#8be9fd",
  green = "#50fa7b",
  orange = "#ffb86c",
  pink = "#ff79c6",
  purple = "#bd93f9",
  red = "#ff5555",
  yellow = "#f1fa8c",

  -- Dracula-derived surfaces used for UI and diff highlights.
  menu = "#21222c",
  selection = "#44475a",
  subtle = "#343746",
  diff_add = "#294436",
  diff_change = "#3b3f56",
  diff_delete = "#4b2f3d",
}

local clock = vim.uv or vim.loop
local seed = math.floor(clock.hrtime() % 2147483647)

if seed == 0 then
  seed = 1
end

local function random(max)
  local high = math.floor(seed / 44488)
  local low = seed % 44488
  seed = 48271 * low - 3399 * high

  if seed <= 0 then
    seed = seed + 2147483647
  end

  return seed % max
end

local function jitter(hex)
  local channels = {}
  for value in hex:gmatch("%x%x") do
    local channel = tonumber(value, 16) + random(11) - 5
    channels[#channels + 1] = math.max(0, math.min(255, channel))
  end
  return string.format("#%02x%02x%02x", channels[1], channels[2], channels[3])
end

local palette = {}

for name, color in pairs(original) do
  palette[name] = jitter(color)
end

return palette
