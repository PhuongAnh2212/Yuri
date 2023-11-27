extends CharacterBody2D

@onready var animations = $AnimatedSprite2D

func updateAnimation():
	animations.play("Idle")

func _physics_process(delta):
	updateAnimation()
