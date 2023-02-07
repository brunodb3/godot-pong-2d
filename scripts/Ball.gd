extends KinematicBody2D

var speed = 500
var velocity = Vector2(0, 0)

func reset():
	velocity = Vector2(0,0)
	position.x = 1920/2
	position.y = 1080/2

func check_input():
	if Input.is_action_pressed("game_reset"):
		reset()

		var random_direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
		velocity = random_direction.normalized()

		velocity.x *= speed
		velocity.y *= speed

func _physics_process(delta):
	check_input()
	
	var collision = move_and_collide(velocity * delta)

	if collision:
		if collision.normal.y != 0:
			velocity.y *= -1
		if collision.normal.x != 0:
			velocity.x *= -1
