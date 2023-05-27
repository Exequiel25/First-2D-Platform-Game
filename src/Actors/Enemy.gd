extends "res://src/Actors/Actor.gd"


const SPEED = 400.0
var direction = Vector2.LEFT

func _ready():
	velocity.x = SPEED * direction.x


func _on_stomp_detector_body_entered(body:Node2D):
	# if it's hit from avobe
	if body.position.y < position.y:
		$CollisionShape2D.disabled = true
		queue_free()

func _physics_process(delta):
	# Call parent's _physics_process.
	super._physics_process(delta)
	
	move_and_slide()
	if is_on_wall():
		direction = -direction
		velocity.x = SPEED * direction.x


