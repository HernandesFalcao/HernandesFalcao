# Estilo de código

> Tudo que puder ser verificado por ferramenta (formatter/linter) **deve** ser verificado por ferramenta, e não por esta prosa.
> Este documento cobre só o que a automação não alcança.

## Ferramentas

TODO(owner): definir formatter e linter após o ADR de stack (ex.: Prettier + ESLint, ou Ruff + mypy). A configuração delas é a fonte da verdade.

## Regras

- **STY-001 — Idioma:** código, identificadores e mensagens de commit em **inglês**. Documentação em `docs/` em **português**. Termos de domínio seguem o `glossary.md`.
- **STY-002 — Nomes:** nomes revelam intenção. Proibido usar abreviações não listadas no glossário. Booleanos começam com `is/has/can/should`.
- **STY-003 — Funções:** uma responsabilidade por função. Se a descrição precisa de "e", divida.
- **STY-004 — Comentários:** explicam o *porquê*, não o *o quê*. Referencie IDs (`BR-001`, `ADR-0003`) quando aplicável.
- **STY-005 — Commits:** Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`). Escopo opcional com o módulo: `feat(orchestrator): ...`.
- **STY-006 — Tipagem:** tipagem estrita habilitada. `any` (ou equivalente) exige comentário justificando.
- **STY-007 — Erros:** nunca engolir exceções silenciosamente. Logue com contexto (`run_id`, `agent`) ou propague.
