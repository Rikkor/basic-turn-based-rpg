extends Node

@export var enemy : Resource = null

var currentEnemyHealth = 0
var currentPlayerHealth = 0

func _ready():
	setHealth(enemy.health, enemy.health, $VBoxContainer/HealthBar)
	setHealth(PlayerState.health, PlayerState.maxHealth, $PlayerArea/HBoxContainer/HealthBar)

# Controls the health bar of each entity in the battle scene
func setHealth(health, maxHealth, healthBar):
	healthBar.value = health
	healthBar.max_value = maxHealth
	healthBar.get_node("Label").text = "HP: " + str(health) + " / " + str(maxHealth)
	
