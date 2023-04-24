import random

def jogar():
    """

    :rtype: object
    """
    print("********************************")
    print("Bem vindo ao jogo de adivinhação")
    print("********************************")

    numero_secreto = random.randint(1,100) #gera número aleatório
    pontos = 100
    #definindo o número de tentativas

    ok = False
    while(not ok):
        dificuldade = input("Qual o nível de dificuldade?\n 1. Fácil- 10 tentativas\n 2. Médio- 5 tentativas\n 3. Difícil- 3 tentativas\n").lower()
        if(dificuldade == "1" or dificuldade == "fácil" or dificuldade == "facil"):
            numero_tentativas = 10
            ok = True
        elif(dificuldade == "2" or dificuldade == "médio" or dificuldade == "medio"):
            numero_tentativas = 5
            ok = True
        elif(dificuldade == "3" or dificuldade == "difícil" or dificuldade == "dificil"):
            numero_tentativas = 3
            ok = True
        else:
            print("ocorreu um erro tente novamente\n")


    #for rodada in range(1,numero_tentativas+1) /// se fosse usar o for para o loop, mas neste caso faz pouca diferença
    rodada=1
    while(rodada<=numero_tentativas):
        chute = int(input("Digite um número de 1 a 100: "))
        if(chute < 1 or chute>100):
            print("Você deve digitar um número entre 1 a 100")
            continue

        if(numero_secreto == chute):
            print(" Parabéns! Você acertou em {} tentativas e fez {} pontos".format(rodada,pontos)) #esta aqui apenas para manter como exemplo do uso do .format()
            break
        else:
            if(chute > numero_secreto):
                print(f"Você errou, seu chute foi muito alto, essa foi sua {rodada}ª tentativa")
            else:
                #deixando o .format() aqui apenas como exemplo
                print("voce errou, seu chute foi muito baixo, essa foi sua {}ª tentativa".format(rodada))
            pontos_perdidos = abs(numero_secreto - chute)
            pontos = pontos - pontos_perdidos
        rodada = rodada+1

    if(rodada == numero_tentativas+1):
        print(f"Você perdeu :(\nSua pontuação final foi de {pontos} pontos")

    print("Fim do jogo")

if(__name__ == "__main__"):
    jogar()