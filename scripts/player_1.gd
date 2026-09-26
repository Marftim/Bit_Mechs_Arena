extends CharacterBody2D

const SPEED = 400.0  # Скорость перемещения в пикселях в секунду
const JUMP_VELOCITY = -625 # Прыжок

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Грава

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#if is_multiplayer_authority():
	if not is_on_floor(): # активируем гравы
		velocity.y += gravity * delta
	
	if anim.animation == "default":
		anim.play("idle")
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): # Прыгаем
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_down"):
		anim.play("melle")
		
	


	move_and_slide()
