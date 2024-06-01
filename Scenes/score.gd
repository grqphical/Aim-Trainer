extends Control

class_name Score

@onready var label: Label = $Label
@onready var high_score_label: Label = $HighScoreLabel
var score: int = 0
var high_score: int = 0

func _ready() -> void:
    load_high_score()

func load_high_score():
    if not FileAccess.file_exists("user://highscore.save"):
        return

    var high_score_file = FileAccess.open("user://highscore.save", FileAccess.READ)
    var score_txt = high_score_file.get_line()
    high_score = int(score_txt)
    high_score_label.text = "High Score: " + str(high_score)

func save_high_score():
    var high_score_file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
    high_score_file.store_line(str(high_score))

func change_score(score_value: int):
    score += score_value
    label.text = str(score)

    if score > high_score:
        high_score += score_value
        high_score_label.text = "High Score: " + str(high_score)
        save_high_score()
