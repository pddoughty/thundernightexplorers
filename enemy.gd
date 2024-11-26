extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if get_node("/root/level1/poop") != null:
		var direction : int = sign(position.x - get_node("/root/level1/poop").position.x)#Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent() is Player):
		queue_free()
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if(area.get_parent() is Player):
		area.get_parent().queue_free()
	pass # Replace with function body.
