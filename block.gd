extends KinematicBody2D

var multiplier = 1
var cor #associar um número a cada cor e fazer uma cena para cada bloco

func _ready():
    generate_block()
    set_physics_process(true)

func _physics_process(delta):
    var checker = position.y
    position.y = clamp(position.y, 0, 567)
    move_and_collide(Vector2(0, 1.5*multiplier))
    if Input.is_action_just_released("ui_left"):
        position.x -= 67
    if Input.is_action_just_released("ui_right"):
        position.x += 67
    position.x = clamp(position.x, 33, 368)
    if Input.is_action_just_pressed("ui_down"):
        multiplier = 3
    position.y = clamp(position.y, 0, 567)
    if position.y == checker:
        set_physics_process(false)
        multiplier = 1

func get_block_info():
    var blockInfo = [get_global_position().x, int(get_global_position().y), cor]
    return blockInfo

func generate_block():
    cor = randi()%6+1
    if cor == 1:
        $Sprite.texture = load("res://Textures/ImagemAadicionar1png")
    if cor == 2:
        $Sprite.texture = load("res://Textures/ImagemAadicionar2.png")
    if cor == 3:
        $Sprite.texture = load("res://Textures/ImagemAadicionar3.png")
    if cor == 4:
        $Sprite.texture = load("res://Textures/ImagemAadicionar4.png")
    if cor == 5:
        $Sprite.texture = load("res://Textures/ImagemAadicionar5.png")