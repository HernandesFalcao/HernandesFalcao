# Glossário

> Termos do domínio e técnicos com significado específico neste projeto. Código e docs MUST usar estes termos de forma consistente.

| Termo | Definição | Evitar |
|-------|-----------|--------|
| ADR | Architecture Decision Record: registro imutável de uma decisão arquitetural | "decisão" solta em chat/issue |
| Agente | Componente que usa LLM em loop para atingir um objetivo com ferramentas permitidas | "bot", "IA" |
| Orquestrador | Agente que decompõe a tarefa e roteia para outros agentes | "manager", "master" |
| Ferramenta (tool) | Função determinística que um agente pode invocar | "plugin", "skill" (ambíguo) |
| Run | Uma execução completa de uma tarefa, identificada por `run_id` | "job", "sessão" |
| SSOT | Single Source of Truth: este repositório | — |
| TODO(owner): termo de domínio | TODO(owner) | — |
