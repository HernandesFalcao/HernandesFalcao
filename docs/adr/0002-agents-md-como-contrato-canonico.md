# ADR-0002: Usar AGENTS.md como contrato canônico para agentes de desenvolvimento

- **Status:** Aceito
- **Data:** 2026-11-05
- **Decisores:** Hernandes Falcão
- **Substitui:** —
- **Relacionados:** ADR-0001

## Contexto

O projeto usa mais de uma ferramenta agêntica. O Codex lê `AGENTS.md`. O Claude Code lê `CLAUDE.md`
e suporta importar outros arquivos com `@caminho`. Manter dois arquivos com regras duplicadas leva a divergência.

## Opções consideradas

1. **Dois arquivos independentes** — duplicação e divergência inevitáveis.
2. **CLAUDE.md canônico e AGENTS.md como cópia** — o Codex não importa arquivos, então seria preciso duplicar o conteúdo.
3. **AGENTS.md canônico; CLAUDE.md importa via `@AGENTS.md`** e contém apenas notas específicas do Claude Code.

## Decisão

Adotar a opção 3. `AGENTS.md` é curto e funciona como roteador: regras invioláveis, ordem de leitura e
comandos. O conteúdo detalhado mora em `docs/`. `AGENTS.md` em subpastas pode acrescentar regras locais.

## Consequências

- **Positivas:** uma única fonte para todas as ferramentas, e o contexto inicial fica enxuto.
- **Negativas / custos:** os agentes precisam seguir os links para `docs/`. Isso é mitigado pela ordem de leitura explícita.
- **Ações decorrentes:** `scripts/check-governance.sh` verifica que `CLAUDE.md` importa `AGENTS.md`.

## Verificação

Check automatizado em `scripts/check-governance.sh`.
