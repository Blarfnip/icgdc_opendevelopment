extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vel = Vector2(0, 0)
var acc = Vector2(0, 0)

var target = Vector2(0, 0)
var player

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	player = get_node("../player")
	target = player.position
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	target = player.position
	#rotation = vel.angle()
	pass

func _physics_process(delta):
	acc = vel.normalized() - 0.3 * ((target - position).normalized())
	acc *= -0.1
	
	
	vel += acc
	vel = vel.normalized() * 1
	position += vel
	acc *= 0
	pass
	
	
	