extends CharacterBody2D

const SPEED = 300.0


const JUMP_VELOCITY = -600.0


var is_crouching: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack_cooldown_timer = 0.0
var attack_cooldown_duration = 3 # Cooldown duration for the attack animation in seconds
var can_attack = true # Variable to check if the player can attack
var is_attacking = false
var is_jumping = false
var is_walking = false
@onready  var _animation_player = $AnimatedSprite2D
func _ready():
	_animation_player.play("Idle")
	$Area2D/Punch.disabled = true
	
func _physics_process(delta):
	# Add the gravity.

	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_floor():
		is_jumping = false

		
	# Handle Jump.
	if Input.is_action_just_pressed("UP_2") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("LEFT_2", "RIGHT_2")
	if direction:
		velocity.x = direction * SPEED
		is_walking = true
		print("Bouge")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		is_walking = false
	move_and_slide()

func _process(delta):
	
		
	
	if can_attack  and Input.is_action_just_pressed("L.Punch_2") and attack_cooldown_timer <= 0.0:
		$Area2D/Punch.disabled = false
		_animation_player.play("L.Punch")
		is_attacking = true
		can_attack = false
	if Input.is_action_just_released("L.Punch_2"):
		$Area2D/Punch.disabled = true
	if Input.is_action_pressed("UP_2"):
		if _animation_player.is_playing() and is_jumping:
			_animation_player.play("Jump")
			
	elif Input.is_action_pressed("LEFT_2") or Input.is_action_pressed("RIGHT_2"):
		_animation_player.play("Walk")
		
	
	if !can_attack and attack_cooldown_timer <= 0.0:
		print("can attack !")
		can_attack = true
	if !_animation_player.is_playing():
		_animation_player.play("Idle")

func _on_area_2d_body_entered(body):
	PLayer.J1_TakeDmg()
