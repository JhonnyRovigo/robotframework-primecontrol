# Estrutura do Projeto de Testes Robot Framework

Este projeto está estruturado para suportar testes automatizados usando Robot Framework com Browser Library.

## Estrutura de Pastas

- `.vscode/`: Configurações do VS Code (ex: arquivos de debug)
- `browser/`: Arquivos gerados pela Browser Library
  - `screenshot/`: Prints dos testes
  - `traces/`: Arquivos de trace do Playwright
- `resources/pages/components/`: Organização por páginas e componentes reutilizáveis
- `resultados/`: Relatórios dos testes (log.html, report.html, etc)
- `tests/`: Casos de teste .robot

Todos os diretórios estão vazios inicialmente, com arquivos `.keep` para manter a estrutura.
