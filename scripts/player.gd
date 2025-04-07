extends CharacterBody2D
class_name Player

const SPEED = 130.0
var can_move: bool = true
@export_range(0, 1) var deceleration = 0.2
@export var jump_force = -300
@export_range(0, 1) var decelerate_on_jump_release = 0.5

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready():
	GameManager.player = self


func disable_controls():
	can_move = false
	velocity = Vector2.ZERO 
	animated_sprite.play("dying")


func enable_controls():
	can_move = true
	velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:
	if not can_move:
		velocity.x = 0
		velocity.y += get_gravity().y * delta
		move_and_slide()
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the sprite.
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations.
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * deceleration)

	move_and_slide()
