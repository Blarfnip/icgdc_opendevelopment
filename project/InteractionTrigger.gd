extends Area2D

var isEntered = false;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("body_entered", self, "body_entered")
	connect("body_exited", self, "body_exited")
	pass

func _process(delta):
	if Input.is_action_just_released("interact") and isEntered:
		print("INTERACTED")
	pass

func body_entered(body):
	isEntered = true;
	
func body_exited(body):
	isEntered = false;