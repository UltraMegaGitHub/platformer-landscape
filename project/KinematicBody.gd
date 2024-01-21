extends KinematicBody

const MOVEMENTSPEED = 15
const JUMPHEIGHT = 10

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var gravityCompound = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _physics_process(delta):
	var playerVelocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") 
	if not is_on_floor():
		gravityCompound+=gravity*delta
	else:
		gravityCompound=0
	if Input.get_action_strength("ui_select") > 0 and is_on_floor():
		gravityCompound = -JUMPHEIGHT
	var direction = transform.basis * Vector3(playerVelocity.x,0,playerVelocity.y).normalized() * MOVEMENTSPEED + Vector3(0,-gravityCompound,0)
	move_and_slide(direction, Vector3(0,1,0))

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
