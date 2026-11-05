# Sistema de agentes (design do produto)

> Este documento rege os **agentes que o projeto constrói**. As regras para os agentes que **desenvolvem**
> o projeto (Claude Code, Codex) estão em `AGENTS.md`.

## Catálogo de agentes

| ID | Agente | Responsabilidade | Ferramentas permitidas | Entrada → Saída | ADR |
|----|--------|------------------|------------------------|-----------------|-----|
| AGT-001 | `orchestrator` | Decompor a tarefa, rotear e consolidar | `dispatch`, `read_state` | Tarefa → Plano + resultado | TODO |
| AGT-002 | TODO(owner) | TODO(owner) | TODO(owner) | TODO(owner) | TODO |

## Regras de design

- **AG-001 — Responsabilidade única:** cada agente tem um objetivo descrito em uma frase. Se não couber, divida o agente.
- **AG-002 — Estrutura:** cada agente vive em `src/agents/<nome>/`, com prompts versionados, uma allowlist de ferramentas e um contrato de I/O.
- **AG-003 — Menor privilégio:** cada agente recebe só as ferramentas listadas no catálogo. Adicionar uma ferramenta exige atualizar este documento e, se for uma ferramenta com efeito colateral, um ADR.
- **AG-004 — Contratos tipados:** a entrada e a saída de cada agente são definidas por schema. Mensagens entre agentes usam o envelope abaixo.
- **AG-005 — Limites:** todo loop de agente tem máximo de passos, timeout e orçamento de tokens configuráveis.
- **AG-006 — Human-in-the-loop:** ações irreversíveis ou externas (pagamentos, envio de e-mail, escrita em produção) exigem aprovação humana explícita.
- **AG-007 — Rastreabilidade:** toda execução tem `run_id`. Cada passo registra agente, ferramenta, tokens, latência e resultado.
- **AG-008 — Avaliação:** todo agente tem uma suíte em `evals/<agente>/`. Uma regressão nas evals bloqueia o merge.
- **AG-009 — Defesa contra prompt injection:** conteúdo vindo de ferramentas ou de usuários é tratado como dado, nunca como instrução. Ele não pode alterar permissões nem objetivos.

## Envelope de mensagem entre agentes

```json
{
  "run_id": "uuid",
  "step": 3,
  "from": "orchestrator",
  "to": "researcher",
  "intent": "task | result | error | handoff",
  "payload": { },
  "schema_version": "1"
}
```

## Prompts

- Ficam em `src/agents/<agente>/prompts/`, versionados no git.
- Uma mudança de prompt é uma mudança de código: passa por PR e evals (TST-003).
- O prompt de sistema referencia as regras de negócio aplicáveis pelo ID, em vez de copiar o texto delas.
