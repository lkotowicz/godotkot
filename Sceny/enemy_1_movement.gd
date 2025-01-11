extends  CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase
func _physics_process(delta: float) -> void:
	velocity.y +=delta*gravity
	player= get_node("../../player/Player")
	var direction = (player.position - self.position).normalized()
	#if direction.x > 0 :
		#print("right")
	#elif direction.x < 0:
		#print("left")
	
	
	move_and_slide()
	
	#do zdebugowaania 1:00:47 co mam zle 
	
func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true
		print(chase)
	
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
		print(chase)
 		#print(player.global_position)
