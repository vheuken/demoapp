-- get_room_y(y)
--
-- Returns the vertical room number of a room given the y-coord

function get_room_y(y)
  if y < (128+16) then return 0
  elseif y >= (128+16) and y < (256+16) then return 1
  elseif y >= (256+16) and y < (384+16) then return 2
  elseif y >- (384+16) and y < (512+16) then return 3
  elseif y > (512+16) then return 4
  end

  return -1
end

-- get_room_x(x)
--
-- Returns the horizontal room number of a room given the x-coord

function get_room_x(x)
  if x < (160+16) then return 0
  elseif x >= (160+16) and x < (320+16) then return 1
  elseif x >= (320+16) and x < (480+16) then return 2
  elseif x >= (480+16) then return 3
  end

  return -1
end
