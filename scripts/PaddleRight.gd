extends KinematicBody2D

var speed = 1500
var velocity = Vector2(0, 0)

func check_input():
	if Input.is_action_pressed("player_right_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("player_right_down"):
		velocity.y = speed
	else:
		velocity.y = 0

func _physics_process(delta):
	check_input()

	var collision = move_and_collide(velocity * delta)

	if collision && collision.normal.y != 0:
		velocity.y = 0
