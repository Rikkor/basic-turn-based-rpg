extends CharacterBody2D

# Handles which direction the player moves/walks
@onready var PlayerAnimator = get_node("AnimatedSprite2D")

var speed = 250
var direction = "face-right"

func _ready():
	pass

 # Called every frame
func _process(delta):
	PlayerMovement()

# Handles moving the player
func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.normalized() * speed
	
	move_and_slide()

func PlayerAnimation():
	if (velocity.x > 0):
		direction = "face-right"
	elif (velocity.x < 0):
		direction = "face-left"
	elif (velocity.y > 0):
		direction = "face-down"
	elif (velocity.y < 0):
		direction = "face-up"
	
	if (velocity == Vector2.ZERO):
		pass
