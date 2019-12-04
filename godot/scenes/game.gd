extends Node2D

# Declare member variables here. Examples:
var new_bomber = preload("res://scenes/DiveBomber.tscn")
var bomber_frequency = 200
var ticks_since_bomber = 0

var new_blaster = preload("res://scenes/Blaster.tscn")
var blaster_frequency = 200
var ticks_since_blaster = 50

var health = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ticks_since_bomber += 1
	ticks_since_blaster += 1
	
	if ticks_since_bomber > bomber_frequency:
		var bomber = new_bomber.instance()
		bomber.position = Vector2(rand_range(100,700), -30)
		add_child(bomber)
		ticks_since_bomber = 0
	
	if ticks_since_blaster > blaster_frequency:
		var blaster = new_blaster.instance()
		blaster.position = Vector2(rand_range(100,700), -30)
		add_child(blaster)
		ticks_since_blaster = 0
	
	
	if health == 3:
		get_node("Heart").visible = false
	if health == 2:
		get_node("Heart2").visible = false
	if health == 1:
		get_node("LastHeart").visible = false
	if health == 0:
		get_tree().quit()
	
