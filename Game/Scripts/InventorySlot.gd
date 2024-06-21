extends Node

@export var item: Resource

@onready var SlotIcon = $Slot
@onready var FullSlotIcon = $FullSlot
@onready var ItemIcon = $ItemRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if item != null:
		ItemIcon.texture = item.texture
		SlotIcon.visible = false
		FullSlotIcon.visible = true
	else:
		ItemIcon.texture = null
		SlotIcon.visible = true
		FullSlotIcon.visible = false
	pass
