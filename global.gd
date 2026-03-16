extends Node

signal money_signal
signal plant_price_signal
signal speed_price_signal
signal all_plant_harvest_signal(_index)

var money : float: #saved
	set(value):
		money = snapped(value, 0.01)
		money_signal.emit()
		goal()

var plant_speed := [.25, .25, .25, .25] #saved
var speed_price := [1, 10, 100, 200] #saved

var plants := [1, 0, 0, 0] #saved
var plant_price := [1, 20, 50, 100] #saved
var plant_limit := [2, 9, 50, 100] 

var plant_revenue := [1, 3, 9, 100]

var all_plant_harvest_bool : Array = [0, 0, 0, 0] #saved
var all_plant_harvest_price : Array[int] = [100, 500, 1000, 10000]

var win := false


func goal ():
	if money >= 1000000:
		get_tree().change_scene_to_file("res://win.tscn")


func plant_price_setter(p_index: int, p_value) -> void:
	plant_price[p_index] = p_value
	plant_price_signal.emit()

func speed_price_setter(p_index: int, p_value) -> void:
	speed_price[p_index] = p_value
	speed_price_signal.emit()
