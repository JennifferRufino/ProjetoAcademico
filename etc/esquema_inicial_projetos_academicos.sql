create schema api_projetos_academicos;

use api_projetos_academicos;

create table endereco
(
    id     int auto_increment,
    rua    varchar(255) not null,
    numero varchar(8)  default null,
    cep    varchar(14) default null,
    cidade varchar(50) default null,
    estado varchar(50) default null,
    pais   varchar(50) default null,
    constraint endereco_pk
        primary key (id)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4;

INSERT INTO endereco (rua, numero, cep, cidade, estado, pais)
VALUES ('Rua dos bobos', '10', '58.415-100', 'Sabeselaquem', 'PB', 'BR'),
       ('Rua Ananias', '20', '58.455-200', 'São Jose da Lagoa Tapada', 'PB', 'BR'),
       ('Rua São Paulo', '30', '58.455-300', 'São Paulo', 'SP', 'BR');

create table aluno
(
    id             int auto_increment,
    matricula      varchar(12) not null,
    nome           varchar(200) default null,
    cpf            varchar(14)  default null,
    curso          varchar(255) default null,
    fk_endereco_id int         not null,
    constraint aluno_pk
        primary key (id),
    constraint aluno_endereco_id_fk
        foreign key (fk_endereco_id) references endereco (id)
            on delete no action on update no action
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4;

create unique index aluno_matricula_uindex
    on aluno (matricula);

insert into aluno (matricula, nome, cpf, curso, fk_endereco_id)
VALUES ('172080000', 'Aluno 2', '123.123.132-15', 'Ciencia da computacao', 4),
       ('172090000', 'Aluno 3', '231.231.231-30', 'Ciencia da computacao', 6);

create table professor
(
    id             int auto_increment,
    matricula      varchar(12) not null,
    nome           varchar(200) default null,
    curso          varchar(255) default null,
    fk_endereco_id int         NOT NULL,
    constraint professor_pk
        primary key (id),
    constraint professor_endereco_id_fk
        foreign key (fk_endereco_id) references endereco (id)
            on delete no action on update no action
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4;

INSERT INTO professor (matricula, nome, curso, fk_endereco_id)
VALUES ('123456', 'Professor 1', 'Ciencia da computacao', 5);

create table projeto
(
    id              int          not null auto_increment,
    titulo          varchar(255) not null,
    professor_id    int          not null,
    area_projeto    varchar(255) default null,
    resumo          varchar(255) default null,
    palavra_chave_1 varchar(50)  default null,
    palavra_chave_2 varchar(50)  default null,
    palavra_chave_3 varchar(50)  default null,
    url_documento   varchar(255) default null,
    constraint projeto_pk
        primary key (id),
    constraint projeto_professor_id_fk
        foreign key (professor_id) references professor (id)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8;

insert into projeto (titulo, professor_id, area_projeto, resumo, palavra_chave_1, palavra_chave_2, palavra_chave_3,
                     url_documento)
    value ('Projeto 01', 4, 'Area 01', 'Resumo do Projeto 01', 'Palavra1', 'Palavra2', 'Palavra3',
           'https://qualquercoisa.com/projeto01');

create table alunos_projeto
(
    aluno_id   int not null,
    projeto_id int not null,
    constraint alunos_projeto_pk
        primary key (aluno_id, projeto_id),
    constraint alunos_projeto_aluno_id_fk
        foreign key (aluno_id) references aluno (id),
    constraint alunos_projeto_projeto_id_fk
        foreign key (projeto_id) references projeto (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

insert into alunos_projeto (aluno_id, projeto_id) value (5, 4);

