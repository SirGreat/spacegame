extends KinematicBody2D


var gravity_node
var vel = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_node = get_tree().get_nodes_in_group("gravityHandler")[0]

func _move():
	#----Gravity Handling Code----
	if gravity_node:
		vel += gravity_node.get_gravity_field(position)
	
	#----Collision Handling Code----
	var collision = move_and_collide(vel)
	if collision:
		vel = Vector2.ZERO

func _physics_process(delta):
	_move()
	
