extends Camera

const CAMERASENSITIVITY = 0.01

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		get_parent().rotate_y(event.relative.x * -CAMERASENSITIVITY)
		translation = Vector3(0,0,0)
		rotate_object_local(Vector3(1,0,0), event.relative.y * -CAMERASENSITIVITY)
		translate(Vector3(0,0,10))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
