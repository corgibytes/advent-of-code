def distance_from_center(directions):
  # Make R equal to a block
  # Based on Center Point
  # (0, 0)
  # (x, y)
  # Initial Direction "North"
  facing = "North"
  x = 0
  y = 0
  direction_array = directions.split(", ")
  print direction_array

  for direction_set in direction_array:
    turn = direction_set[0]
    steps = int(direction_set[1])
    # From Facing "North" - R == "East" L == "West"
    if facing == "North":
      if turn == "R":
        facing = "East"
        x = x + steps
      else:
        facing = "West"
        x = x - steps
  # From Facing "East" - R == "South" L == "North"
    elif facing == "East":
      if turn == "R":
        facing = "South"
        y = y - steps
      else:
        facing = "North"
        y = y + steps
  # From Facing "South" - R == "West" L == "East"
    elif facing == "South":
      if turn == "R":
        facing = "West"
        x = x - steps
      else:
        facing = "East"
        x = x + steps
  # From Facing "West" - R == "North" L == "South"
    elif facing == "West":
      if turn == "R":
        facing = "North"
        y = y + steps
      else: 
        facing = "South"
        y = y - steps

  # (3, 2)
  print "(" + str(x) + "," + str(y) + ")"
  return abs(x) + abs(y) # what value is this?

def test_instruction_one():
  assert distance_from_center("R2, L3") == 5

def test_instruction_two():
  assert distance_from_center("R2, R2, R2") == 2
  # "R2, L3"
  # (0, 0) 
  # (north/south, east/west)
  # (  +  /  -  ,  +  /  - )
  # (0, 2)
  # Followed L3
  # Facing "North"
  # (3, 2)
