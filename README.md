# aFlix
# anthorflix

Autor: Taisa Daiana da Costa

Informações gerais:

IDE de desenvolvimento: Android Studio
Linguagem: Flutter

Descrição do programa:
- faz consulta de filmes na base do OMDb, clicando na taskBar (ícone da lupa);
- mostra as seguintes informações:
  Título;
  Ano;
  Foto do Poster;
  Diretor;
  Elenco;
  Gênero;
  Lançamento;
  Descrição;
  Avaliação (em estrelas);
  Lista de comentários;
  
- Permite que o usuário avalie o filme por meio de avaliação com estrelas, e permite a inclusão de 
comentários.

Bugs conhecidos:
 - não persiste os dados;

Funcionalidade não implementada:
 - não faz CRUD de filmes;
 - não faz cadastro de usuários;
 - não possui um backend.
 
Planejamento:

A ideia foi criar o sistema de avaliações dos filmes a partir da extração dos dados do site do OMDb 
(fornecendo o título do filme como a chave da pesquisa), para então salvar apenas os títulos que foram
avaliados em um arquivo json.
Classes foram criadas para a representação do filme (movie.dart), tela de detalhes do filme
(movies_widget.dart).
A implementação de salvamento local com o json foi iniciada, mas não concluída.

Funcionalidades desafiadoras:
 - Persistencia dos dados;
 - Criação de uma UI com uma boa usabilidade;
 - Autenticação.
Porque: necessário mais pesquisa e desenvolvimento nessas áreas.

Se você tivesse mais tempo para fazer o projeto o que faria de diferente?
 - Teria modularizado mais, feito testes unitários, e principalmente buscado mais feedback do cliente
   com relação a como a interface poderia ser feita da melhor maneira, antes mesmo de começar a codificar,
   para evitar perder tempo.