package com.projetosAcademicos.domain.repositories;

import com.projetosAcademicos.domain.models.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlunoRepository extends JpaRepository<Aluno, Long> {
	List<Aluno> findByMatricula(String matricula);
}