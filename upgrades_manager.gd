extends PanelContainer

@onready var room_1_button: Button = %Room1ButtonUpgrade
@onready var room_2_button: Button = %Room2ButtonUpgrade
@onready var room_3_button: Button = %Room3ButtonUpgrade
@onready var room_4_button: Button = %Room4ButtonUpgrade


var panels : Array[PanelContainer] = []

func _ready() -> void:
	panels = [
		$HBoxContainer/RoomPanelUpgrade1, $HBoxContainer/RoomPanelUpgrade2, $HBoxContainer/RoomPanelUpgrade3, $HBoxContainer/RoomPanelUpgrade4
	]
	
	room_1_button.pressed.connect(show_panel.bind(panels[0]))
	room_2_button.pressed.connect(show_panel.bind(panels[1]))
	room_3_button.pressed.connect(show_panel.bind(panels[2]))
	room_4_button.pressed.connect(show_panel.bind(panels[3]))
	
	show_panel(panels[0])
	room_1_button.grab_focus()

func show_panel (panel_to_show: PanelContainer) -> void :
	for panel in panels:
		panel.hide()
	
	panel_to_show.show()
