extends KinematicBody2D

var multiplier = 1
var cor
var blockInfo

func _ready():
    randomize()
    generate_block()
    set_physics_process(true)

func _physics_process(delta):
    var posY = position.y
    move_and_collide(Vector2(0, 2*multiplier))
    if Input.is_action_just_pressed("ui_left"):
        position.x -= 67
    if Input.is_action_just_pressed("ui_right"):
        position.x += 67
    if Input.is_action_just_pressed("ui_down"):
        multiplier = 3
    check_walls()
    check_landing(posY)

func check_landing(auxPosY):
    if position.y == auxPosY:
        generate_block_info()
        set_physics_process(false)

func check_walls():
    position.x = clamp(position.x, 33, 368)
    position.y = clamp(position.y, 0, 567)

func generate_block_info():
    if get_global_position().y == 567:
        blockInfo = [get_global_position().x, 566, cor]
    else:
        blockInfo = [get_global_position().x, int(get_global_position().y), cor]

func generate_block():
    cor = randi()%7+1
    if cor == 1:
        $Sprite.texture = load("res://blue block.jpg")
    if cor == 2:
        $Sprite.texture = load("res://green block.jpg")
    if cor == 3:
        $Sprite.texture = load("res://orange block.jpg")
    if cor == 4:
        $Sprite.texture = load("res://purple block.jpg")
    if cor == 5:
        $Sprite.texture = load("res://red block.jpg")
    if cor == 6:
        $Sprite.texture = load("res://yellow block.jpg")
    if cor == 7:
        $Sprite.texture = load("res://gay block.jpg")