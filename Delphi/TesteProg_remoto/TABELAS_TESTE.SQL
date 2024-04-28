-- script para criação da base para testes de programador

-- cria tabelas
create table TBL_FORNEC
(
   COD_FOR number(5),
   NOME    varchar2(20),
  
   constraint PK_TBL_FORNEC primary key (COD_FOR)
);

create table TBL_PRODUTO
(
   COD_PRO varchar2(5),
   NOME    varchar2(20),
  
   constraint PK_TBL_PRODUTO primary key (COD_PRO)
);

create table TBL_FORPRO
(
   COD_FOR number(5),
   COD_PRO varchar2(20),
   VALOR   number(12,2),

   constraint PK_TBL_FORPRO primary key (COD_FOR,COD_PRO)
);

-- insere alguns dados
insert into TBL_FORNEC(COD_FOR,NOME) values (1,'FORNECEDOR TESTE 1');
