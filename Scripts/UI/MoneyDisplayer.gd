## Displays a team's money.
class_name MoneyDisplayer extends PanelContainer

## The [Label] that simply houses the text displaying the word for money.
@export var _money_label: Label
@export var _amount_label: Label

@export var _displays_money_label: bool

func _ready() -> void:
	if _displays_money_label == true:
		_money_label.show()
	else:
		_money_label.hide()
	
func update_displayed_amount(money_to_show: int) -> void:
	_amount_label.set_text(str(money_to_show))
