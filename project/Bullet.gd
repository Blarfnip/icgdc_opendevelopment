extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("body_entered", self, "body_entered")
	
	var speed = Vector2(300, 0)
	linear_velocity = speed.rotated(rotation)
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
	
func body_entered(body): 
	print("ENTERED")
	queue_free()
	pass
	

