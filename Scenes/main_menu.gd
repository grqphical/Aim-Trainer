extends Control

var high_score: int = 0

@onready var high_score_label: Label = $"High Score"

func _ready() -> void:
    load_high_score()

func load_high_score():
    if not FileAccess.file_exists("user://highscore.save"):
        return

    var high_score_file = FileAccess.open("user://highscore.save", FileAccess.READ)
    var score_txt = high_score_file.get_line()
    high_score = int(score_txt)
    high_score_label.text = "High Score: " + str(high_score)

func view_source_code():
    OS.shell_open("https://github.com/grqphical")

func reset_high_score():
    var high_score_file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
    high_score_file.store_line("0")
    high_score_label.text = "High Score: 0"

func change_scene():
    get_tree().change_scene_to_file("res://scenes/main.tscn")
