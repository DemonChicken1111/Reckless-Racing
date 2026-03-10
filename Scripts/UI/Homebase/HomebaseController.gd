## The middleman for managing the different menus in the homebase.
class_name HomebaseController extends Node

@export_category("Buttons")
@export var _manage_team_button: Button
@export var _season_management_button: Button
@export var _end_week_button: Button

@export_category("Menus")
@export var _team_management_menu: CanvasLayer
@export var _season_management_menu: CanvasLayer

@export_category("Extras")
@export var _player_money_displayer: MoneyDisplayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_manage_team_button.pressed.connect(_on_manage_team_button_pressed )
	_season_management_button.pressed.connect( _on_season_management_button_pressed )
	_end_week_button.pressed.connect( _on_end_week_button_pressed )
	
	# Update the money
	_player_money_displayer.update_displayed_amount(PlayerController.team.money)
	PlayerController.team.money_changed.connect(_on_money_changed)

## Perform the end of week cleanup.
func _on_end_week_button_pressed() -> void:
	PlayerController.current_week += 1
	_season_management_button.disabled = true
	_manage_team_button.disabled = true
	_end_week_button.disabled = true
	
	# TODO: Handle this better.
	if PlayerController.current_week % 4 == 0:
		SceneManager.change_scene("res://Scenes/Race.tscn")
	else:
		SceneManager.reload_scene()

func _on_manage_team_button_pressed() -> void:
	_team_management_menu.show()
	_season_management_menu.hide()

func _on_season_management_button_pressed() -> void:
	_season_management_menu.show()
	_team_management_menu.hide()

## Used to automatically display .
func _on_money_changed(new_amount: int) -> void:
	_player_money_displayer.update_displayed_amount(new_amount)
