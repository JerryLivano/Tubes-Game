extends KinematicBody2D

export var speed = 80.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("kanan"):
		velocity.x += 1.0
	if Input.is_action_pressed("kiri"):
		velocity.x -= 1.0
	if Input.is_action_pressed("atas"):
		velocity.y -= 1.0
	if Input.is_action_pressed("bawah"):
		velocity.y += 1.0
	velocity = velocity.normalized()
	
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
		pass
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position",velocity)
		$AnimationTree.set("parameters/Walk/blend_position",velocity)
		move_and_slide(velocity*speed)
	
	
