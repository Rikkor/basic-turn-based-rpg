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
	PlayerAnimation()

# Handles moving the player
func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.normalized() * speed
	
	move_and_slide()

func PlayerAnimation():
	if (velocity.x > 0):
		direction = "right"
	elif (velocity.x < 0):
		direction = "left"
	elif (velocity.y > 0):
		direction = "down"
	elif (velocity.y < 0):
		direction = "up"
	
	if (velocity == Vector2.ZERO):
		PlayerAnimator.play("idle_" + direction)
	else:
		PlayerAnimator.play("walk_" + direction)
