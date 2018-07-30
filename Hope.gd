extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var movement
var limit

func _ready():
	movement = Vector2(0,-20)

func _physics_process(delta):
	move_and_slide(movement)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
