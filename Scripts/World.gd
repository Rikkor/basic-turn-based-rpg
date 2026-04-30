extends Node2D

# Signal for health bar on UI
@export var healthBar : ProgressBar


func _ready():

	setUpUI()

func _process(delta):
	pass

# Helps set up the UI in the world scene
func setUpUI():
	# Ties health bar to UI element in world scene
	healthBar.max_value = PlayerState.maxHealth
	healthBar.value = PlayerState.health
