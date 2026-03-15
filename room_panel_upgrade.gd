extends PanelContainer

@export var all_plant_harvest_button : Button
@export var index : int

func _ready() -> void:
	
	all_plant_harvest_button.pressed.connect(_on_all_plant_harvest_pressed)
	all_plant_harvest_button.tooltip_text = "Price : " + str(Global.all_plant_harvest_price[index])

func _on_all_plant_harvest_pressed() -> void :
	if Global.all_plant_harvest_price[index] <= Global.money:
		Global.money = Global.money - Global.all_plant_harvest_price[index] 
		Global.all_plant_harvest_bool[index] = true
		
		SaveLoad.contents_to_save.all_plant_harvest_button = Global.all_plant_harvest_bool
		SaveLoad._save()
		
		Global.all_plant_harvest_signal.emit(index)
		
		all_plant_harvest_button.disabled = true
		all_plant_harvest_button.tooltip_text = "Price : " + str(Global.all_plant_harvest_price[index])
