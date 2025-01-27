create database bd_faculdade;
use bd_faculdade;

create table tbl_alunos(
    id int primary key not null auto_increment,
    Nome varchar (100) not null,
    cpf varchar (45) not null,
    Data_nascim date,
    
    unique index (id)
);

create table tbl_professores(
    id int primary key not null auto_increment,
    Nome varchar (100) not null,
    cpf varchar (50) not null,
    area_atuacao varchar (150) not null,
    Descricao text,
    
    unique index (id)
);
create table tbl_email(
      id int primary key not null auto_increment,
      id_alunos int not null,
      id_professores int not null,
      email varchar (200),
      
      constraint FK_email_alunos
      foreign key (id_alunos)
      references tbl_alunos (id),
      
      constraint FK_email_professores
      foreign key (id_professores)
      references tbl_professores (id),
      
      unique index (id)
);

create table tbl_telefone(
     id int primary key not null auto_increment,
     numero varchar (45) not null,
     id_alunos int not null,
     id_professores int not null,
   
	 constraint FK_telefone_alunos
     foreign key (id_alunos)
	 references tbl_alunos (id),
     
     constraint FK_telefone_professores
     foreign key (id_professores)
     references tbl_professores (id),
     
     unique index (id)
);

create table tbl_endereco(
     id int primary key not null auto_increment,
     id_alunos int not null,
	 logradouro varchar (100) not null,
     bairro varchar (100) not null,
     cidade varchar (100) not null,
     estado varchar (100) not null,
     pais varchar (100) not null,
     
     constraint FK_endereco_alunos
     foreign key (id_alunos)
     references tbl_alunos (id),
     
     unique index (id)
);

create table tbl_cursos(
    id int primary key not null auto_increment,
    id_alunos int not null,
    nome varchar (100) not null,
    duracao time not null,
    descricao text,
    
    constraint FK_cursos_alunos
    foreign key (id_alunos)
    references tbl_alunos (id),
    
   unique index (id)
);

create table tbl_materias(
     id int primary key not null auto_increment,
     id_professores int not null,
     id_cursos int not null,
     nome varchar (150) not null,
     carga_horaria int not null,
     descricao text not null,
     
     constraint FK_materias_professores
     foreign key (id_professores)
     references tbl_professores (id),
     
     constraint FK_materias_cursos
     foreign key (id_cursos)
     references tbl_cursos (id),
     
     unique index (id)
);

create table tbl_notas(
    id int primary key not null auto_increment,
    id_alunos int not null,
    id_materias int not null,
    valor_nota float not null,
    
    constraint FK_notas_alunos
    foreign key (id_alunos)
    references tbl_alunos (id),
    
    constraint FK_notas_materias
    foreign key (id_materias)
    references tbl_materias (id),
    
     unique index (id)     
);