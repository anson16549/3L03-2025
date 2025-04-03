extends Control  # or whatever your root is

@onready var popup_scene = preload("res://Anson/popup.tscn")

func _ready():
	var popup = popup_scene.instantiate()
	add_child(popup)
