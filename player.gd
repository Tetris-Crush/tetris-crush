extends Node

var board = load("res://board.tscn").instance()
var boardScript = load("res://board.gd").new()
var blockScript = load("res://block.gd").new()

func _ready():
    var block = load("res://block.tscn").instance()  
    add_child(block)
    add_child(board)

func _process(delta):
    
    if Input.is_action_just_released("ui_up"):
        boardScript.add_boardState(blockScript.get_block_info())
        var block = load("res://block.tscn").instance()  
        add_child(block)

