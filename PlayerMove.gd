extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const acc = 400
const maxSpeed = 200
const frict = 400

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
# Called when the node enters the scene tree for the first time.
# Replace with function body.

func _physics_process(delta):
	var input_vect = Vector2.ZERO
	input_vect.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vect.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vect = input_vect.normalized()
	
		
	if(input_vect != Vector2.ZERO):
		if (input_vect.x < 0):
			$IdleSprite.flip_h = false
		elif (input_vect.x > 0):
			$IdleSprite.flip_h = true
		animationTree.set("parameters/Idle/blend_position", input_vect)
		animationTree.set("parameters/Run/blend_position", input_vect)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vect * maxSpeed, acc * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, frict * delta)

	move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
