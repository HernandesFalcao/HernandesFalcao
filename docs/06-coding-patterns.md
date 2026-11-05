# Padrões de código

> Padrões **aprovados** e **proibidos**. Para usar um padrão fora desta lista em código estrutural, é preciso um ADR.

## Aprovados

| ID | Padrão | Quando usar | Exemplo / referência |
|----|--------|-------------|----------------------|
| PAT-001 | Ports & Adapters | Toda integração externa (LLM, DB, APIs) | `core` define a porta, `infra` implementa |
| PAT-002 | Injeção de dependência por construtor | Componentes com dependências externas | sem singletons globais |
| PAT-003 | Saída estruturada validada por schema | Toda resposta de LLM consumida por código | validar com schema antes de usar |
| PAT-004 | Result/Either para erros esperados | Falhas de domínio previsíveis | exceções só para falhas inesperadas |
| PAT-005 | Idempotência em ferramentas com efeito colateral | Ferramentas que escrevem ou enviam | chave de idempotência por `run_id` + passo |
| PAT-006 | Retry com backoff exponencial + timeout | Chamadas de rede e LLM | limite de tentativas configurável |

## Proibidos (anti-padrões)

| ID | Anti-padrão | Motivo | Alternativa |
|----|-------------|--------|-------------|
| ANTI-001 | Prompt montado por concatenação espalhada no código | Não versionável, não testável | Templates em `prompts/` (FS-002) |
| ANTI-002 | Parsing de texto livre do LLM com regex | Frágil | PAT-003 |
| ANTI-003 | Agente com acesso irrestrito a ferramentas | Risco de segurança | Allowlist por agente (AG-003) |
| ANTI-004 | Estado global mutável compartilhado entre agentes | Condições de corrida, não rastreável | Mensagens/estado via orquestrador |
| ANTI-005 | Segredos em código ou prompt | Vazamento | Variáveis de ambiente / secret manager |
| ANTI-006 | Mock do LLM em teste de regra de negócio pura | Acoplamento desnecessário | Regras de negócio ficam em `core`, sem LLM |

## Testes

- **TST-001:** Cada `BR-xxx` tem ao menos um teste que o referencia no nome ou na descrição.
- **TST-002:** Testes unitários não fazem chamadas reais a LLM nem à rede.
- **TST-003:** Mudanças em prompts ou no comportamento de agentes rodam a suíte de `evals/` correspondente.
