class Conta:
    def __init__(self, numero, titular, saldo, limite = 1000):
        self.__numero = numero
        self.__titular = titular
        self.__saldo = saldo
        self.__limite = limite
        print("Conta criada")

    def extrato(self):
        print(f"O Saldo do titular {self.saldo} é {self.titular}")

    def deposita(self,valor):
       self.__saldo += valor

    #usando o __medoto, definimos o método como privado
    def __tem_saldo_disponivel(self,valor):
        valor_disponível_a_sacar = self.__saldo + self.__limite
        return valor <=  valor_disponível_a_sacar

    def saca(self,valor):
        if(self.__tem_saldo_disponivel(valor)):
            self.__saldo -= valor
        else:
            print(f"o valor {valor} está acima do saldo disponível")

    def transfere(self, valor, destino):
        self.saca(valor)
        destino.deposita(valor)

    # Getters and Setters
    @property
    def saldo(self):
        return self.__saldo
    @property
    def titular(self):
        return self.__titular
    @property
    def limite(self):
        return self.__limite

    @saldo.setter
    def saldo(self,valor):
        self.__saldo = valor
    @limite.setter
    def limite(self,valor):
        self.__limite = valor
    @titular.setter
    def titular(self, nome):
        self.__titular = nome

    #metodo estático, não depende do objeto. É um metodo da classe, que retorna valor sem nescessitar de um objeto
    @staticmethod
    def codigos_bancos(): #neste caso apenas retornamos um dicionario simples, mas seria util o método caso fosse preciso por exemplo abrir um documento para ler a infromação antes de passá-la
        return {"BB":"001","Caixa":"104","Bradesco":"237"}
