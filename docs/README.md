# Documentação do projeto (SSOT)

Este diretório, junto com `AGENTS.md`, forma a **Fonte Única de Verdade** do projeto.
Código, testes, planos e decisões de agentes ou pessoas devem estar de acordo com ele.

## Ordem de precedência

1. ADRs com status **Aceito** — [`adr/`](adr/README.md)
2. Regras de negócio — [`02-business-rules.md`](02-business-rules.md)
3. Escopo — [`01-scope.md`](01-scope.md)
4. Arquitetura — [`03-architecture.md`](03-architecture.md) e sistema de agentes — [`07-agent-system.md`](07-agent-system.md)
5. Estrutura de pastas — [`04-folder-structure.md`](04-folder-structure.md)
6. Padrões de código — [`06-coding-patterns.md`](06-coding-patterns.md)
7. Estilo de código — [`05-coding-style.md`](05-coding-style.md)

Processo: [`08-development-workflow.md`](08-development-workflow.md) · Vocabulário: [`glossary.md`](glossary.md)

## Convenções destes documentos

- **MUST / MUST NOT / SHOULD / MAY** seguem a RFC 2119. Um *MUST* é verificado em revisão e, quando possível, por automação.
- Cada item normativo tem um **ID estável** (`BR-001`, `SC-IN-001`, `PAT-001`, `STY-001`, `AG-001`). IDs nunca são reutilizados. Um item removido fica marcado como ~~obsoleto~~.
- `TODO(owner): ...` marca uma lacuna que **só um humano pode preencher**. Agentes não podem resolvê-la por conta própria. `scripts/check-governance.sh --strict` faz o check falhar enquanto houver `TODO(owner)`.
- Um documento descreve o **estado atual**. O histórico e as justificativas ficam nos ADRs e no git.
