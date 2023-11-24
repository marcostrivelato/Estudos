class FilaEspera:
    def __init__(self):
        self.fila = []

    def adicionar_pessoa(self, pessoa):
        self.fila.append(pessoa)
        print(f"{pessoa} foi adicionado à fila.")

    def remover_pessoa(self, pessoa):
        if pessoa in self.fila:
            self.fila.remove(pessoa)
            print(f"{pessoa} foi removido da fila.")
        else:
            print(f"{pessoa} não está na fila.")

    def exibir_fila(self):
        if not self.fila:
            print("A fila está vazia.")
        else:
            print("Fila de espera:")
            for pessoa in self.fila:
                print("-", pessoa)
                
    def atender(self, pessoa):
        if not self.fila:
            print("Ninguém na fila")
        else:
            self.fila.remove(pessoa)
            self.fila.append(pessoa)
            self.exibir_fila()

# Exemplo de uso
fila_espera = FilaEspera()

fila_espera.adicionar_pessoa("Rafa")
fila_espera.adicionar_pessoa("Pri")
fila_espera.adicionar_pessoa("Rhudy")
fila_espera.adicionar_pessoa("Marcos")

fila_espera.exibir_fila()

fila_espera.atender("Rhudy")

fila_espera.remover_pessoa("Rafa")

fila_espera.exibir_fila()
