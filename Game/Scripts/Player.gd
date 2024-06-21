extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Main Attributes
var health: int = 100
var mana: int = 50
var stamina: int = 75

# Maximum Values
var max_health: int = 100
var max_mana: int = 50
var max_stamina: int = 75

# Regeneration Rates
var health_regeneration: int = 5
var mana_regeneration: int = 3
var stamina_regeneration: int = 4

# Movement Attributes
var speed: int = 300
var jump_height: int = -400

# Defensive Attributes
var evasion: int = 10
var defense: int = 15

var direction: int = 0 # Right = 1, Left = -1

@onready var anim = $Node2D/AnimatedSprite2D
@onready var player = $Node2D
@onready var inventory = $UI/Inventory

var stop_idle_anim = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Inventory"):
		inventory.visible = not inventory.visible
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_just_pressed("ui_up"):
		anim.play("Idle_Top")
		stop_idle_anim = true
	if Input.is_action_just_pressed("ui_down"):
		anim.play("Idle_Bottom")
		stop_idle_anim = true
	
	direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * speed
		anim.play("Run")
		stop_idle_anim = false
		#if direction == 1:
			#player.flip_h = true
		#else:
			#player.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if not stop_idle_anim:
			anim.play("Idle")
	
	
	
	move_and_slide()
