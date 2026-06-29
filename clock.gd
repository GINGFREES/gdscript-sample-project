extends Node2D

enum StartTimeMode { SYSTEM_TIME, RANDOM_TIME, FIXED_TIME, OFFSET_TIME }
var totalSeconds:float
@export var start_time := StartTimeMode.SYSTEM_TIME
@export_group("Fixed or Offset Start Time")
@export_range(-11, 11) var start_hour := 0
@export var start_minute := 0
@export var start_second := 0
@export var time_scale := 1.0

@onready var second_arm := $SecondArm as Node2D
@onready var minute_arm := $MinuteArm as Node2D
@onready var hour_arm := $HourArm as Node2D

func update_time() -> void:
		
	second_arm.rotation = fmod(totalSeconds, 60.0) * TAU / 60.0
	minute_arm.rotation = fmod(totalSeconds / 60.0, 60.0 ) * TAU / 60.0
	hour_arm.rotation = fmod(totalSeconds / 3600.0, 12.0) * TAU / 12.0
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	if start_time == StartTimeMode.RANDOM_TIME:
		totalSeconds = randf_range(0.0, 43200.0)
	else:
		if start_time != StartTimeMode.FIXED_TIME:
			var current_time := Time.get_time_dict_from_system()
			totalSeconds = float( 
				current_time.hour * 3600 +
				current_time.minute * 60 +
				current_time.second 
			)
		if start_time != StartTimeMode.SYSTEM_TIME:
			totalSeconds = start_second + start_minute * 60 + start_hour * 3600
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	totalSeconds += delta * time_scale
	update_time()
	pass
