extends Control

func view_source_code():
    OS.shell_open("https://github.com/grqphical/Aim-Trainer")

func reset_high_score():
    var high_score_file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
    high_score_file.store_line("0")

func change_scene():
    get_tree().change_scene_to_file("res://scenes/main.tscn")


func view_manual() -> void:
   get_tree().change_scene_to_file("res://scenes/how_to.tscn")

