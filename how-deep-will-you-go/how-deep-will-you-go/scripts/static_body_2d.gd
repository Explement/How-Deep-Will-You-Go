extends Area2D

var cactus_health = 10


func _on_character_body_2d_attack(attack_damage):
	cactus_health -= attack_damage
	
	print(cactus_health)
	
func _process(delta):
	%ProgressBar.value = cactus_health
	if cactus_health <= 0:
		cactus_health = 0
		die()
	
func die():
	queue_free()
	print("you killed the cactus!")
