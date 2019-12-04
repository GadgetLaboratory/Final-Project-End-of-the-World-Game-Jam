extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("good"):
			body.queue_free()
			queue_free()
		if body.is_in_group("earth"):
			get_parent().health -= 1
			queue_free()
		if body.is_in_group("station"):
			get_parent().get_node("Station").health -= 25
			queue_free()