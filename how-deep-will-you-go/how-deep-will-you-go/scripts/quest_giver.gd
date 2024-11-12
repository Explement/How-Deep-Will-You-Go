extends Area2D
var quest_tracker = false
signal received_quest
var interactable = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and interactable == true and quest_tracker == false:
		emit_signal("received_quest")
		quest_tracker = true
func _on_body_entered(body: CharacterBody2D):
	interactable = true
	

func _on_body_exited(body: CharacterBody2D):
	interactable = false


func _on_quest_manager_quest_completed():
	quest_tracker = false
