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
    steps_string = ''.join(str(x) for x in direction_set[1:len(direction_set)])
    steps = int(steps_string)
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

def test_input_instructions():
  assert distance_from_center("L2, L5, L5, R5, L2, L4, R1, R1, L4, R2, R1, L1, L4, R1, L4, L4, R5, R3, R1, L1, R1, L5, L1, R5, L4, R2, L5, L3, L3, R3, L3, R4, R4, L2, L5, R1, R2, L2, L1, R3, R4, L193, R3, L5, R45, L1, R4, R79, L5, L5, R5, R1, L4, R3, R3, L4, R185, L5, L3, L1, R5, L2, R1, R3, R2, L3, L4, L2, R2, L3, L2, L2, L3, L5, R3, R4, L5, R1, R2, L2, R4, R3, L4, L3, L1, R3, R2, R1, R1, L3, R4, L5, R2, R1, R3, L3, L2, L2, R2, R1, R2, R3, L3, L3, R4, L4, R4, R4, R4, L3, L1, L2, R5, R2, R2, R2, L4, L3, L4, R4, L5, L4, R2, L4, L4, R4, R1, R5, L2, L4, L5, L3, L2, L4, L4, R3, L3, L4, R1, L2, R3, L2, R1, R2, R5, L4, L2, L1, L3, R2, R3, L2, L1, L5, L2, L1, R4") == 181
