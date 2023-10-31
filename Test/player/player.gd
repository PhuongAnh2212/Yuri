extends CharacterBody2D

@export var speed: int = 600
@onready var animations = $AnimationPlayer
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed
	
func updateAnimation():
	var direction = "Front"
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Back"
	
	animations.play("walk" + direction)
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
