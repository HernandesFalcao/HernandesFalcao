---
description: Planeja uma tarefa ancorado na SSOT (ADRs, regras de negócio, escopo) antes de qualquer edição
argument-hint: <descrição da tarefa>
---

Tarefa: $ARGUMENTS

Não edite nenhum arquivo nesta etapa.

1. Leia `AGENTS.md` e, conforme a ordem de leitura dele, os documentos de `docs/` relevantes para a tarefa,
   incluindo todos os ADRs com status Aceito que possam ser afetados.
2. Produza o plano exatamente com as 8 seções de `docs/08-development-workflow.md` §1.
3. Cite IDs concretos (ADR-NNNN, BR-NNN, SC-IN-NNN, PAT-NNN). Se não houver regra documentada para algo necessário,
   liste como pergunta aberta. Não invente.
4. Se houver conflito com ADR, regra de negócio ou escopo, ou se for necessário um novo ADR, diga isso
   claramente no topo e pare para aprovação.
