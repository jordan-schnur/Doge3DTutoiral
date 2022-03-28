extends KinematicBody


# m/s
export var min_speed = 10

# m/2
export var max_speed = 18

var velocity = Vector3.ZERO

func _physics_process(delta):
	move_and_slide(velocity)
	
# Set mob to start position and add or subject a random angle from the player angle
func initialize(start_positon, player_position):
	translation = start_positon
	look_at(player_position, Vector3.UP)
	rotate_y(rand_range(-PI / 4, PI / 4))
	
	# Choose a random speed and set mob velocity
	var random_speed = rand_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_VisibilityNotifier_screen_exited():
	queue_free()
	
func squash():
	emit_signal("squashed")
	queue_free()
