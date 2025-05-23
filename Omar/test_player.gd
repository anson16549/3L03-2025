extends CharacterBody3D


const SPEED = 40.0
const JUMP_VELOCITY = 10

var last_direction = Vector3.FORWARD
@export var rotation_speed = 6
@onready var camera := $SpringArmPivot/Camera3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := Vector3(input_dir.x, 0, input_dir.y).normalized()
	
	direction = direction.rotated(Vector3.UP, camera.global_rotation.y)
	if direction:
		last_direction = direction
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	$".".rotation.y = lerp_angle($".".rotation.y, atan2(-last_direction.x, -last_direction.z), delta * rotation_speed)

	move_and_slide()


func _on_kill_zone_area_entered(area: Area3D) -> void:
	pass # Replace with function body.
