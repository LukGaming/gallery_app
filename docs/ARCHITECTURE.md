# Proposta Arquitetural (MVC)

O projeto adotará o padrão **Model–View–Controller**, distribuído em três camadas:

### 1. Model Layer

* **Domain Models**: classes que representam a estrutura de dados da aplicação (entidades, value objects).
* **Repositories & Services**:
  * *Repository*: fonte de verdade (*source of truth*) — faz cache, expõe métodos para CRUD e pode notificar sobre mudanças.
  * *Service*: abstração sobre a tecnologia de acesso a dados (SQLite, Supabase, Parse etc.), usada pelos repositories.

#### Responsabilidade

* Garantir integridade e consistência dos dados.
* Encapsular toda lógica de persistência.

### 2. View Layer

* Widgets, screens, componentes visuais.
* Layouts, animações e estilos (tema, dimensões, cores).

#### Responsabilidade

* Renderizar a interface.
* Receber interações do usuário (toques, gestos, inputs).
* Expor callbacks para o Controller.

### 3. Controller Layer

* Classes que ligam View ↔ Model (por exemplo, `UserController`, `LoginController`).
* Lógica de navegação, validações, transformação de dados (DTOs ⇄ Models).
* Orquestração de chamadas a múltiplos repositories ou services.

#### Responsabilidade

* Receber eventos da View, executar regras de negócio (pode delegar a *use cases* internos),
* Atualizar Models e notificar a View sobre mudanças (via streams, ChangeNotifier, ValueNotifier etc.).

```text
src/
 ├── controllers/      # lida com eventos da UI e coordena Models
 ├── models/           # classes de domínio e DTOs
 ├── services/         # abstrações de banco, chamadas HTTP etc.
 └── views/            # widgets e telas
```

# Convenções de Nomes

Os arquivos de classes de domínio, de repositório e de servico devem ser nomeados seguido o padrão snake_case:

* `user_model.dart`
* `login_controller.dart`
* `product_repository.dart`
* `user_model.dart`
* `login_controller.dart`
* `product_repository.dart`

Nomes de classes de UI devem ser nomeados seguido o padrão CamelUpCase (PascalCase), funções e variáveis devem ser nomeadas seguido o padrão camelUpCase.

* **Classes:**
    * `UserModel`
    * `LoginController`
    * `ProductRepository`
* **Funções e variáveis:**
    * `fetchAllUsers()`
    * `final userController`
