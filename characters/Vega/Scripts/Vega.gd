extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_crouching: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _animation_player = $AnimatedSprite2D

func _ready():
	pass
	
	
func _physics_process(delta):
	# Add the gravity.

	# Handle Jump.
	#if Input.is_action_just_pressed("ui_up") :
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("ui_down") :
		velocity.x = 0
	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("ui_down") :
		if _animation_player.is_playing():
			_animation_player.play("Crouch")
	elif Input.is_action_pressed("ui_up"):
		if _animation_player.is_playing():
			_animation_player.play("Jump")
	elif Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		_animation_player.play("Walk")

	else:
		_animation_player.play("Hidle")
