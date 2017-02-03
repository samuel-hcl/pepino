#language: pt

Funcionalidade: Checkout
  Como um comprador de livros online
  Eu preciso fornecer minhas informações pessoais
  Para que o site consiga processar meu pedido

  Contexto:
    Dado que eu esteja no catálogo da loja de livros

  Cenario: Fornecendo todos os dados
    Quando eu compro um livro
    E eu finalizo o pedido com:
    | name      | address          | email           | payment |
    | Sam Smith | 1213 Main Street | sam@example.com | Boleto  |
    Então eu devo ver a mensagem "Obrigado pela sua compra!"

  Cenario: Nome não fornecido
    Quando eu compro um livro
    E eu finalizo o pedido deixando o campo "Name" em branco
    Então eu devo ver a mensagem de erro "Name can't be blank"

  Cenario: Endereço não fornecido
    Quando eu compro um livro
    E eu finalizo o pedido deixando o campo "Address" em branco
    Então eu devo ver a mensagem de erro "Address can't be blank"

  Cenario: Email não fornecido
    Quando eu compro um livro
    E eu finalizo o pedido deixando o campo "Email" em branco
    Então eu devo ver a mensagem de erro "Email can't be blank"

  Cenario: Opções de pagamento
    Quando eu compro um livro
    Então nas formas de pagamento disponíveis deve conter "Boleto"
    E nas formas de pagamento disponíveis deve conter "Cartão de Crédito"
    E nas formas de pagamento disponíveis deve conter "PayPal"