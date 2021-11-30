# Trabalho 1
Aluno: João Victor Carneiro
Disciplina: MATA61 2021.2 T01


## Relatório
O arquivo léxico original `lexer.l` foi copiado e renomeado para `c-v1.1.l`.
Foram adicionados a ele os tokens de tipo KEY `const` e `for`.

Foi inclusa também uma cópia do arquivo sintático `parser.y` renomeada para `c-v1.1.y`.
Feito isso foi atualizado o nome do include no arquivo léxico.

Os scripts `run.sh` e `compile.sh` também foram copiados e modificados com os novos nomes de arquivo.
Os arquivos de entrada e saída exemplos `mult.c` e `mult.out` também foram copiados para a pasta.


## Execução

Para compilar:

```
$ ./compile.sh
```

Para rodar os exemplos:
```
$ ./run.sh mult.c mult.out
```


## Saídas
Após compilação sem erros, o script de execução gerou o seguinte output, com linha, token e lexema:
```
> executando compilador cm com entrada mult.c e saída mult.out ...

> saída está no arquivo mult.out para programa mult.c (em C-v1.1):

(2,KEY,"int")
(2,ID,"main")
(2,SYM,"(")
(2,KEY,"void")
(2,SYM,")")
(2,SYM,"{")
(3,KEY,"int")
(3,ID,"a")
(3,SYM,";")
(4,KEY,"int")
(4,ID,"b")
(4,SYM,";")
(5,ID,"a")
(5,SYM,"=")
(5,NUM,"10")
(5,SYM,";")
(5,ID,"b")
(5,SYM,"=")
(5,NUM,"5")
(5,SYM,";")
(6,KEY,"return")
(6,ID,"a")
(6,SYM,"*")
(6,ID,"b")
(6,SYM,";")
(7,SYM,"}")
```
