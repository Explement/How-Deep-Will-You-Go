extends Node

var cactus_scene = preload("res://scenes/sub scenes/static_body_2d.tscn")



func _on_quest_manager_cactus_intantiate():
	print("goog")
	var cactus_instant = cactus_scene.instantiate()
	add_child(cactus_instant)
	
	
