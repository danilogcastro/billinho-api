# BILLINHO API - DANILO CASTRO

## DESCRIÇÃO

API desenvolvida em Rails 6, para teste da empresa Quero Educação

## PARA CONSUMIR ESSA API

Foi feito deploy de uma versão desta API para o seguinte endereço:

> https://billinho-api-danilocastro.herokuapp.com/

Por default, a home page é redirecionada para a visualização do endpoint 'students', primeira página, com 5 itens por página

### VISUALIZAR TODOS OS ESTUDANTES

Faça um GET request para a seguinte url:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/students

Caso deseje determinar o número de resultados por página, passe como parâmetros:

```
{
  "page": <NÚMERO DA PÁGINA DESEJADA>,
  "count": <NÚMERO DE ITENS POR PÁGINA>
}
```

Por exemplo, se quisesse visualizar a quarta página, com 5 resultados por página, a url seria:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/students?page=4&count=5

### CRIAR UM NOVO ESTUDANTE

Faça um POST request para a seguinte url:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/students

Fazendo constar no corpo do request:

```
{
  "name": <NOME DO ALUNO>,
  "cpf": <CPF NO FORMATO: "DDDDDDDDDDD">,
  "birthdate": <DATA NO FORMATO: "DD/MM/AAAA">,
  "payment_method": <FORMA DE PAGAMENTO: "boleto" ou "credit_card">
}
```

### VISUALIZAR TODAS AS MATRÍCULAS

Faça um GET request para a seguinte url:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/enrollments

Por default, a API retorna apenas os 20 primeiros itens.
Caso deseje determinar o número de resultados por página, passe como parâmetros:

```
{
  "page": <NÚMERO DA PÁGINA DESEJADA>,
  "count": <NÚMERO DE ITENS POR PÁGINA>
}
```

Por exemplo, se quisesse visualizar a segunda página, com 2 resultados por página, a url seria:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/enrollments?page=2&count=2

### CRIAR UMA NOVA MATRÍCULA

Para criar uma nova matrícula, é necessário estar autenticado como administrador.

Para se autenticar, primeiramente é preciso fazer um POST request para a url:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/auth/sign_in

Com os seguintes parâmetros:

```
{
  "email": <EMAIL VÁLIDO>,
  "password": <SENHA>
}
```

Nos headers da resposta, podem ser encontrados os itens: **access-token**, **token-type**, **client**, **expiry**, **uid**

Após a autenticação, é possível fazer um POST request para a url:

> https://billinho-api-danilocastro.herokuapp.com/api/v1/enrollments

Passando nos _HEADERS_ do request os seguintes parâmetros:

```
{
  "access-token": <TOKEN>,
  "token-type": <TIPO DE TOKEN>,
  "client": <CLIENTE>,
  "expiry": <VALIDADE>,
  "uid": <IDENTIFICADOR DE USUÁRIO>
}
```

Estas informações podem ser encontradas nos headers da resposta do request de autenticação
