extends CharacterBody2D

# Handles which direction the player moves/walks
@onready var PlayerAnimator = get_node("AnimatedSprite2D")

var speed = 250
var direction = "right"

func _ready():
	pass

 # Called every framesds
func _process(_delta):
	PlayerMovement()
	PlayerAnimation()
	
	if (Input.is_action_just_pressed("ui_left")):
		PlayerState.health -= 5
		get_parent().setUpUI()
		
	if (Input.is_action_just_pressed("ui_right")):
		PlayerState.health += 5
		get_parent().setUpUI()

# Handles moving the player
func PlayerMovement():
	velocity = Input.get_vector("left", "right", "up", "down")
	
	velocity = velocity.normalized() * speed
	
	move_and_slide()

# Handles the direction the player is facing/moving
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
