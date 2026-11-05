---
description: Cria um novo ADR com status Proposto a partir do template
argument-hint: <título da decisão>
---

Crie um ADR para: $ARGUMENTS

1. Descubra o próximo número livre em `docs/adr/` (formato `NNNN`).
2. Copie `docs/adr/0000-template.md` para `docs/adr/NNNN-<titulo-em-kebab-case>.md` e preencha todas as seções com base
   no contexto da conversa e nos documentos de `docs/`. Status: **Proposto**. Data: hoje.
3. Se o ADR substitui outro, registre isso em "Substitui". **Não** altere o status do ADR antigo, isso cabe ao humano.
4. Adicione a linha no índice `docs/adr/README.md`.
5. Rode `scripts/check-governance.sh` e corrija os erros.
6. Pare e peça revisão humana. Não implemente a decisão até ela ser aceita.
