programa {
  // Variáveis globais
  real saldo = 1000.00 // Saldo inicial fictício
  inteiro senha_correta = 3589
  cadeia usuario

  funcao inicio() {
    inteiro opcao

    escreva("===== Bem-vindo ao Banco Digital =====\n")
    escreva("Digite seu nome: ")
    leia(usuario)
    escreva("\nOlá ", usuario, ", é um prazer ter você por aqui!\n")

    // Loop do menu principal
    enquanto (verdadeiro) {
      escreva("\n========== MENU ==========\n")
      escreva("1 - Consultar Saldo\n")
      escreva("2 - Ver Extrato\n")
      escreva("3 - Realizar Saque\n")
      escreva("4 - Fazer Depósito\n")
      escreva("5 - Transferência Bancária\n")
      escreva("6 - Sair\n")
      escreva("==========================\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha (opcao) {
        caso 1:
          consultar_saldo()
        caso 2:
          ver_extrato()
        caso 3:
          sacar_dinheiro()
        caso 4:
          fazer_deposito()
        caso 5:
          fazer_transferencia()
        caso 6:
          escreva("\nObrigado por utilizar nosso banco, ", usuario, "! Até logo.\n")
          pare
        caso contrario:
          escreva("\nOpção inválida! Tente novamente.\n")
      }
    }
  }

  // Função para validar a senha antes de operações sensíveis
  funcao logico validar_senha() {
    inteiro senha_digitada
    escreva("\nDigite sua senha: ")
    leia(senha_digitada)

    se (senha_digitada == senha_correta) {
      retorne verdadeiro
    } senao {
      escreva("Senha incorreta! Tente novamente.\n")
      retorne falso
    }
  }

  // Função para exibir saldo
  funcao consultar_saldo() {
    se (validar_senha()) {
      escreva("\nSeu saldo atual é: R$ ", saldo, "\n")
    }
  }

  // Função para mostrar um extrato fictício
  funcao ver_extrato() {
    se (validar_senha()) {
      escreva("\n===== EXTRATO BANCÁRIO =====\n")
      escreva("Compra: Mercado Online - R$ 230,50\n")
      escreva("Pix Recebido: João Silva - R$ 150,00\n")
      escreva("Débito: Restaurante - R$ 75,00\n")
      escreva("Depósito: R$ 500,00\n")
      escreva("===============================\n")
      escreva("Saldo atual: R$ ", saldo, "\n")
    }
  }

  // Função para saque
  funcao sacar_dinheiro() {
    se (validar_senha()) {
      real valor
      escreva("\nDigite o valor do saque: ")
      leia(valor)

      se (valor <= 0) {
        escreva("Operação não autorizada! Valor inválido.\n")
      } senao se (valor > saldo) {
        escreva("Operação não autorizada! Saldo insuficiente.\n")
      } senao {
        saldo = saldo - valor
        escreva("Saque realizado! Novo saldo: R$ ", saldo, "\n")
      }
    }
  }

  // Função para depósitos
  funcao fazer_deposito() {
    real valor
    escreva("\nDigite o valor do depósito: ")
    leia(valor)

    se (valor <= 0) {
      escreva("Operação não autorizada! Valor inválido.\n")
    } senao {
      saldo = saldo + valor
      escreva("Depósito realizado com sucesso! Novo saldo: R$ ", saldo, "\n")
    }
  }

  // Função para transferências
  funcao fazer_transferencia() {
    se (validar_senha()) {
      inteiro conta_destino
      real valor

      escreva("\nDigite o número da conta de destino: ")
      leia(conta_destino)

      escreva("Digite o valor da transferência: ")
      leia(valor)

      se (valor <= 0) {
        escreva("Operação não autorizada! Valor inválido.\n")
      } senao se (valor > saldo) {
        escreva("Operação não autorizada! Saldo insuficiente.\n")
      } senao {
        saldo = saldo - valor
        escreva("Transferência de R$ ", valor, " para a conta ", conta_destino, " realizada com sucesso!\n")
        escreva("Novo saldo: R$ ", saldo, "\n")
      }
    }
  }
}

