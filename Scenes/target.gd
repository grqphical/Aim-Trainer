extends Node2D

signal change_score(amount: int)

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $Sprite2D

var timer_length: float = 1
var rng = RandomNumberGenerator.new()
var special_target_colour: Color = Color.YELLOW
var score_value: int = 1

func despawn_target():
    queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var x = rng.randi_range(0, 50)
    if x == 44:
        timer_length *= 0.5
        sprite.modulate = special_target_colour
        score_value = 5
    timer.wait_time = timer_length
    timer.timeout.connect(despawn_target)

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
        if sprite.get_rect().has_point(sprite.to_local(get_global_mouse_position())):
            change_score.emit(score_value)
            queue_free()