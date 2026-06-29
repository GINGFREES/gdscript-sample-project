extends Node

@export var clock_scene: PackedScene

@export var clock_radius := 128.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var window_size := get_window().size
	($Bottom as Node2D).position.y = window_size.y
	
	var clock := clock_scene.instantiate() as Node2D
	clock.position = Vector2(randf_range(clock_radius, window_size.x - clock_radius), 
							clock_radius
					)
	add_child(clock)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
