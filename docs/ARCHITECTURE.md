# Proposta Arquitetural

O projeto vai ser desenvolvido com a arquitetura proposta pelo time do Flutter MVVM, em três camadas básicas:

- **Data Layer**: camada para os *repositories* e *services*. 
    - o *repository* é a fonte de verdade (*source of truth*) de dados, mantendo o cache e podendo ser reativo para mudanças nos dados armazenados. 
    - O *service* implementa uma abstração sobre tecnologia da base de dados.
- **Domain Layer**: camada para os *models* e *user-cases*.
    - Os *models* representam os dados que serão armazenados no banco de dados.
    - Os *user-cases* são implementados para:
        - regras de negócio complexas
        - acesso a mais de um *repository*
        - quando um *repository* precisa ser acessados por diversas uis, a fim de evitar duplicação de código.
- **UI Layer**: camada para as *views* e *view-models*.
    - As *views* representam as telas da aplicação.
    - Os *view-models* implementam a lógica de negócio das *views*, conectando as *views* aos *repositories*, ou aos *user-cases* nos casos declarados acima.

    ![MVVM](https://docs.flutter.dev/assets/images/docs/app-architecture/guide/feature-architecture-simplified-with-logic-layer.png)


# Nomes de Arquivos

Os arquivos de classes de domínio, de repositório e de servico devem ser nomeados seguido o padrão snake_case.

Nomes de classes de UI devem ser nomeados seguido o padrão CamelUpCase, funções e variáveis devem ser nomeadas seguido o padrão camelUpCase.