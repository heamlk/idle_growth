extends MarginContainer

@onready var room_1_button: Button = %Room1Button
@onready var room_2_button: Button = %Room2Button
@onready var room_3_button: Button = %Room3Button
@onready var room_4_button: Button = %Room4Button
@onready var game: Button = %Game
@onready var options: Button = %Options
@onready var upgrades: Button = %Upgrades


var panels : Array[PanelContainer] = []
var rooms : Array[PanelContainer] = []

func _ready() -> void:
	panels = [
		$VBoxContainer/Game, $VBoxContainer/Settings, $VBoxContainer/Upgrades
	]
	rooms = [
		%Room1Panel, %Room2Panel, %Room3Panel, %Room4Panel
	]
	game.pressed.connect(show_panel.bind(panels[0]))
	options.pressed.connect(show_panel.bind(panels[1]))
	upgrades.pressed.connect(show_panel.bind(panels[2]))
	room_1_button.pressed.connect(show_room.bind(rooms[0]))
	room_2_button.pressed.connect(show_room.bind(rooms[1]))
	room_3_button.pressed.connect(show_room.bind(rooms[2]))
	room_4_button.pressed.connect(show_room.bind(rooms[3]))
	
	show_panel(rooms[0])
	room_1_button.grab_focus()
	show_panel(panels[0])
	game.grab_focus()

func show_panel (panel_to_show: PanelContainer) -> void :
	for panel in panels:
		panel.hide()
	
	panel_to_show.show()

func show_room (room_to_show: PanelContainer) -> void :
	for room in rooms:
		room.hide()
	
	room_to_show.show()
