extends Node

const save_location = "user://SaveFile.json"

var contents_to_save: Dictionary = {
	"money" : 0.0,
	"all_plant_harvest_bool" : [false,false,false,false],
	"plant_price" : [1, 20, 50, 100],
	"speed_price" : [1, 10, 100, 200],
	"plants" : [1,0,0,0],
	"plant_speed" : [.25,.25,.25,.25],
	
}

func _ready() -> void:
	_load()

func _save():
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(contents_to_save.duplicate())
	file.close()

func _load():
	if FileAccess.file_exists(save_location):
		var file := FileAccess.open(save_location, FileAccess.READ) 
		var data : Dictionary = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		contents_to_save.money = save_data.money
		contents_to_save.all_plant_harvest_bool = save_data.all_plant_harvest_bool
		contents_to_save.plant_price = save_data.plant_price
		contents_to_save.speed_price = save_data.speed_price
		contents_to_save.plants = save_data.plants
		contents_to_save.plant_speed = save_data.plant_speed
