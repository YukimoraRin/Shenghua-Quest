extends Resource

class_name InventoryItem

@export var name: String
@export var texture: Texture2D
@export var stackable: bool = true

@export var Type: D.ItemType = D.ItemType.Item
@export var EquipSlot: D.EquipSlot = D.EquipSlot.Item
