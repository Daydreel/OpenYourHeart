extends Control


func _on_Start_pressed():
	GlobalGameManager.goto_scene("res://Scene/TheClassroom.tscn")


func _on_Quit_pressed():
	get_tree().quit() #default behavior
