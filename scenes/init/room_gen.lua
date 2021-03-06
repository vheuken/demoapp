--
-- room_gen_1()
--
-- Room generation for Area 1, the Mines
--

--[[
Note:
ROOMS are 10x8 tile areas.
strTemp = "0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000";
OBSTACLES are 5x3 tile chunks that are randomized within rooms.

strObs = "00000
          00000
          00000";

The string representing a room or obstacle must be laid out unbroken:
]]

local get_rooms = require "get_rooms"

function room_gen_1(x, y, start_room_x, start_room_y, end_room_x, end_room_y)
  local str_temp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000"

  local room_path -- TO_IMPLEMENT: - global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];
  local room_path_above = -1
  local shop_type = "General"

  if get_rooms.get_rooms.get_room_y(y) ~= 0 then
    -- TO_IMPLEMENT: room_path_above = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)]
  end

  local n = 0

  if get_rooms.get_rooms.get_room_x(x) == start_room_x and get_rooms.get_rooms.get_room_y(y) == start_room_y then -- start room
    if room_path == 2 then
      n = math.random(5, 8)
    else
      n = math.random(1, 4)
    end

    if n == 1 then
      str_temp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"
    elseif n == 2 then
      str_temp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"
    elseif n == 3 then
      str_temp = "00000000000008000000000000000000L000000000P111111000L111111000L00111111111111111"
    elseif n == 4 then
      str_temp = "0000000000008000000000000000000000000L000111111P000111111L001111100L001111111111"
    elseif n == 5 then
      str_temp = "60000600000000000000000000000000000000000008000000000000000000000000002021111120"
    elseif n == 6 then
      str_temp = "11111111112222222222000000000000000000000008000000000000000000000000002021111120"
    elseif n == 7 then
      str_temp = "00000000000008000000000000000000L000000000P111111000L111111000L00011111111101111"
    elseif n == 8 then
      str_temp = "0000000000008000000000000000000000000L000111111P000111111L001111000L001111011111"
    end
  elseif get_rooms.get_room_x(x) == end_room_x and get_rooms.get_room_y(y) == end_room_y then -- end room
    if room_path_above == 2 then
      n = math.random(2, 4)
    else
      n = math.random(3, 6)
    end

    if n == 1 then
      str_temp = "00000000006000060000000000000000000000000008000000000000000000000000001111111111"
    elseif n == 2 then
      str_temp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"
    elseif n == 3 then
      str_temp = "00000000000010021110001001111000110111129012000000111111111021111111201111111111"
    elseif n == 4 then
      str_temp = "00000000000111200100011110010021111011000000002109011111111102111111121111111111"
    elseif n == 5 then
      str_temp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"
    elseif n == 6 then
      str_temp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"
    end
  elseif room_path == 0 then -- side room
    -- TO_IMPLEMENT: if current_level > 1 and not oGame.altar and math.random(1, 16) == 1 then
      n = 11
      -- TO_IMPLEMENT: oGame.altar = true
    -- TO_IMPLEMENT: elseif oGame.idol or get_rooms.get_room_y(y) == 3
      n = math.random(1, 9)
    -- TO_IMPLEMENT: else
      n = math.random(1, 10)
      if n == 10 then
        -- TO_IMPLEMENT: oGame.idol = true
      end

      if n == 1 then -- upper plats
        str_temp = "00000000000010111100000000000000011010000050000000000000000000000000001111111111"
      elseif n == 2 then -- 2-9: high walls
        str_temp = "110000000040L600000011P000000011L000000011L5000000110000000011000000001111111111"
      elseif n == 3 then
        str_temp = "00000000110060000L040000000P110000000L110050000L11000000001100000000111111111111"
      elseif n == 4 then
        str_temp = "110000000040L600000011P000000011L000000011L0000000110000000011000000001112222111"
      elseif n == 5 then
        str_temp = "00000000110060000L040000000P110000000L110000000L11000000001100000000111112222111"
      elseif n == 6 then
        str_temp = "11111111110221111220002111120000022220000002222000002111120002211112201111111111"
      elseif n == 7 then
        str_temp = "11111111111112222111112000021111102201111120000211111022011111200002111112222111"
      elseif n == 8 then
        str_temp = "11111111110000000000110000001111222222111111111111112222221122000000221100000011"
      elseif n == 9 then
        str_temp = "121111112100L2112L0011P1111P1111L2112L1111L1111L1111L1221L1100L0000L001111221111"
      elseif n == 10 then -- idols
        str_temp = "22000000220000B0000000000000000000000000000000000000000000000000I000001111A01111"
      elseif n == 11 then -- altars
        str_temp = "220000002200000000000000000000000000000000000000000000x0000002211112201111111111"
      end
  elseif room_path == 0 or room_path == 1 then -- main room
    local rand_num =  math.random(1, 12)

    if rand_num == 1 then -- 1-6: basic rooms
      str_temp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"
    elseif rand_num == 2 then
      str_temp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"
    end
  elseif room_path == 3 then -- main room

  elseif room_path == 4 then -- shop

  elseif room_path == 5 then -- shop

  elseif room_path == 8 then -- snake pit

  elseif room_path == 9 then -- snake pit bottom

  else -- drop
  end

  return str_temp
end

-- TESTING STUFF
math.randomseed(os.time())
local x = 0
local y = 0
local start_room_x = 0
local start_room_y = 0
local end_room_x = 3
local end_room_y = 3

local room = room_gen_1(x, y, start_room_x, start_room_y)

-- print room to console
for i=1, 8 do
  local start_index = (i-1) * 10
  print(room:sub(start_index+1, start_index + 10))
end

-- END TESTING STUFF
