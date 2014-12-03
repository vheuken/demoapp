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

  if get_room_y(y) ~= 0 then
    -- TO_IMPLEMENT: room_path_above = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)]
  end

  local n = 0

  if get_room_x(x) == start_room_x and get_room_y(y) == start_room_y then -- start room
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
    local rand_num = math.random(1, 12)

    if rand_num == 1 then -- 1-6: basic rooms
      str_temp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"
    elseif rand_num == 2 then
      str_temp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"
    elseif rand_num == 3 then
      str_temp = "60000600000000000000000000000000050000000000000000000000000011111111111111111111"
    elseif rand_num == 4 then
      str_temp = "60000600000000000000000600000000000000000000000000000222220000111111001111111111"
    elseif rand_num == 5 then 
      str_temp = "11111111112222222222000000000000000000000050000000000000000000000000001111111111"
    elseif rand_num == 6 then
      str_temp = "11111111112111111112022222222000000000000050000000000000000000000000001111111111"
    elseif rand_num == 7 then -- low ceiling 
      str_temp = "11111111112111111112211111111221111111120111111110022222222000000000001111111111"
    elseif rand_num == 8 then -- 8-9: ladders
      if math.random(1, 2) == 1 then
        str_temp = "1111111111000000000L111111111P000000000L5000050000000000000000000000001111111111"
      else
        str_temp = "1111111111L000000000P111111111L0000000005000050000000000000000000000001111111111"
      end
    elseif rand_num == 9 then
      str_temp = "000000000000L0000L0000P1111P0000L0000L0000P1111P0000L1111L0000L1111L001111111111"
    elseif rand_num == 10 then -- 10-11: upper plats
      str_temp = "00000000000111111110001111110000000000005000050000000000000000000000001111111111"
    elseif rand_num == 11 then
      str_temp = "00000000000000000000000000000000000000000021111200021111112021111111121111111111"
    elseif rand_num == 12 then -- treasure below
      if math.rand(1, 2) == 1 then
        str_temp = "2222222222000000000000000000L001111111P001050000L011000000L010000000L01111111111"
      else
        str_temp = "222222222200000000000L000000000P111111100L500000100L000000110L000000011111111111"
      end
    end
  elseif room_path == 3 then -- main room
    local rand_num = math.random(1, 8)
    
    if rand_num == 1 then -- 1-4: basic rooms
      str_temp = "00000000000000000000000000000000000000000050000000000000000000000000001111111111"
    elseif rand_num == 2 then
      str_temp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"
    elseif rand_num == 3 then
      str_temp = "00000000000000000000000000000050000500000000000000000000000011111111111111111111"
    elseif rand_num == 4 then
      str_temp = "00000000000000000000000600000000000000000000000000000111110000111111001111111111"
    elseif rand_num == 5 then -- 5-7: upper plats
      str_temp = "00000000000111111110001111110000000000005000050000000000000000000000001111111111"
    elseif rand_num == 6 then
      str_temp = "00000000000000000000000000000000000000000021111200021111112021111111121111111111"
    elseif rand_num == 7 then
      str_temp = "10000000011112002111111200211100000000000022222000111111111111111111111111111111"
    elseif rand_num == 8 then
      if math.random(1, 2) == 1 then
        str_temp = "0000000000000000000000000000L001111111P001050000L011000000L010000000L01111111111";
      else
        str_temp = "000000000000000000000L000000000P111111100L500000100L000000110L000000011111111111"
      end
    end
  elseif room_path == 4 then -- shop
    str_temp = "111111111111111111111111221111111l000211...000W010...00000k0..Kiiii000bbbbbbbbbb"
    local rand_num = math.random(1,7)
    
    if rand_num == 1 then
      shop_type = "General"
    elseif rand_num == 2 then
      shop_type= "Bomb"
    elseif rand_num == 3 then
      shop_type = "Weapon"
    elseif rand_num == 4 then
      shop_type = "Rare"
    elseif rand_num == 5 then
      shop_type = "Clothing"
    elseif rand_num == 6 then
      shop_type = "Craps"
      str_temp = "11111111111111111111111122111111Kl000211..bQ00W010.0+00000k0.q+dd00000bbbbbbbbbb"
    elseif rand_num == 7 then
      shop_type = "Kissing"
      str_temp = "111111111111111111111111221111111l000211...000W010...00000k0..K00D0000bbbbbbbbbb"
      -- TO_IMPLEMENT: oGame.damsel = true
    end
  elseif room_path == 5 then -- shop
    str_temp = "111111111111111111111111221111112000l11101W0000...0k00000...000iiiiK..bbbbbbbbbb"
    local rand_num = math.random(1,7)
    
    if rand_num == 1 then
      shop_type = "General"
    elseif rand_num == 2 then
      shop_type= "Bomb"
    elseif rand_num == 3 then
      shop_type = "Weapon"
    elseif rand_num == 4 then
      shop_type = "Rare"
    elseif rand_num == 5 then
      shop_type = "Clothing"
    elseif rand_num == 6 then
      shop_type = "Craps"
      str_temp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000dd+q.bbbbbbbbbb"
    elseif rand_num == 7 then
      shop_type = "Kissing"
      str_temp = "111111111111111111111111221111112000l11101W0000...0k00000...0000D00K..bbbbbbbbbb"
      -- TO_IMPLEMENT: oGame.damsel = true
    end    
  elseif room_path == 8 then -- snake pit
    str_temp = "111000011111s0000s11111200211111s0000s11111200211111s0000s11111200211111s0000s11"
  elseif room_path == 9 then -- snake pit bottom
    str_temp = "111000011111s0000s1111100001111100S0001111S0110S11111STTS1111111M111111111111111"
  else -- drop
    local rand_num = 0
    if room_path == 7 then 
      rand_num = math.random(4, 12)
    elseif room_path_above ~= 2 then
      rand_num = math.random(1, 12)
    else
      rand_num = math.random(1, 8)
    end
    
    if rand_num == 1 then
      str_temp = "00000000006000060000000000000000000000006000060000000000000000000000000000000000"
    elseif rand_num == 2 then
      str_temp = "00000000006000060000000000000000000000000000050000000000000000000000001202111111"
    elseif rand_num == 3 then
      str_temp = "00000000006000060000000000000000000000050000000000000000000000000000001111112021"
    elseif rand_num == 4 then
      str_temp = "00000000006000060000000000000000000000000000000000000000000002200002201112002111"
    elseif rand_num == 5 then
      str_temp = "00000000000000220000000000000000200002000112002110011100111012000000211111001111"
    elseif rand_num == 6 then
      str_temp = "00000000000060000000000000000000000000000000000000001112220002100000001110111111"
    elseif rand_num == 7 then
      str_temp = "00000000000060000000000000000000000000000000000000002221110000000001201111110111"
    elseif rand_num == 8 then
      str_temp = "00000000000060000000000000000000000000000000000000002022020000100001001111001111"
    elseif rand_num == 9 then
      str_temp = "11111111112222222222000000000000000000000000000000000000000000000000001120000211"
    elseif rand_num == 10 then
      str_temp = "11111111112222111111000002211100000002110000000000200000000000000000211120000211"
    elseif rand_num == 11 then
      str_temp = "11111111111111112222111220000011200000000000000000000000000012000000001120000211"
    elseif rand_num == 12 then
      str_temp = "11111111112111111112021111112000211112000002112000000022000002200002201111001111"
    end
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
