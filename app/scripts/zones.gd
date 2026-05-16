extends Control


signal move_1
signal move_2
signal move_3
signal move_4


@onready var zone_1: Button = $VBoxContainer/zone1
@onready var zone_2: Button = $VBoxContainer/zone2
@onready var zone_3: Button = $VBoxContainer/zone3
@onready var zone_4: Button = $VBoxContainer/zone4


func _ready() -> void:
	zone_1.modulate.a = 0
	zone_2.modulate.a = 0
	zone_3.modulate.a = 0
	zone_4.modulate.a = 0


func _on_zone_1_pressed() -> void:
	move_1.emit()


func _on_zone_2_pressed() -> void:
	move_2.emit()


func _on_zone_3_pressed() -> void:
	move_3.emit()


func _on_zone_4_pressed() -> void:
	move_4.emit()
