extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		
		
	# Get the input direction and handle the movement/deceleration.s
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
#*******************************************************************************************
# Ten blok odpowiada za obrócenie horyzontalne obrazka kiedy input movement ze zmiennej direction
#  jest -1 lub inny niz -1 
	if direction == -1:
			get_node("AnimatedSprite2D").flip_h=true
	elif direction==1: 
		get_node("AnimatedSprite2D").flip_h=false
#********************************************************************************************
	if direction:
		#print(direction) #debug message 
		
		
		velocity.x = direction * SPEED
		if velocity.y==0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y==0:		
			anim.play("idle")
		if velocity.y>0:
			anim.play("fall")
			
	move_and_slide()