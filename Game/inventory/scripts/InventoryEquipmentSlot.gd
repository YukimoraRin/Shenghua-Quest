extends Panel

@export var item: InventoryItem = null
@export var platzHalter: Texture2D = null

@export var slotType: D.EquipSlot = D.EquipSlot.Item

@export var parentInventory: Control

@onready var lookSlotIcon = $lookSlot
@onready var leerSlotIcon = $leerSlot
@onready var fullSlotIcon = $fullSlot
@onready var itemSlotIcon = $fullSlot/CenterContainer/Panel/item
@onready var platzhalterSlotIcon = $leerSlot/CenterContainer/Panel/platzhalter

func _ready():
	platzhalterSlotIcon.texture = platzHalter

func _process(delta):
	if item == null:
		fullSlotIcon.visible = false
		leerSlotIcon.visible = true
	else:
		fullSlotIcon.visible = true
		leerSlotIcon.visible = false
		itemSlotIcon.texture = item.texture

var stop: bool = false
func _input(event):
	if stop == false:
		if event is InputEventMouseButton:
			if Rect2(self.global_position, Vector2(64, 64)).has_point(event.global_position):
				if parentInventory.holdingItem == null:
					if item == null:
						pass
					else:
						parentInventory.holdingItem = item
						item = null
				else:
					if parentInventory.holdingItem.EquipSlot == slotType:
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
