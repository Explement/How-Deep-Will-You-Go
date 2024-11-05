extends CharacterBody2D
# signals
signal attack(attack_damage)
@onready var test_sword: Area2D = %test_sword

# varaibles
var speed = 250 
var health = 10
var attack_damage = 5
var enemy_in_range = false

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

# combat
func _input(event):
	if event.is_action_pressed("strike"):
		strike()
	
func strike():
	if enemy_in_range == true:
		emit_signal("attack", attack_damage)
		%AnimationPlayer.play("attack")
	else:
		%AnimationPlayer.play("attack")
		print("miss")
	


func _on_static_body_2d_body_entered(body):
	if (body.name == "CharacterBody2D"):
		print("its good")
		enemy_in_range = true
		
	
		


func _on_static_body_2d_body_exited(body):
	enemy_in_range = false
