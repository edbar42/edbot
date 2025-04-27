# Edbot
Um bot simples para Discord construído em Elixir.

## Instalação
Clone este repositório.

```sh
git clone git@github.com:edbar42/edbot.git
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

Você precisa definir a variável de ambiente para o token do bot Discord Nostrum em um arquivo `.env`, assim:

```
export NOSTRUM_TOKEN="TOKEN"
```

Depois, basta executar:

```sh
iex -S mix
```

e o bot estará pronto para interação.
