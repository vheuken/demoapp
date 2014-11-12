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

dofile("get_rooms.lua")

function room_gen_1(x, y, start_room_x, start_room_y, end_room_x, end_room_y)
  str_temp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000"

  -- TODO: room_path = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];
  room_path_above = -1
  shop_type = "General"

  if get_room_y(y) ~= 0 then
    -- TODO: room_path_above = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)]
  end

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
  elseif get_room_x(x) == end_room_x and get_room_y(y) == end_room_y then -- end room
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

  elseif room_path == 0 or room_path == 1 then -- main room

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
x = 0
y = 0
start_room_x = 0
start_room_y = 0
end_room_x = 3
end_room_y = 3

room = room_gen_1(x, y, start_room_x, start_room_y)

-- print room to console
for i=1, 8 do
  start_index = (i-1) * 10
  print(room:sub(start_index+1, start_index + 10))
end

-- END TESTING STUFF
