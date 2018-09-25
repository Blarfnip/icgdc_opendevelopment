extends KinematicBody2D


# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 160 # Pixels/second
var fireCooldown = 0
var aim = Vector2()

func _physics_process(delta):
	var motion = Vector2()
		
		
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("move_bottom"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		motion += Vector2(1, 0)

	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)
	
	aim = Vector2()
	var isAiming = false
	
	if Input.is_action_pressed("aim_up"):
		aim += Vector2(0, -1)
		isAiming = true
	if Input.is_action_pressed("aim_bottom"):
		aim += Vector2(0, 1)
		isAiming = true
	if Input.is_action_pressed("aim_left"):
		aim += Vector2(-1, 0)
		isAiming = true
	if Input.is_action_pressed("aim_right"):
		aim += Vector2(1, 0)
		isAiming = true

	rotation = aim.angle()
	if !isAiming:
		rotation = motion.angle()
	
	if Input.is_action_pressed("fire") and fireCooldown < (OS.get_ticks_msec()):
		var scene = load("res://Bullet.tscn")
		var scene_instance = scene.instance()
		scene_instance.set_name("bullet")
		scene_instance.transform = transform
		scene_instance.rotation = rotation 
		get_parent().add_child(scene_instance)
		fireCooldown = OS.get_ticks_msec() + 100


