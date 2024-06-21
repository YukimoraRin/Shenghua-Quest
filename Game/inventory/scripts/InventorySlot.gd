extends Panel

@export var item: InventoryItem = null
@export var isLook: bool = false

@export var parentInventory: Control

@onready var lookSlotIcon = $lookSlot
@onready var leerSlotIcon = $leerSlot
@onready var fullSlotIcon = $fullSlot
@onready var itemSlotIcon = $fullSlot/CenterContainer/Panel/item

var isMouseOver = false

func _process(delta):
	if isLook == true:
		lookSlotIcon.visible = true
		leerSlotIcon.visible = false
		fullSlotIcon.visible = false
	else:
		lookSlotIcon.visible = false
		if item == null:
			fullSlotIcon.visible = false
			leerSlotIcon.visible = true
		else:
			fullSlotIcon.visible = true
			leerSlotIcon.visible = false			
			itemSlotIcon.texture = item.texture

var stop: bool = false
func _input(event):
	if stop == false and isLook == false:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if Rect2(self.global_position, Vector2(64, 64)).has_point(event.global_position):
				if parentInventory.holdingItem == null:
					if item == null:
						pass
					else:
						parentInventory.holdingItem = item
						item = null
				else:
					if item == null:
						item = parentInventory.holdingItem
						parentInventory.holdingItem = null
					else:
						var temp = parentInventory.holdingItem
						parentInventory.holdingItem = item
						item = temp
			stop = true
			await get_tree().create_timer(0.1).timeout
			stop = false

