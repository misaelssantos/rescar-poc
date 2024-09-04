### Usando o Swagger

- Primeiro efetuar o login utilizando o serviço ***/login***

![Serviço Login](docs/servico_login.png)

    - Clicar em **Try it out**
    - Preencher o **Request body** com email/senha
    - Clicar em **Execute**

- Copiar o token presente no cabeçalho **authorization** da resposta, sem o **Barear**

![Copiar Token](docs/copiar_token.png)

- Clicar na opção **Authorize** (no topo da página, ao lado de *Servers*)

![Opção Authorize](docs/swagger_authorize.png)

- Adicionar o token copiado na opção *Value* e clicar em **Authorize**

![Adicionar Token](docs/adicionar_token_authorize.png)

- Executar as demais funcionalidades que exigem login, por exemplo o serviço **Listar Usuários** *GET /v1/usuarios*

![Listar Usuários - Try it out](docs/listar_usuarios.png)

![Listar Usuários - Execute](docs/listar_usuarios_execute.png)

    - Clicar em **Try it out**
    - Clicar em **Execute**

![Listar Usuários - Resultado](docs/resultado_listar_usuarios.png)
