# CLAUDE.md

@AGENTS.md

## Específico do Claude Code

- `AGENTS.md` é a fonte canônica de instruções para agentes. **Não duplique regras aqui**: altere o `AGENTS.md`.
- Comandos de projeto: `/plan <tarefa>`, `/new-adr <título>`, `/governance-check`.
- Use Plan Mode em tarefas que toquem mais de um módulo ou que possam exigir ADR.
- Ao usar subagentes, inclua no prompt deles os caminhos dos documentos SSOT relevantes. Subagentes não herdam este contexto automaticamente.
