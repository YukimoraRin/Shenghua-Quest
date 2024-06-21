extends Node2D

@export var MOBS_count: int
@export var MOBS_type: String
@export var SPAWN_time: int
@export var dist: int

@onready var mob = load(MOBS_type)

var inProcess: bool = false

func _process(delta):
	if (self.get_child_count() < MOBS_count + 1 and inProcess == false):
		print(self.get_child_count(), " Start creating")
		create_new_mob()
		inProcess = true

func create_new_mob():
	print("func start - ", self.get_child_count())
	while (self.get_child_count() < MOBS_count + 1):
		await get_tree().create_timer(SPAWN_time).timeout
		var instance = mob.instantiate()
		self.add_child(instance)
		instance.global_position = Vector2(randi_range(self.global_position.x, self.global_position.x + dist), instance.global_position.y)
	inProcess = false
