extends CharacterBody2D


const SPEED = 300.0


# Jump


const JUMP_VELOCITY = -350.0


var is_crouching: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack_cooldown_timer = 0.0
var attack_cooldown_duration = 3 # Cooldown duration for the attack animation in seconds
var can_attack = true # Variable to check if the player can attack
var is_attacking = false
@onready  var _animation_player = $AnimatedSprite2D
func _ready():
	_animation_player.play("Hidle")
	
	
func _physics_process(delta):
	# Add the gravity.


	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("ui_down") :
		velocity.x = 0
	elif Input.is_action_pressed("L.Punch") and Input.is_action_pressed("ui_right"):
		velocity.x = 0
	move_and_slide()

func _process(delta):
	
	if can_attack and Input.is_action_pressed("L.Punch") and Input.is_action_pressed("ui_right") and attack_cooldown_timer <= 0.0:
		_animation_player.play("L.Punch.Forward")
		is_attacking = true
		can_attack = false
	
	if can_attack and Input.is_action_just_pressed("L.Punch") and attack_cooldown_timer <= 0.0:
		_animation_player.play("L.punch")
		is_attacking = true
		can_attack = false
	
	elif Input.is_action_pressed("ui_up"):
		if _animation_player.is_playing():
			_animation_player.play("Jump")
	elif Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		_animation_player.play("Walk")
		
	elif !can_attack and attack_cooldown_timer <= 0.0:
		print("can attack !")
		can_attack = true
	if !_animation_player.is_playing():
		_animation_player.play("Hidle")
		
	if Input.is_action_pressed("ui_down") :
		_animation_player.play("Crouch")


#Jump 

func get_input_velocity() -> float:
	var horizontal := 0.0
	
	if Input.is_action_pressed("left"):
		horizontal -= 1.0
	if Input.is_action_pressed("right"):
		horizontal += 1.0
	
	return horizontal
