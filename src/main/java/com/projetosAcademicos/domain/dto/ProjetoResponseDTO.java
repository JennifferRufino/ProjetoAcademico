package com.projetosAcademicos.domain.dto;

import com.projetosAcademicos.domain.models.Aluno;
import com.projetosAcademicos.domain.models.Professor;
import com.projetosAcademicos.domain.models.Projeto;
import lombok.Data;

import java.util.List;

@Data
public class ProjetoResponseDTO {

    private Long id;
    private String titulo;
    private String area;
    private String resumo;
    private String palavraChave1;
    private String palavraChave2;
    private String palavraChave3;
    private String urlDocumento;

    private Professor professor;
    private List<Aluno> alunos;

    public ProjetoResponseDTO() {
    }

    public ProjetoResponseDTO(Projeto p) {
        this.id = p.getId();
        this.titulo = p.getTitulo();
        this.area = p.getArea();
        this.resumo = p.getResumo();
        this.palavraChave1 = p.getPalavraChave1();
        this.palavraChave2 = p.getPalavraChave2();
        this.palavraChave3 = p.getPalavraChave3();
        this.urlDocumento = p.getUrlDocumento();
        this.professor = p.getProfessor();
        this.alunos = p.getAlunos();
    }
}