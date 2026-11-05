# Fluxo de desenvolvimento (pessoas e agentes)

## 1. Planejar

Antes de editar código, produza um plano com:

1. **Objetivo** — o que muda e por quê.
2. **Referências SSOT** — ADRs, `BR-xxx`, `SC-IN-xxx` e padrões que se aplicam.
3. **Checagem de escopo** — confirmar que nada toca `SC-OUT-xxx`.
4. **Necessidade de ADR** — sim/não, com justificativa (critérios em `AGENTS.md` §3).
5. **Arquivos afetados** — caminhos de acordo com `04-folder-structure.md`.
6. **Testes** — quais serão criados ou alterados (TST-001..003).
7. **Docs** — quais documentos precisam ser atualizados.
8. **Riscos e perguntas abertas.**

No Claude Code: `/plan <tarefa>`. No Codex: peça "siga a seção 1 de docs/08-development-workflow.md".

## 2. Decidir (ADR)

Se a mudança precisa de ADR:
1. Copie `docs/adr/0000-template.md` para `docs/adr/NNNN-titulo-kebab.md`, usando o próximo número livre.
2. Status **Proposto**. Adicione a linha no índice `docs/adr/README.md`.
3. **Pare** e solicite revisão humana. Só implemente depois que o status for **Aceito**.
4. Se o ADR substituir outro, marque o antigo como `Substituído por ADR-NNNN`.

No Claude Code: `/new-adr <título>`.

## 3. Implementar

- Commits pequenos e atômicos, em Conventional Commits (STY-005).
- Código, testes e docs da mesma mudança vão no mesmo PR.

## 4. Verificar — Definition of Done

- [ ] Plano seguido. Desvios foram documentados no PR.
- [ ] Nenhum ADR aceito, regra de negócio ou escopo violado.
- [ ] Testes novos ou alterados passam. A suíte completa passa.
- [ ] Evals rodadas, se prompts ou agentes mudaram.
- [ ] Lint e format sem erros.
- [ ] `docs/` atualizado para refletir o novo estado.
- [ ] `scripts/check-governance.sh` passa.

No Claude Code: `/governance-check`.

## 5. Manter a SSOT viva

- Encontrou divergência entre código e docs? **Não escolha um lado em silêncio.** Reporte, e corrija o lado errado com aprovação.
- Encontrou uma regra implícita no código que não está documentada? Proponha a inclusão no documento adequado.
- Revisão periódica (TODO(owner): definir cadência) para podar documentos obsoletos.
