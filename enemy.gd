extends KinematicBody2D

var speed = 100
var motion = Vector2.ZERO
var player = null

func _physics_process(delta):
	motion = Vector2.ZERO
	if player :
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion)

func _on_Area2D_body_entered(body):
	player = body
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	player = null
	pass # Replace with function body.
