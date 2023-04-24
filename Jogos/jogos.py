import forca
import Adivinhacao

print("**************************")
print("*****Escolha Seu Jogo*****")
print("**************************")

print("1 - Forca\n2 - Adivinhação\n")
jogo = int(input("Qual jogo deseja jogar?\n"))

if(jogo == 1):
    print("Jogando forca\n")
    forca.jogar()
elif(jogo == 2):
    print("Jogando adivinhação\n")
    Adivinhacao.jogar()