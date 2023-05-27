extends CharacterBody2D

@export var gravity = 3000


func _physics_process(delta):
    # Add gravity
    if not is_on_floor():
        velocity.y += gravity * delta
    velocity.y = clamp(velocity.y, -1000, 1000)
