extends VBoxContainer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var button: Button = $Button

var plant_state = "not grown"

func _on_button_pressed() -> void:
	#update speed scale
	animation_player.speed_scale = Global.plant_speed[int(get_parent().name)]
	
	#grow plant
	if plant_state == "not grown":
		animation_player.play("grow")
		button.text = "..."
		button.disabled = true
		plant_state = "grown"
	
	#harvest plant
	elif plant_state == "harvest":
		animation_player.play("RESET")
		plant_state = "not grown"
		button.text = "Plant"
		
		Global.money += 100
		Global.money_signal.emit()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "grow":
		button.disabled = false
		button.text = "Harvest"
		plant_state = "harvest"
