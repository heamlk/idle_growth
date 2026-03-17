extends Control

@export var grid_container: Array[GridContainer]
@export var upgrade_buttons: Array[Button]
@export var room_buttons : Array[Button]


const PLANT = preload("uid://no2qd4m2mssy")

func _ready() -> void:
	Global.money = SaveLoad.contents_to_save.money
	Global.plants = SaveLoad.contents_to_save.plants
	Global.plant_speed = SaveLoad.contents_to_save.plant_speed
	
	for i in 4:
		Global.plant_price_setter(i, SaveLoad.contents_to_save.plant_price[i])
		Global.speed_price_setter(i, SaveLoad.contents_to_save.speed_price[i])
	Global.all_plant_harvest_bool = SaveLoad.contents_to_save.all_plant_harvest_bool
	initialize_plants()
	initialize_upgrades()
	print("init")

func initialize_plants():
	var index = 0
	for plant in Global.plants:
		for i in plant:
			var new_plant := PLANT.instantiate()
			grid_container[index].add_child(new_plant)
		index+=1

func initialize_upgrades():
	for index in upgrade_buttons.size():
		upgrade_buttons[index].disabled = Global.all_plant_harvest_bool[index]
		room_buttons[index].visible = Global.all_plant_harvest_bool[index]
