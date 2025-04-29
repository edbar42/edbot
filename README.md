# Edbot
Um bot simples para Discord construído em Elixir.

## Instalação
Clone este repositório.

```sh
git clone git@github.com:edbar42/edbot.git
```

Você precisa definir a variável de ambiente para o token do bot Discord Nostrum em um arquivo `.env`, assim:

```sh
export NOSTRUM_TOKEN="TOKEN"
```

### Executando com Docker
Você precisa ter o `docker` e o `docker-compose` instalados.

Simplesmente execute

```sh
docker-compose run --build
```

para construir e executar a aplicação. Depois disso, o bot estará pronto para interação.

### Executando em um Ambiente de Shell
Você precisará ter o Elixir v1.18.3 ou superior instalado.

```sh
mix deps.get
```
Importe as variáveis de ambiente manualmente:

```sh
source .env
```

Depois, basta executar:

```sh
iex -S mix
```

e o bot estará pronto para interação.

## Comandos Disponíveis
**!fake**
- Gera uma foto de perfil aleatória de pessoa fictícia

**!procurado**
- Mostra um aviso aleatório de criminoso procurado pelo FBI e detalhes sobre a recompensa

**!brba**
- Exibe uma citação aleatória de Breaking Bad

**!imposto**
- Mostra quanto foi arrecadado até o momento em impostos municipais em Fortaleza

**!espaço**
- Mostra quantas pessoas estão atualmente no espaço, seus nomes e que nave tripulam

**!ip**
- Exibe seu endereço de IP

**!cep**
- Busca informações de um CEP brasileiro válido
- Digite o CEP apenas com números
- Exemplo: `!cep 01001000`

**Observações:**
- Todos os comandos começam com o prefixo `!`
- Comandos que não forem reconhecidos serão ignorados
