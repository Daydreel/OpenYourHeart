extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var talkTarget

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func _on_TalkZone_body_entered(body):
	if body.collision_layer == 4 && body.get_node("BrokenSprite").is_visible() == true:
		talkTarget = body

func _on_TalkZone_body_exited(body):
	talkTarget = null

func get_input():
	if GlobalGameManager.current_scene.get_filename() == "res://Scene/Schoolyard.tscn":
		SchoolyardState()
	else:
		SpeakWithTheHeartState()

func SchoolyardState():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

	if Input.is_action_pressed('ui_accept') && talkTarget != null:
		GlobalGameManager.goto_scene("res://Scene/"+talkTarget.get_name()+"Level1.tscn")
		
func SpeakWithTheHeartState():
	pass

func SetCameraSpeakHeart():
	var cameraZoom = Vector2(0.5,0.5)
	var cameraOffset = Vector2(300,0)
	var camera = get_node("Camera2D")
	
	camera.set_zoom(cameraZoom)
	camera.set_offset(cameraOffset)
	
func SetCameraSchoolyard():
	var cameraZoom = Vector2(1,1)
	var cameraOffset = Vector2(0,0)
	var camera = get_node("Camera2D")
	
	camera.set_zoom(cameraZoom)
	