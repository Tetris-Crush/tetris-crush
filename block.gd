extends KinematicBody2D

var multiplier = 1
var cor = randi()%5+1 #associar um número a cada cor
var blockInfo

func _ready():
    #generate_block()
    set_physics_process(true)

func _physics_process(delta):
    var posY = position.y
    move_and_collide(Vector2(0, 2*multiplier))
    if Input.is_action_just_released("ui_left"):
        position.x -= 67
    if Input.is_action_just_released("ui_right"):
        position.x += 67
    if Input.is_action_just_released("ui_down"):
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
    cor = randi()%5+1
    if cor == 1:
        $Sprite.texture = load("res://Textures/ImagemPorAdicionar1.png")
    if cor == 2:
        $Sprite.texture = load("res://Textures/ImagemPorAdicionar2.png")
    if cor == 3:
        $Sprite.texture = load("res://Textures/ImagemPorAdicionar3.png")
    if cor == 4:
        $Sprite.texture = load("res://Textures/ImagemPorAdicionar4.png")
    if cor == 5:
        $Sprite.texture = load("res://Textures/ImagemPorAdicionar5.png")