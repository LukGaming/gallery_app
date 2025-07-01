# Changelog

Este arquivo apresentas a alterações feitas no código e documentação do Gallery App.

## 2025/06/30 starting_documentations-01 - por rudsonalves

### Aprimora configurações do projeto e adiciona documentação e diagramas iniciais

Este commit ajusta o `.gitignore`, o `README.md` e as regras de análise do Flutter, garantindo padrões consistentes de formatação e descrição do projeto. Além disso, introduz documentação inicial em markdown, incluindo visão geral, arquitetura MVVM e changelog, bem como diagramas de classes e arquitetura em formatos Draw\.io, PNG e SVG.

### Alterações

* **.gitignore**

  * Adiciona padrão `.$Diag*` para ignorar arquivos de backup gerados pelo Drawio.
  
* **README.md**

  * Substitui descrição genérica por texto em português detalhando o propósito do aplicativo.
  * Remove as seções padrão de “Getting Started” e recursos externos.
  * Inclui links para os documentos de arquitetura (`docs/ARCHITECTURE.md`) e changelog (`docs/CHANGELOG.md`).

* **analysis\_options.yaml**

  * Adiciona configuração de formatter para preservar vírgulas finais (`trailing_commas: preserve`).

### Novos Arquivos

* **docs/1.introducao.md**
  Documentação de introdução, com objetivos, problema atendido, valor ao usuário, stakeholders, fluxos de uso e funcionalidades do MVP.
* **docs/ARCHITECTURE.md**
  Proposta arquitetural MVVM detalhando camadas Data, Domain e UI, padrões de nomenclatura e diagrama ilustrativo.
* **docs/CHANGELOG.md**
  Arquivo inicial de changelog para registro de versões e alterações futuras.
* **docs/images/Diagrama\_de\_Classes.drawio**
  Diagrama de classes em formato Draw\.io, descrevendo entidades Album, Photo e relações.
* **docs/images/mvvm\_architecture.png**
  Imagem PNG do diagrama de arquitetura MVVM para referência rápida.
* **docs/images/mvvm\_architecture.svg**
  Versão vetorial (SVG) do diagrama de arquitetura MVVM.

### Assets e Testes

* Adicionados diagramas em `docs/images/`:

  * `Diagrama_de_Classes.drawio`
  * `mvvm_architecture.png`
  * `mvvm_architecture.svg`

### Conclusão

Alterações concluídas: configurações padronizadas e documentação integrada, projeto pronto para avanços.