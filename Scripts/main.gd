extends Node2D

@export var target: PackedScene
@onready var timer: Timer = $Timer
@onready var score: Score = $Score

var rng = RandomNumberGenerator.new()
var spawn_delay: float = 1
var target_time: float = 1

func spawn_target():
    var screen_size = get_viewport().get_visible_rect().size

    var x_pos = rng.randi_range(-screen_size.x / 2 + 10, screen_size.x / 2 - 10)
    var y_pos = rng.randi_range(-screen_size.y / 2 + 100, screen_size.y / 2 - 10)

    var instance = target.instantiate()
    add_child(instance)
    instance.timer_length = target_time
    instance.global_position = Vector2(x_pos, y_pos)
    instance.connect("change_score", score.change_score)
    instance.connect("change_score", update_times)


func _ready() -> void:
    timer.timeout.connect(spawn_target)

func update_times(_score_value: int) -> void:
    if score.score % 10 == 0 && score.score != 0:
        spawn_delay *= 0.8
        target_time *= 0.9
        timer.wait_time = spawn_delay