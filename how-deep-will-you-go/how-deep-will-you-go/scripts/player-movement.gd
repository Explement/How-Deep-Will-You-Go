extends CharacterBody2D
# signals
signal attack(attack_damage)
@onready var test_sword: Area2D = %test_sword

# varaibles
var speed = 250 
var health = 10
var attack_damage = 5
var enemy_in_range = false
var cooldown = false
var is_attacking = false

func _process(delta):
	if Input.is_action_just_pressed("strike"):
		strike()
	if velocity.x < 0 and is_attacking == false:
		%animations.play("sword_left")
	elif velocity.x >= 0 and is_attacking == false:
		%animations.play("sword_right")
	
		
		
func _physics_process(delta):
	var current_velocity_x = velocity.x
	var last_velocity_x = current_velocity_x
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	
	if velocity.x < 0:
		%player_sprite.flip_h = true
		%sword_sprite.flip_h = true
		%sword_collision_front.disabled = true
		%sword_collision_back.disabled = false
	elif velocity.x > 0:
		%player_sprite.flip_h = false
		%sword_sprite.flip_h = false
		%sword_collision_back.disabled = true
		%sword_collision_front.disabled = false
	elif velocity.x == 0:
		%player_sprite.flip_h = false
		%sword_sprite.flip_h = false
		
# combat
func strike():
	is_attacking = true
	%attack_animation_overrule_timer.start()
	if velocity.x >= 0:
		%animations.play("attack_front")
	elif velocity.x < 0:
		%animations.play("attack_back")
	if enemy_in_range == true and cooldown == false:
		emit_signal("attack", attack_damage)
		cooldown = true
		%sword_cooldown.start()
		
		
	


func _on_static_body_2d_body_entered(body: CharacterBody2D):
		enemy_in_range = true
func _on_static_body_2d_body_exited(body: CharacterBody2D):
		enemy_in_range = false

func _on_sword_cooldown_timeout():
	cooldown = false
	%sword_cooldown.stop()


func _on_attack_animation_overrule_timer_timeout():
	is_attacking = false
	%attack_animation_overrule_timer.stop()
