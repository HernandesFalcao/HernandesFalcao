# ADR-0001: Usar o repositório como Fonte Única de Verdade

- **Status:** Aceito
- **Data:** 2026-11-05
- **Decisores:** Hernandes Falcão
- **Substitui:** —
- **Relacionados:** ADR-0002

## Contexto

O desenvolvimento é feito em grande parte por agentes autônomos (Claude Code e Codex), que executam comandos,
leem arquivos e rodam testes. Quando regras de negócio, escopo e decisões ficam espalhados em chats, wikis
e na memória das pessoas, os agentes não os enxergam. Eles acabam inventando regras, violando decisões
anteriores e produzindo inconsistência entre sessões.

## Opções consideradas

1. **Wiki/Notion externo** — rico em formatação, mas invisível para os agentes sem integração e fora do versionamento do código.
2. **Instruções no prompt de cada sessão** — não versionado, se perde entre sessões e ferramentas.
3. **Documentação versionada no próprio repositório (docs-as-code)** — lida nativamente pelos agentes, versionada e revisada junto com o código.

## Decisão

Adotar a opção 3. `AGENTS.md` + `docs/` (incluindo `docs/adr/`) são a SSOT, com a precedência
definida em `docs/README.md`. Mudanças de código que tornem um documento desatualizado devem atualizá-lo no mesmo PR.

## Consequências

- **Positivas:** agentes e pessoas partem do mesmo contexto. As decisões são auditáveis via git.
- **Negativas / custos:** exige disciplina para manter os docs atualizados. Documentos grandes consomem contexto dos agentes.
- **Ações decorrentes:** manter os documentos concisos e normativos (IDs estáveis), e automatizar a verificação.

## Verificação

`scripts/check-governance.sh` roda no CI (`.github/workflows/governance.yml`). O template de PR inclui um checklist de governança.
