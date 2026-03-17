extends PanelContainer

@export var window : Window

const save_location = "user://SaveFile.json"

func _on_reset_save_pressed() -> void:
	window.show()

func _on_button_pressed() -> void:
	DirAccess.remove_absolute(save_location)
	Global.reset_to_default()
	window.hide()
	get_tree().reload_current_scene()

func _on_window_close_requested() -> void:
	window.hide()
