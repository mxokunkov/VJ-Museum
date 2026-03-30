extends MeshInstance3D

#Объект должен возвращаться в первоначальное состояние!!!

var active = false

var inspect_mode := false
var rotating := false
var sensitivity := 0.01

var zoom_speed := 0.1
var min_scale := 0.3
var max_scale := 3.0

#Сохраняем исходные значения
var initial_transform: Transform3D
var initial_scale: Vector3

func _ready():
	#Сохраняем начальное положение и масштаб
	initial_transform = transform
	initial_scale = scale

func start_inspect():
	Globals.view_is_active = false
	inspect_mode = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func stop_inspect():
	#Возвращаем объект в исходное состояние
	transform = initial_transform
	scale = initial_scale
	
	Globals.view_is_active = true
	inspect_mode = false
	rotating = false  #Сбрасываем состояние вращения

func _input(event):
	if not inspect_mode:
		return

	#зажали правую кнопку мыши
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			rotating = event.pressed

		#зум колесом
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			var new_scale = scale + Vector3.ONE * zoom_speed
			new_scale.x = clamp(new_scale.x, min_scale, max_scale)
			new_scale.y = clamp(new_scale.y, min_scale, max_scale)
			new_scale.z = clamp(new_scale.z, min_scale, max_scale)
			scale = new_scale

		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			var new_scale = scale - Vector3.ONE * zoom_speed
			new_scale.x = clamp(new_scale.x, min_scale, max_scale)
			new_scale.y = clamp(new_scale.y, min_scale, max_scale)
			new_scale.z = clamp(new_scale.z, min_scale, max_scale)
			scale = new_scale

	#движение мыши
	if event is InputEventMouseMotion and rotating:
		rotate_y(-event.relative.x * sensitivity)
		rotate_x(-event.relative.y * sensitivity)

func _on_button_2_pressed() -> void:
	if not active:
		active = true
		start_inspect()
	else:
		active = false
		stop_inspect()