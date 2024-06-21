extends Control

var holdingItem: InventoryItem = null

@onready var holdingItemIcon = $CenterContainer/Panel/HoldingItemIcon
@onready var holdingItemContainer = $CenterContainer

func _process(delta):
	if holdingItem != null:
		holdingItemIcon.texture = holdingItem.texture
		holdingItemContainer.global_position = get_viewport().get_mouse_position()
	else:
		holdingItemIcon.texture = null
