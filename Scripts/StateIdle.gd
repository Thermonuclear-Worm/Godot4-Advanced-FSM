extends State
class_name StateIdle
const name: String = "Idle"

var max_speed:float = 150
var speed:float = 2000

func enter():
	pass

func exit():
	pass

func _process(delta : float):
	if not character.is_on_floor():
		character.velocity.y += gravity * delta
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		character.velocity.x = move_toward(character.velocity.x, max_speed * direction, speed * delta)
	else:
		character.velocity.x = move_toward(character.velocity.x, 0.0, speed * delta)

func input(event: InputEvent):
	if event is InputEventKey:
		if event.is_action("Jump"):
			switch(StateJump.name)
