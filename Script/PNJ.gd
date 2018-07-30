extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _process(delta):
	if GlobalGameManager.jeremieIsDespressed:
		get_node("BrokenSprite").set_visible(true)
		get_node("HealedSprite").set_visible(false)
	else:
		get_node("BrokenSprite").set_visible(false)
		get_node("HealedSprite").set_visible(true)
	print(GlobalGameManager.jeremieIsDespressed)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Area2D_body_entered(body):
	get_node("TalkIcon").set_visible(true)


func _on_Area2D_body_exited(body):
	get_node("TalkIcon").set_visible(false)
