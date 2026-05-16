extends Label


func _ready() -> void:
	visible = false


func _on_button_pressed() -> void:
	if visible:
		visible = false
	else:
		visible = true
