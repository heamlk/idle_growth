extends PanelContainer

@export var money_label: Label 
@export var speed_button: Button
@export var speed_label: Label 
@export var grid_container: GridContainer
@export var plant_button: Button 
@export var plant_label: Label 
@export var index : int

@export var all_plant_harvest_button : Button

@onready var progress_bar: ProgressBar = $"../../../../ProgressBar"

const PLANT = preload("uid://no2qd4m2mssy")


func _ready() -> void:
	speed_button.pressed.connect(_on_speed_button_pressed)
	plant_button.pressed.connect(_on_plant_button_pressed)
	all_plant_harvest_button.pressed.connect(_on_all_plant_harvest)
	Global.money_signal.connect(display_money)
	Global.speed_price_signal.connect(display_speed_price)
	Global.plant_price_signal.connect(display_plant_price)
	
	Global.all_plant_harvest_signal.connect(all_plant_harvest_display)
	plant_button.tooltip_text = "Price : " + str(Global.plant_price[index])
	speed_button.tooltip_text = "Price : " + str(Global.speed_price[index])

func display_money():
	var money := Global.money
	money_label.text = "Money : " + str(money) + " $"
	progress_bar.value = money
	#SaveLoad.contents_to_save.money = money
	#SaveLoad._save()

func display_speed_price():
	speed_button.tooltip_text = "Price : " + str(Global.speed_price[index])
	speed_label.text = "Speed : " + str(Global.plant_speed[index]) + "x"
	if Global.plant_speed[index] >= 2:
		speed_button.disabled = true

func display_plant_price():
	plant_button.tooltip_text = "Price : " + str(Global.plant_price[index])
	plant_label.text = "Plants : " + str(Global.plants[index]) + "x"
	if Global.plants[index] == Global.plant_limit[index]:
		plant_button.disabled = true

func _on_speed_button_pressed() -> void:
	if Global.money >= Global.speed_price[index] and Global.plants[index] >= 1:
		Global.plant_speed[index] += 0.1
		
		Global.money-=Global.speed_price[index]
		
		#SaveLoad.contents_to_save.plant_speed = Global.plant_speed
		
		Global.speed_price_setter(index, snapped(Global.speed_price[index] + Global.speed_price[index] * 0.1, 0.01))
		#SaveLoad.contents_to_save.speed_price = Global.speed_price
		#SaveLoad._save()
		speed_button.tooltip_text = "Price : " + str(Global.speed_price[index])

func _on_plant_button_pressed() -> void:
	if Global.money >= Global.plant_price[index] and Global.plants[index] < Global.plant_limit[index]:
		var new_plant := PLANT.instantiate()
		grid_container.add_child(new_plant)
		
		Global.money -= Global.plant_price[index]
		Global.plants[index] += 1
		#SaveLoad.contents_to_save.plants = Global.plants
		
		Global.plant_price_setter(index, snapped(Global.plant_price[index] + Global.plant_price[index] * 0.1, 0.01))
		#SaveLoad.contents_to_save.plant_price = Global.plant_price
		#SaveLoad._save()

func _on_all_plant_harvest() -> void :
	for child in grid_container.get_children():
		child._on_button_pressed()

func all_plant_harvest_display(_index):
	if _index == index :
		all_plant_harvest_button.visible = true
