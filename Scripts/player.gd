extends CharacterBody2D


var speed = 250


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
