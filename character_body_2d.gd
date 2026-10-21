extends CharacterBody2D


var speed = 2000.0
var max_speed = 150.0
var jump_velocity = -300.0
var gravity = 980
var dash = 700
var dashed = false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	elif dashed:
		dashed = false
	
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = move_toward(velocity.x, max_speed * direction, speed * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed * delta)
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y = jump_velocity
		if Input.is_action_just_pressed("Dash") and is_on_floor() and dashed == false:
			velocity.x = dash * int(Input.get_axis("Move_Left", "Move_Right"))
			dashed = true
			await get_tree().create_timer(0.2).timeout
			max_speed = 50
			await get_tree().create_timer(0.35).timeout
			max_speed = 150
