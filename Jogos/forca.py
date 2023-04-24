import random

def mensagem_abertura():
    print("**************************")
    print("Bem vindo ao jogo da forca")
    print("**************************")

def escolhe_palavra_secreta():
    #### Definindo a palavra secreta randomica // defining the random secret word
    palavras = []
    arquivo = open("palavras.txt","r")
    for linha in arquivo:
        linha=linha.strip().lower()
        palavras.append(linha)
    palavra_secreta = palavras[random.randrange(0,len(palavras))]
    arquivo.close()
    return palavra_secreta

def imprime_letras_chutadas(acertadas,erradas):
    print("\nLetras adivinhadas")
    for letra in acertadas:
        print(letra, end="")
    print("")

    print("\nLetras erradas")
    for letra in erradas:
        print(letra, end=",")
    print("\n")

def imprime_mensagem_vencedor():
    print("Parabéns, você ganhou!")
    print("       ___________      ")
    print("      '._==_==_=_.'     ")
    print("      .-\\:      /-.    ")
    print("     | (|:.     |) |    ")
    print("      '-|:.     |-'     ")
    print("        \\::.    /      ")
    print("         '::. .'        ")
    print("           ) (          ")
    print("         _.' '._        ")
    print("        '-------'       ")

def imprime_mensagem_perdedor(palavra):
    print("Puxa, você foi enforcado!")
    print("A palavra era {}".format(palavra))
    print("    _______________         ")
    print("   /               \       ")
    print("  /                 \      ")
    print("//                   \/\  ")
    print("\|   XXXX     XXXX   | /   ")
    print(" |   XXXX     XXXX   |/     ")
    print(" |   XXX       XXX   |      ")
    print(" |                   |      ")
    print(" \__      XXX      __/     ")
    print("   |\     XXX     /|       ")
    print("   | |           | |        ")
    print("   | I I I I I I I |        ")
    print("   |  I I I I I I  |        ")
    print("   \_             _/       ")
    print("     \_         _/         ")
    print("       \_______/           ")

def checa_vitoria(acertos,palavra):
    completo = acertos == len(palavra)
    if completo:
        imprime_mensagem_vencedor()
    return completo

def checa_derrota(erradas,palavra):
    enforcado = len(erradas) == 7
    if (enforcado):  # checa se perdeu o jogo // checks if the game was lost
        imprime_mensagem_perdedor(palavra)
    return enforcado

def desenha_forca(erros):
    print("  _______     ")
    print(" |/      |    ")

    if(erros == 1):
        print(" |      (_)   ")
        print(" |            ")
        print(" |            ")
        print(" |            ")

    if(erros == 2):
        print(" |      (_)   ")
        print(" |      \     ")
        print(" |            ")
        print(" |            ")

    if(erros == 3):
        print(" |      (_)   ")
        print(" |      \|    ")
        print(" |            ")
        print(" |            ")

    if(erros == 4):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |            ")
        print(" |            ")

    if(erros == 5):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |            ")

    if(erros == 6):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      /     ")

    if (erros == 7):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      / \   ")

    print(" |            ")
    print("_|___         ")
    print()

def jogar():
    mensagem_abertura()
    palavra_secreta = escolhe_palavra_secreta()

    #alguns parametros para o jogo // some parameters for the game
    enforcado = False   #booleano para testar derrota // boolean to test lose
    completo = False    #booleano para testar vitória // boolean to test win
    letras_acertadas = ["_" for letra in palavra_secreta]
    letras_erradas = []
    acertos = 0
    erros = 0

    #parte da adivinhação // guessing part
    while(not enforcado and not completo):
        acertou = False #boleano para checar se o chute foi correto // boolean indicating if the guess was correct or not
        chute = input("Digite uma letra: ").lower().strip() #lendo o chute // reading the guess

        # checado se este chute já foi feito // checking if it's a repeated guess
        while(chute in letras_erradas or chute in letras_acertadas):
            chute = input("Esta letra já foi tentada, por favor tente outra: ").lower().strip()

        #adicionando o chute a lista de chutes corretos ou incorretos //adding guess to correctly or incorrect guess lists
        if(chute in palavra_secreta):
            index = 0
            for letra in palavra_secreta:
                if(chute == letra):
                    acertos = acertos + 1
                    letras_acertadas[index] = chute
                index = index + 1
        else:
            letras_erradas.append(chute)

        desenha_forca(len(letras_erradas)) #desenha a forca // draws the hang up man
        imprime_letras_chutadas(letras_acertadas,letras_erradas) #imprime letras que já foram usadas organizadas entre certas e erradas
                                                                 #prints guessed words organizing between correct and not

        completo = checa_vitoria(acertos,palavra_secreta)           # checando se venceu // checking if won
        enforcado = checa_derrota(letras_erradas,palavra_secreta)   # checando se perdeu // checking if lost

if(__name__ == "__main__"):
    jogar()