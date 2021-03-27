# Grade

Disciplina: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01
Nro do Grupo: 04
Paradigma: Lógico

## Alunos

| Matrícula | Aluno                              |
| --------- | ---------------------------------- |
| 170033066 | Esio Gustavo Pereira Freitas       |
| 170050939 | Lucas Dutra Ferreira do Nascimento |
| 170017885 | Marcos Nery Borges Júnior          |
| 170020461 | Pedro Henrique Andrade Féo         |
| 170024334 | Youssef Muhamad                    |

## Sobre

O propgrama é um sistema de recomendações de matérias. Ele permite que o usuário informe uma matéria que deseja cursar. Nisso o sistema vai averiguar de acordo com a materia tempo e requisitos se o usuário pode opu não cursar a respectiva matéria. Caso ele não possa, o sistema recomendará uma lista de matérias que o usuário possa se matricular.

## Screenshots

Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação

**Linguagens**: Prolog<br>
**Tecnologias**: SWI-Prolog<br>

### Via docker
Se você tiver [docker](https://docs.docker.com/get-docker/) e [docker-compose](https://docs.docker.com/compose/install/) instalados, basta rodar o comando a seguir na raiz do projeto e pronto:

```docker-compose run logico-grade```

### Manualmente
Para instalar manualmente, você precisará do [swipl](https://www.swi-prolog.org/download/stable). Com ele instalado, basta executar  
```swipl main.pl``` na raiz do projeto.


## Uso
O primeiro passo é executar ```main.``` , uma vez ja dentro do swipl (seja via docker ou manualmente). Isso te dará um menu de opções.
Menu de opções:

1. listar matrerias
2. pesquisar materia
3. verificar materia
4. recomendação de materia

## Vídeo

Adicione 1 ou mais vídeos com a execução do projeto.

## Outros

Quaisquer outras informações sobre seu projeto podem ser descritas a seguir.

## Fontes

- swi-prolog: https://www.swi-prolog.org/
