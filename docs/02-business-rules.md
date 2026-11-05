# Regras de negócio

> Regras de negócio são **invioláveis** para agentes. Só um humano (owner de negócio) cria ou altera uma regra.
> Todo código que implementa uma regra SHOULD referenciar o ID dela em teste ou comentário (ex.: `// BR-001`).

## Formato

Cada regra segue o modelo:

```markdown
### BR-NNN — Título curto
- **Regra:** enunciado declarativo, testável, sem ambiguidade.
- **Motivo:** por que a regra existe.
- **Exemplos:** casos válidos e inválidos (Dado/Quando/Então).
- **Exceções:** quando não se aplica (ou "nenhuma").
- **Verificação:** teste ou mecanismo que garante a regra.
- **Status:** Ativa | Obsoleta (substituída por BR-XXX)
```

## Regras

### BR-001 — TODO(owner): título
- **Regra:** TODO(owner)
- **Motivo:** TODO(owner)
- **Exemplos:**
  - Dado TODO, quando TODO, então TODO.
- **Exceções:** nenhuma
- **Verificação:** TODO(owner)
- **Status:** Ativa
