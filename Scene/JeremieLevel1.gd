extends Node2D

var playerTarget
var playerTargetMood
var playerTargetIsDepressed
var targetHealMoodLimit

var hopeScene
var hopeNode
var despairScene
var despairNode

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	playerTarget = get_node("Jeremie")
	playerTargetMood = GlobalGameManager.jeremieMood
	playerTargetIsDepressed = GlobalGameManager.jeremieIsDespressed
	targetHealMoodLimit = 100
	
	hopeScene = preload("res://GameplayMechanics/Hope.tscn")
	despairScene = preload("res://GameplayMechanics/Despair.tscn")
	
	get_node("Player2D").SetCameraSpeakHeart()

func _process(delta):
	if playerTargetMood >= targetHealMoodLimit:
		GlobalGameManager.jeremieIsDespressed = false
		GlobalGameManager.jeremieMood = playerTargetMood
		print(playerTargetIsDepressed)
		GlobalGameManager.goto_scene("res://Scene/Schoolyard.tscn")
	
	if playerTargetMood <= 0:
		GlobalGameManager.jeremieIsDespressed = true
		GlobalGameManager.jeremieMood = playerTargetMood
		print(playerTargetIsDepressed)
		GlobalGameManager.goto_scene("res://Scene/Schoolyard.tscn")

func _physics_process(delta):
	SpeakTheWords()

#Signaux
func _on_WordRythm_timeout():
	print("Timeout")
	SpawnWords()

func _on_EndOfConscience_body_entered(body):
	if body.get_filename() == "res://GameplayMechanics/Hope.tscn":
		playerTargetMood -= 5
		print(playerTargetMood)
	body.queue_free()


func SpawnWords():
	var whatWord = randi() % 3 + 1
	
	hopeNode = hopeScene.instance()
	despairNode = despairScene.instance()
	if whatWord == 1:
		playerTarget.add_child(hopeNode,true)
	else:
		playerTarget.add_child(despairNode,true)

#Function player input !
func SpeakTheWords():
	var words
	var lastWord
	
	#This is hope check!
	if Input.is_action_just_pressed('ui_hope'):
		words = get_node("TimeToTalk").get_overlapping_bodies()
		if !words.empty():
			lastWord = words.front().get_name()
			print(words.front().get_name())
			if lastWord.begins_with("Hope"):
				playerTargetMood += 10
				print(playerTargetMood)
			else:
				playerTargetMood -= 15
				print(playerTargetMood)
			words.front().queue_free()