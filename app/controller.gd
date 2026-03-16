extends CharacterBody3D


func move_x(x) -> void:
	if Globals.view_is_active:
		position += -transform.basis.z * x


func _input(event: InputEvent) -> void:
	if Globals.view_is_active:
		if Input.is_action_pressed("RMB"):
			if event is InputEventMouseMotion:
				rotate_y(event.relative.x * Prototype.mouse_sense * 0.01)
				$Camera3D.rotate_x(deg_to_rad(event.relative.y) * Prototype.mouse_sense * 0.01)
				$Camera3D.rotation.x = clamp(rotation.x, deg_to_rad(-89), deg_to_rad(89))


func _on_zones_move_1() -> void:
	move_x(1)


func _on_zones_move_2() -> void:
	move_x(2)


func _on_zones_move_3() -> void:
	move_x(3)


func _on_zones_move_4() -> void:
	move_x(4)
