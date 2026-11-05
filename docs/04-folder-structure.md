# Estrutura de pastas

> **MUST:** arquivos novos seguem esta estrutura. Uma pasta nova de primeiro nível exige ADR.
> Proposta inicial; ajustar após o ADR de stack.

```text
.
├── AGENTS.md                 # Contrato para agentes (canônico)
├── CLAUDE.md                 # Importa AGENTS.md + notas do Claude Code
├── .claude/commands/         # Comandos de projeto do Claude Code
├── docs/                     # SSOT: escopo, regras, arquitetura, padrões
│   └── adr/                  # Architecture Decision Records (NNNN-titulo.md)
├── scripts/                  # Automação (check-governance, setup)
├── src/
│   ├── core/                 # Domínio puro: entidades, regras de negócio, portas
│   ├── orchestrator/         # Planejamento e roteamento de tarefas
│   ├── agents/
│   │   └── <nome-agente>/    # Um diretório por agente (ver AG-002)
│   │       ├── agent.*       # Definição/loop do agente
│   │       ├── prompts/      # Prompts versionados (system.md, ...)
│   │       ├── tools.*       # Lista de ferramentas permitidas
│   │       └── AGENTS.md     # (opcional) regras locais
│   ├── tools/                # Implementação das ferramentas
│   └── infra/                # Adaptadores (LLM, DB, filas, telemetria)
├── evals/                    # Datasets e suítes de avaliação de agentes
└── tests/                    # unit/ · integration/ · e2e/ (espelha src/)
```

## Regras

- **FS-001:** Testes espelham o caminho do código: `src/core/x.*` → `tests/unit/core/x.test.*`.
- **FS-002:** Prompts nunca ficam inline no código. Eles moram em `src/agents/<agente>/prompts/` como arquivos de texto/Markdown.
- **FS-003:** Nada de pastas genéricas (`utils/`, `helpers/`, `misc/`) no primeiro nível de um módulo. Nomeie pelo conceito.
- **FS-004:** Arquivos do perfil do GitHub (`README.md`, `devcard.svg`, workflows de perfil) estão fora da governança de código.
