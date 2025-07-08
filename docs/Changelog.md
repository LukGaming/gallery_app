# Changelog

## 2025/07/08 album_form - rudsonalves

### Criação do fluxo de criação de álbuns e ajustes estruturais na aplicação

Este commit implementa o fluxo de criação de álbuns com formulário validável e integração direta à lista de álbuns da `HomePage`. Foram adicionados widgets reutilizáveis, ajustes visuais e melhorias de organização de arquivos. Também foi adicionado suporte à formatação de datas com o pacote `intl` e um diagrama de classes para documentação.

### Modificações

* **analysis\_options.yaml**

  * Adiciona a opção `trailing_commas: preserve` ao formatter para manter vírgulas finais.

* **lib/domain/models/album\_model.dart**

  * Adiciona os campos `numberOfPhotos` e `titlePhoto`.
  * Define valores padrão para `favorite` e `numberOfPhotos`.

* **lib/main.dart**

  * Inicializa a formatação de datas em `pt_BR` com o pacote `intl`.

* **lib/views/album\_form/album\_form.dart**

  * Implementa um formulário com validação para criação de álbuns.

* **lib/views/albums/albums\_page.dart**

  * Troca o uso do widget `AlbumCard` antigo para o novo `AlbumCard` com dados dinâmicos da lista de álbuns.

* **lib/views/photos/photos\_grid\_view\.dart**

  * Atualiza o widget para usar o novo `AlbumCard` com dados mockados.

* **lib/views/home\_page/home\_page.dart**

  * Define a lista global de álbuns e adiciona o botão flutuante que chama o formulário de criação.
  * Atualiza o ícone da aba de navegação inferior.
  * Implementa o método `newAlbum()` para adicionar álbuns dinamicamente.

* **lib/views/home\_page/photo\_album\_widget.dart → lib/views/albuns\_view/albums\_view\.dart**

  * Renomeia o arquivo e o widget de `AlbumCard` para `PhotoAlbumCard`.
  * Refatora o layout mantendo estilo semelhante ao antigo.

### Arquivos Novos

* **lib/views/home\_page/album\_card.dart**

  * Novo widget `AlbumCard` que recebe instância de `AlbumModel` e exibe título, quantidade de fotos e data formatada.

* **lib/views/albuns\_view/top\_menu.dart**

  * Novo widget `TopMenu` com layout superior da página de álbuns contendo ícones de ação e título.

### Ativos

* **docs/images/.\$Diagrama\_de\_Classes.drawio.bkp**

  * Arquivo de backup contendo o diagrama de classes do domínio do projeto, incluindo os modelos `Album`, `Photo` e relacionamentos com `ViewModel` e `Repository`.

### Conclusão

O sistema agora conta com um fluxo funcional de criação de álbuns, melhorias visuais e maior organização estrutural no código. Tudo está funcional e pronto para os próximos passos.