extends Sprite

const MY_DEGREE = PI /180
const CENTER = Vector2(512,300)
const NEAR_MAX_SPEED = 3.5
const SPEED_DROP_OFF = 0.1

var my_frame =0
var count = 0

var to_move  = Vector2(0,-0.25)
var movement = Vector2(0,0)
var suck = Vector2(0.01,0) # Amount of Gravitational Pull


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = 512
	self.position.y = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_UP):
		movement += to_move/10
	
	if Input.is_key_pressed(KEY_LEFT):
		self.rotation_degrees -=  3
		to_move = to_move.rotated(-(MY_DEGREE*3))
	
	if Input.is_key_pressed(KEY_RIGHT):
		self.rotation_degrees +=  3
		to_move = to_move.rotated(MY_DEGREE*3)
	
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit
	
	# Wrap Sprite Arround View Port
	if self.position.x < -40 :
		self.position.x += 1108
	if self.position.x > 1064:
		self.position.x -= 1108
	
	if self.position.y < -40 :
		self.position.y += 680	
	if self.position.y > 640:
		self.position.y -= 680
	
	# Implement a Max Speed.
	if movement.x >= NEAR_MAX_SPEED:
		movement.x -= SPEED_DROP_OFF
	if movement.x <= -NEAR_MAX_SPEED:
		movement.x += SPEED_DROP_OFF
		
	if movement.y >= NEAR_MAX_SPEED:
		movement.y -= SPEED_DROP_OFF
	if movement.y <= -NEAR_MAX_SPEED:
		movement.y += SPEED_DROP_OFF
	
	# Add gravity to movement
	movement += suck.rotated(CENTER.angle_to_point(self.position)) 
	
	#Add movement to body
	self.position += movement 
	
	
	# Bad way to Animate a frame, just did it to avoid timer usage.
	count += 1
	if count == 10:
		count = 0	
		my_frame += 1
		if my_frame == 4:
			my_frame = 0
		self.frame = my_frame
	

