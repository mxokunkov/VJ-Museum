extends Button


func _process(_delta):
	var pos3d = $"..".global_transform.origin
	var pos2d = $"../../../cam/controller/Camera3D".unproject_position(pos3d)
	position = pos2d
