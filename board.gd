extends Node

var boardState = []

func _ready():
    pass

func add_board_state(arr):
    boardState.append(arr)
    print(boardState)

func same_color_pieces(): #argumento é a cor do bloco que quero procurar
    var sameColorPieces = []
    for i in range ( boardState.size() ):
        if boardState[i][2] == argumento:
            sameColorPieces.append(boardState[i])
    return sameColorPieces
    
func block_destroyer():
    var boardStateAux = same_color_pieces()
    pass