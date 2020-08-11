Trindade, 26 de Julho de 2020.  Domingo.  

Curso de Shell script - Aula 2.  - Variáveis de ambiente 

- Variáveis Globais: Podem ser passadas a todos os subprocessos do shell, incluindo 
outros shells.
Excemplos:
- PATH - lista de diretórios de programas executáveis.
- USERNAME - Nome do usuário logado
- TERM - Tipo de terminal ou janela de terminal em uso.
- HOME - Diretório home do usuário atual.
- UID - UID do usuário atual.
- RANDOM - Gera um número aleatório.
- LANG - Indioma, especificado como locate

  Os comandos "env" e "printenv" mostram as variáveis de ambiente no terminal.
  Para criar uma variável global, crie uma local e depois exporte-a com
o comando export.

	Variáveis do Shell
  
  São como "variáveis locais", pois são específicas do shell atual.
  Outros programas e shells não as herdam.
Ex.: SECONDS - nº de segundos desde que o shell foi iniciado.

- SHELL - Indica qual o shell em uso atualmente.

  Podemos criar uma variável nova digitando um par NOME=valor no 
terminal: teste-valor

  E verificarmos seu valor com o comando echo: echo $teste

  Podemos disponibilizar a variável criada para outros shells ou 
programas com o comando export: export teste

  E podemos remover uma variável de ambiente com o comando unset:
unset teste

 - Exercício 1

teste='teste'  #Cria uma variável local e atribui valor
echo $teste  #mostra o conteúdo da variável criada
bash  #cria um novo processo bash filho
ps  #mostra os dois processos
echo $teste  # mostra o conteúdo da variável criada
exit  #volta para o processo-pai
ps  #mostra o processo único rodando agora
echo $teste  #mostra o conteúdo da variável criada
export teste  # Exporta a variável TESTE
bash  #cria um novo processo bash filho
ps  #mostra os dois processos
echo $teste  #mostra o conteúdo da variável criada.


	Seção 5: Caracteres de Controle

- Códigos de cores:

Código		Aleração
1		Negrito
2		Borrado
4		Sublinhado
5		Piscante
7		Reverso
8		Escondido

30		Preto
31		Vermelho
32		Verde
33		Amarelo
34		Azul
35		Roxo
36		Ciano
37		Cinza Claro

40		Fundo Preto
41		Fundo Vermelho
42		Fundo Verde
43		Fundo Amarelo
44		Fundo Azul
45		Fundo Roxo
46		Fundo Ciano
47		Findo Cinza Claro

#-----------------------------------------------------------------------
	
	Arrays de Ambiente

  Variáveis de ambiente podem ser usadas com arrays - variáveis 
que podem  armazenar múltiplos valores.
  Para configurar um array, liste os seus valores entre parênteses:

testearray=(laranja morango acerola abacaxi)

	Seção 6: Expressões Regulares

Introdução às Expressões Rebulares.
