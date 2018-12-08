extends Node

var board = load("res://board.tscn").instance()

func _ready():  
    add_child(board)
    add_block()

func _process(delta):
    if game_running():
        board.add_board_state(active_block().blockInfo)
        board.same_color_pieces(active_block().blockInfo)
        end_game(active_block().blockInfo[1])
        add_block()
    if Input.is_action_just_pressed("ui_cancel"):
        exit_game()

func add_block():
    var block = load("res://block.tscn").instance()
    add_child(block)

func game_running():
    return !(active_block().is_physics_processing())

func end_game(posY):
    if posY == 104:
        exit_game()

func active_block():
    return get_child(get_child_count()-1)

func exit_game():
    get_tree().quit()

