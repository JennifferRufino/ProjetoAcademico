package com.projetosAcademicos.api;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.projetosAcademicos.domain.models.Aluno;
import com.projetosAcademicos.domain.services.AlunoService;
import com.projetosAcademicos.domain.dto.AlunoDTO;

@RestController
@RequestMapping("/api/v1/alunos")
public class AlunosController {

	@Autowired
	private AlunoService service;

	@GetMapping
	public ResponseEntity<List<AlunoDTO>> get() {
		return ResponseEntity.ok(service.getAlunos());
	}

	@GetMapping("/{id}")
	public ResponseEntity<Aluno> get(@PathVariable("id") Long id) {
		Optional<Aluno> aluno = service.getAlunoById(id);
		return aluno.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());

	}

	@GetMapping("/matricula/{matricula}")
	public ResponseEntity<List<AlunoDTO>> getAlunoByMatricula(@PathVariable("matricula") String matricula) {
		List<AlunoDTO> listaAluno = service.getAlunoByMatricula(matricula);
		return listaAluno.isEmpty() ?
				ResponseEntity.noContent().build() :
				ResponseEntity.ok(listaAluno);
	}

	@PostMapping
	public String cadastrarAluno(@RequestBody Aluno aluno) {
		Aluno c = service.cadastrar(aluno);
		return "Aluno salvo com sucesso: " + c.getId();
	}

	@PutMapping("/{id}")
	public String atualizarAluno(@PathVariable("id") Long id, @RequestBody Aluno aluno) {
		Aluno c = service.atualizar(aluno, id);
		return "Aluno atualizado com sucesso: " + c.getId();
	}

	@DeleteMapping("/{id}")
	public String removerAluno(@PathVariable("id") Long id) {
		return service.remover(id) ? "Aluno removido com sucesso!" : "Aluno não encontrado!";
	}
}