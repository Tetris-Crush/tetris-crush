extends Node

var boardState = []

func _ready():
    pass

func add_board_state(arr):
    boardState.append(arr)

func destroyer(arr): #arr é a blockInfo [posição x, posição y, cor]
    var originalX = arr[0]
    var originalY = arr[1]
    var to_be_destroyed = [arr]
    
    while arr[0] < 368: #ir para a direita procurar peças iguais 
        var trigger1 = 0  #funciona como sinal para garantir que só destroi se forem seguidas
        arr[0]+=67
        if arr in boardState:
            to_be_destroyed.append(arr)
            trigger1 = 1
        if trigger1 == 0:
            break
    
    arr[0]=originalX
    
    while arr[0] > 33: #ir para a esquerda
        var trigger2 = 0
        arr[0]-=67
        if arr in boardState:
            to_be_destroyed.append(arr)
            trigger2 = 1
        if trigger2 == 0:
            break

    arr[0] = originalX

    while arr[1] < 566: #ir para baixo
        var trigger3 = 0
        arr[1]+=66
        if arr in boardState:
            to_be_destroyed.append(arr)
            trigger3 = 1
        if trigger3 == 0:
            break
    
    arr[1] = originalY
    return to_be_destroyed

func blocks_to_release(arr): #arr é a func destroyer(arr)
    var releaseBlocks = []
    for i in range(boardState.size()):
        for j in range(arr.size()):
            if arr[j]==boardState[i]:
                releaseBlocks.append[i]
    return releaseBlocks