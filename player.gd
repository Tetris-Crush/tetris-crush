extends Node

var board = load("res://board.tscn").instance()

func _ready():
    set_process(true)
    add_child(board)
    add_block()

func _process(delta):
    if game_running():
        board.add_board_state(block_info())
        if (block_info()[2]!=8):
            if (board.destroyer(block_info())):
                bye_blocks(board.releaseBlocks)
                go_down(board.fall_down())
        end_game(block_info()[1])
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

func block_info():
    return active_block().blockInfo

func bye_blocks(arr):
    for i in range(arr.size()):
        get_child(arr[i]).queue_free()

func go_down(arr):
    for i in range(arr.size()):
        get_child(arr[i]).position.y+=66
