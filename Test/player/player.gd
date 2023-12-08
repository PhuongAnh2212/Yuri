extends CharacterBody2D

@export var speed: int = 300
@onready var animations = $AnimationPlayer

var thanhmai_in_range = false
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed
	
func updateAnimation():
	if velocity.length() == 0:
		animations.play("Idle")
	else:
		var direction = "Front"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Back"
	
		animations.play("walk" + direction)
func _physics_process(delta):
	
	if thanhmai_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_dialogue_balloon(load("res://dialogue/main.dialogue"), "main")
			return
	
	handleInput()
	move_and_slide()
	updateAnimation()


func _on_detection_area_body_entered(body):
	if body.has_method("thanhmai"):
		thanhmai_in_range = true
		


func _on_detection_area_body_exited(body):
	if body.has_method("thanhmai"):
		thanhmai_in_range = false
