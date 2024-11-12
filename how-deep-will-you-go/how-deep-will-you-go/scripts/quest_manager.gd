extends Node

enum quests {talktoshadow, killcactuses}
var current_quest = quests.killcactuses
var quest_label_tracker1 = false
var cactus_quest_tracker = 0
var  cactuses_insantiated = false
signal quest_completed
signal cactus_intantiate
func _process(delta: float) -> void:
	if quest_label_tracker1 == true:
		%quest_label.text = "[color=black][font_size=35]kill cactuses" +  str(cactus_quest_tracker) + "/3."
		if cactuses_insantiated  == false:
			emit_signal("cactus_intantiate")
	if cactus_quest_tracker == 3:
		complete_quest()
func _on_quest_giver_received_quest():
	give_quest()
		
func give_quest():
	if current_quest == quests.killcactuses:
		quest_label_tracker1 = true
		
func complete_quest():
	if current_quest == quests.killcactuses:
		emit_signal("quest_completed")
		
	
func _on_static_body_2d_cactus_killed():
	cactus_quest_tracker += 1

	
	
	
	
	
	
	
	
