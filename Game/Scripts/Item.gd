extends Node

var texture: Image

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = Image.load_from_file("res://Resources/GUI/PlatzHalter.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
