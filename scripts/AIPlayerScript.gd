extends CharacterBody2D

#Integer
@export var offsetTillFlip = 20  # How much overlap until the AI will flip
@export var AIMovementSpeed = 300  # How fast can the AI move
const JUMP_VELOCITY = -600.0
var moveDir # Current move direction of the AI
var maxDistance = 600 # When is the AI to far away from the target

#Float
var maxMoveTime = 3 # Max allowed move time 
var time = maxMoveTime # Current time until the AI stops moving
var maxTimeTillChoice = 1.2 # Max waiting time until the next choice is made
var countDown = maxTimeTillChoice # Current time until the next choice is made

#Boolean
var startMoving = false # Check if the AI is allowed to move 
var is_jumping = false
var backwardWalk = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#Object
@onready var animTree = $AnimatedSprite2D # Get the AI animationtree
@onready var player = get_parent().get_node(str(PlayerData.player1))  # Target to focus the player1

#References
var generalMoves = ["Walk","Jump","L.Punch"] # Possible general moves of the AI
var attackStartIndex = 2


func _ready():
	move_and_slide()
	countDown = maxTimeTillChoice

func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_floor():
		is_jumping = false
	
	countDown -= delta
	if(countDown < 0):
		_choose_action()
	_face_player()  # Make sure the AI always faces the player

	# Start moving
	var generator = RandomNumberGenerator.new()
	generator.randomize()
	var value = generator.randi_range(0, 100)
	
	if(startMoving && time > 0):
		# if value inferior to 90 then he walk forward
		if (value < 95):
			# if he isn't walkiing backward then he wove forward
			if (!backwardWalk):
				_move_AI(delta)
				# if not we generate random value to 
			else:
				var quitBackwardPourcent = 90
				var backwardPourcent = generator.randi_range(0,100)
				if (backwardPourcent >= quitBackwardPourcent):
					backwardWalk = false
				else:
					_move_AI_reverse(delta)
		else:
			backwardWalk = true
			_move_AI_reverse(delta)
		time -= delta
	else:
		startMoving = false
		time = maxMoveTime

func _choose_action():
	var percentagePerStep = float(100) / float(maxDistance) # Get the percentage increase with each step
	
	var chance = percentagePerStep * (abs(player.position.x - position.x)) # Calculate the actual chance that the AI has of its current distance from the player 
	chance = 100-clamp(chance, 10, 90) # Invert the scale so that, the closer the AI gets to the player the higher the outcome 
	
	var randomValue = _return_value()
	#attack
	if(randomValue <= chance): # Check if the return value between 0 to 100 is good enough for an attack  
		var randomAttack = RandomNumberGenerator.new()
		randomAttack.randomize()
		var attackValue = randomAttack.randi_range(attackStartIndex, generalMoves.size() - 1)  # Pick from all possible moves what kind of attack is needed
		animTree.play(generalMoves[attackValue])
		
	else:
		#move & jump
		randomValue = _return_value()
		if (randomValue < 70 and is_on_floor()):
			velocity.y = JUMP_VELOCITY
			is_jumping = true
			animTree.play(generalMoves[1])
		else:
			animTree.play(generalMoves[0])
		
		startMoving = true
		time = maxMoveTime
	countDown = maxTimeTillChoice

# Generate a random value between 0 to 100 and return it
func _return_value():
	var generator = RandomNumberGenerator.new()
	generator.randomize()
	var value = generator.randi_range(0, 100)
	
	return value

func _face_player():
	var distanceToPlayer =  player.position.x - position.x # The place AI needs to go to - the place where it is = distance between the spots
	
	if(distanceToPlayer > offsetTillFlip):    # AI comes from the left
		moveDir = 1
		scale.x = scale.y * moveDir
	elif(distanceToPlayer < -offsetTillFlip):  # AI comes from the right
		moveDir = -1
		scale.x = scale.y * moveDir
	else:
		moveDir = 0

# A simple function that allows movement
func _move_AI(delta):
	velocity.x = moveDir * AIMovementSpeed
	
	move_and_slide()

func _move_AI_reverse(delta):
	velocity.x = -1 * moveDir * AIMovementSpeed
	
	move_and_slide()
