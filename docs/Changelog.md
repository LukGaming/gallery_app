# Changelog

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