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

@onready var _animation_player = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_animation_player.play("Hidle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
