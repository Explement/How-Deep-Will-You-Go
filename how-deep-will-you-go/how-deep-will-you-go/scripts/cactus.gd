extends Area2D
signal cactus_killed
var cactus_health = 10



func _on_character_body_2d_attack(attack_damage): 
	cactus_health -= attack_damage
	
func _process(delta):
	%cactus_health_bar.value = cactus_health
	if cactus_health <= 0:
		cactus_health = 0
		%StaticBody2D.queue_free()
		emit_signal("cactus_killed")
