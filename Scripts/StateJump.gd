extends State
class_name StateJump
const name: String = "Jump"

var max_speed: float = 200
var speed: float = 2000
var jump: float = -300

func enter():
	character.velocity.y = jump

func exit():
	pass

func process(delta: float):
	if character.is_on_floor() and character.velocity.y > jump:
		switch(StateIdle.name)
		return
	character.velocity.y += gravity * delta
	var direction: int = int(Input.get_axis("Move_Left","Move_Right"))
	if direction:
		character.velocity.x = move_toward(
			character.velocity.x, max_speed * direction, speed * delta)
	else:
		character.velocity.x = move_toward(
			character.velocity.x, 0.0, speed * delta)

func input(_event: InputEvent):
	pass
