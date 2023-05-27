extends "res://src/Actors/Actor.gd"


const SPEED = 350.0
const JUMP_VELOCITY = -3000.0


func get_input():
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = velocity.y * 0.5

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


func _on_enemy_detector_area_entered(_area:Area2D):
	# bounce when enemy is hit
	velocity.y = JUMP_VELOCITY


func _on_enemy_detector_body_entered(_body:Node2D):
	queue_free()

func _physics_process(delta):
	# Call parent's _physics_process.
	super._physics_process(delta)
	# Handle input and movement.
	get_input()
	move_and_slide()
