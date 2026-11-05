---
description: Verifica se a mudança atual está em conformidade com a SSOT (Definition of Done)
---

1. Rode `scripts/check-governance.sh` e reporte o resultado.
2. Analise `git diff` (e `git diff --staged`) contra:
   - ADRs aceitos em `docs/adr/`;
   - regras de negócio em `docs/02-business-rules.md` e escopo em `docs/01-scope.md`;
   - estrutura de pastas, padrões e estilo (`docs/04`, `docs/05`, `docs/06`);
   - regras de agentes em `docs/07-agent-system.md`, se aplicável.
3. Verifique se algum documento de `docs/` ficou desatualizado pela mudança.
4. Percorra o checklist "Definition of Done" de `docs/08-development-workflow.md` §4, marcando cada item com evidência.
5. Liste as violações com arquivo:linha e o ID da regra violada. Não corrija nada sem confirmação.
