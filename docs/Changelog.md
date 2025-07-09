# Changelog

## 2025/07/09 album_form-04 - rudsonalves

### Adicionar mocks de dados, botões de diálogo com ícones e refatorar views de álbuns e fotos

Esta alteração introduz uma fonte única de dados fictícios (`lists_mock.dart`), simplifica a criação de álbuns e fotos com um componente de botão de diálogo que exibe ícones e texto, além de reorganizar e renomear as views de álbuns e fotos para refletir melhor sua função no projeto.

### Modificações

* **lib/views/album\_form/album\_form.dart**

  * Importa `IconDialogButton` em vez do `ElevatedButton` padrão.
  * Substitui botões de ação por `IconDialogButton` com `iconData` e `text` configuráveis para "Salvar" e "Fechar".

* **lib/views/home\_page/albums\_grid/albums\_grid\_view\.dart** (renomeado de `views/albums/albums_page.dart`)

  * Atualiza import para `gallery_app/data/lists_mock.dart`.
  * Renomeia classe de `AlbumList` para `AlbumGridView` e seus estados correspondentes.
  * Remove dependência de `home_page.dart` antiga.

* **lib/views/home\_page/home\_page.dart**

  * Remove definição inline de listas de álbuns.
  * Importa `lists_mock.dart` para fornecer dados.
  * Torna `currentIndex` privado (`_currentIndex`) e ajusta chamadas de métodos e labels.
  * Atualiza chamadas para `AlbumGridView` e `PhotosGridView`.
  * Refatora métodos de ação flutuante para `_processFloatActionButton`, `_newAlbum` e `_addNewPhoto`.

* **lib/views/home\_page/photos\_grid/photos\_grid\_view\.dart** (renomeado de `views/photos/photos_grid_view.dart`)

  * Importa `lists_mock.dart` e usa `photos.length` em `itemCount`.
  * Substitui `AlbumCard` por `PhotoCard`, passando `photos[index]`.

* **lib/views/photo\_form/photo\_form.dart**

  * Importa `PhotoModel` e `IconDialogButton`.
  * Adiciona `TextEditingController _titleController` e sobrescreve `dispose()`.
  * Inclui `TextFormField` para título com validação.
  * Substitui botões por `IconDialogButton` e implementa `_savePhoto()` para retornar um `PhotoModel` criado.

* **lib/views/widgets/photo\_card.dart** (renomeado de `views/home_page/album_card.dart`)

  * Altera `AlbumCard` para `PhotoCard`, usando `PhotoModel`.
  * Ajusta exibição de título e data usando `photo.title` e `photo.createdAt`.

### Arquivos Novos

* **lib/data/lists\_mock.dart**: fornece listas fictícias de `AlbumModel` e `PhotoModel`.
* **lib/views/widgets/icon\_dialog\_button.dart**: componente `IconDialogButton` que combina ícone e texto para ações em dialogs.

### Conclusão

As alterações estão completas e o sistema de visualização e criação de álbuns e fotos com dados fictícios e botões de diálogo está funcional.


## 2025/07/09 album_form-03 - rudsonalves

### Refatora widgets de álbum e formulário de foto, ajusta imports

Este commit reorganiza e refatora os componentes de exibição de álbuns e o formulário de fotos, movendo-os para pastas adequadas, renomeando classes para maior clareza e atualizando todos os imports correspondentes.

### Modificações

* **lib/views/albums/album\_card.dart**

  * Remoção completa do arquivo de cartão de álbum obsoleto na pasta `views/albums`.
* **lib/views/albums/albums\_page.dart**

  * Atualizado import de `views/home_page/album_card.dart` para `views/widgets/album_card.dart`.
* **lib/views/home\_page/home\_page.dart**

  * Atualizado import de `views/home_page/top_menu.dart` para `views/widgets/top_menu.dart`.
  * Atualizado import de `views/widgets/photo_picker.dart` para `views/photo_form/photo_form.dart`.
  * No diálogo de adicionar foto, substituído `PhotoPicker` por `PhotoForm`.
* **lib/views/home\_page/top\_menu.dart**

  * Remoção completa do componente `TopMenu` da pasta `views/home_page`.
* **lib/views/widgets/photo\_picker.dart → lib/views/photo\_form/photo\_form.dart**

  * Renomeado e movido: classe `PhotoPicker` agora `PhotoForm`, com atualização de state para `_PhotoFormState` e reposicionamento em `views/photo_form`.
* **lib/views/photos/photos\_grid\_view\.dart**

  * Atualizado import de `views/home_page/album_card.dart` para `views/widgets/album_card.dart`.
* **lib/views/widgets/photo\_album\_card.dart → lib/views/widgets/album\_card.dart**

  * Renomeado arquivo e classe para `AlbumCard`.
  * Classe agora recebe `AlbumModel album` como parâmetro obrigatório.
  * Adicionados imports de `AlbumModel` e de `intl` (`DateFormat`) para formatação de data.
  * Layout ajustado de `Row` para `Column`, exibindo título, quantidade de fotos e data formatada dinamicamente.

### Conclusão

Alterações concluídas e sistema funcional.


## 2025/07/08 album_form-01 - rudsonalves

### Adição de recurso de seleção de imagem e melhorias na estrutura do app

Este commit implementa a funcionalidade de seleção de imagem usando o plugin `image_picker`, permitindo ao usuário adicionar novas fotos à galeria. Também foram realizadas melhorias visuais e ajustes técnicos, como ocultar o banner de debug, atualizar o NDK e ajustar o layout do formulário de álbum.

### Modificações

* **android/app/build.gradle.kts**

  * Comentada a linha `ndkVersion = flutter.ndkVersion` e adicionada a versão fixa do NDK: `"27.0.12077973"`.

* **android/app/src/main/AndroidManifest.xml**

  * Adicionada permissão de uso da câmera (`android.permission.CAMERA`).

* **lib/domain/models/photo\_model.dart**

  * Campo `title` do `PhotoModel` tornou-se opcional (`String?`).

* **lib/my\_app.dart**

  * Desativado o `debugShowCheckedModeBanner`.

* **lib/views/album\_form/album\_form.dart**

  * Substituído `IntrinsicWidth` por `SizedBox` com largura fixa de 300.
  * Reduzido o `padding` de 16.0 para 8.0.

* **lib/views/home\_page/home\_page.dart**

  * Importado `photo_model.dart` e `photo_picker.dart`.
  * Substituída a função do `FloatingActionButton` para acionar ações distintas dependendo da aba ativa (criar álbum ou adicionar foto).
  * Adicionada função `addNewPhoto` para capturar nova imagem com a ajuda de `PhotoPicker`.

* **lib/views/albuns\_view/albums\_view\.dart → lib/views/widgets/photo\_album\_card.dart**

  * Arquivo renomeado para refletir seu conteúdo de forma mais clara.

* **lib/views/albuns\_view/top\_menu.dart → lib/views/widgets/top\_menu.dart**

  * Arquivo renomeado para melhor organização.

* **linux/flutter/generated\_plugin\_registrant.cc**

  * Registro do plugin `file_selector_linux`.

* **linux/flutter/generated\_plugins.cmake**

  * Inclusão do plugin `file_selector_linux` na lista de plugins.

* **pubspec.lock**

  * Inclusos diversos pacotes relacionados ao `image_picker`, `file_selector` e dependências transitivas.

* **pubspec.yaml**

  * Adicionado `image_picker` como dependência.

* **windows/flutter/generated\_plugin\_registrant.cc**

  * Registro do plugin `file_selector_windows`.

* **windows/flutter/generated\_plugins.cmake**

  * Inclusão do plugin `file_selector_windows` na lista de plugins.

### Arquivos Novos

* **lib/views/widgets/photo\_picker.dart**

  * Componente visual `PhotoPicker` que permite selecionar imagem da galeria ou capturar com a câmera. Retorna a imagem selecionada ao componente pai.

### Conclusão

As alterações introduzem a funcionalidade de captura e seleção de imagem ao app, além de refatorar trechos para melhorar a experiência do usuário e a organização do código. O sistema está funcional e pronto para novos testes.


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