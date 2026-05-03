extends Node

signal textboxClosed

# Handles putting specific enemies into the battle scene.
@export var enemy : Resource = null

var currentEnemyHealth = 0
var currentPlayerHealth = 0

func _ready():
	setHealth(enemy.health, enemy.health, $VBoxContainer/HealthBar)
	setHealth(PlayerState.health, PlayerState.maxHealth, $PlayerArea/HBoxContainer/HealthBar)
	
	# Hide Textbox + Player actions as the fight starts
	$TextBox.hide()
	#$PlayerArea/HBoxContainer/PlayerActions.hide()
	
	displayText("A  wild  " + enemy.name + "  appears!")
	await self.textboxClosed

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and $TextBox.visible:
		$TextBox.hide()
		emit_signal("textboxClosed")

# Controls the health bar of each entity in the battle scene
func setHealth(health, maxHealth, healthBar):
	healthBar.value = health
	healthBar.max_value = maxHealth
	healthBar.get_node("Label").text = "HP: " + str(health) + " / " + str(maxHealth)
	
func displayText(text):
	$TextBox.show()
	$TextBox/Text.text = text
	
func _on_run_pressed() -> void:
	#$PlayerArea/HBoxContainer/PlayerActionsprint.hide()
	var chance = randi_range(0, 1)
	displayText("You escaped combat")
	await self.textboxClosed
	get_tree().change_scene_to_file("res://Scenes/World.tscn")
