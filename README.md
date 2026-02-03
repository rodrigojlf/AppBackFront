## AppBackFront 🚀
Este projeto foi desenvolvido como parte da formação técnica na BackFront Academy, focado no aprendizado prático de desenvolvimento iOS avançado. O AppBackFront é um ecossistema de NFTs que permite aos usuários explorar coleções, monitorar cotações de criptomoedas e gerenciar carteiras digitais.

## 🛠 Tecnologias e Frameworks
O projeto utiliza as seguintes bibliotecas e ferramentas:
- Firebase/Auth: Gerenciamento de autenticação de usuários.
- Alamofire: Realização de requisições de rede HTTP.
- AlamofireImage: Download e cache de imagens de forma otimizada.
- UIKit: Desenvolvimento da interface de usuário.
- CocoaPods: Gerenciador de dependências do projeto.

## 🏛 Arquitetura e Organização
O app foi desenvolvido utilizando o padrão de arquitetura MVVM (Model-View-ViewModel) combinado com View Code, garantindo um código modular, testável e de fácil manutenção.
- View: Implementada de forma programática (View Code), separando a lógica de layout (LoginScreen, HomeScreen) da lógica de controle (LoginVC, HomeVC).
- ViewModel: Responsável por processar a lógica de negócios, como filtragem de NFTs e manipulação de dados para a UI.
- Service: Camada dedicada a requisições de dados, tanto locais (JSON) quanto remotas (API).
- Protocols: Utilizados para comunicação entre as camadas e delegates de interface.

## ✨ Funcionalidades Principais
Autenticação: Sistema de login integrado ao Firebase com validação de campos em tempo real.
Exploração de NFTs: Listagem dinâmica de NFTs com suporte a filtros por categorias.
Busca: Filtro de pesquisa para localizar usuários ou itens específicos na coleção.
TabBar Navigation: Navegação centralizada entre Home, Carteira (Wallet) e Perfil.
Gestão de Estado: Tratamento de sucessos e erros em requisições assíncronas.

## 📂 Estrutura do Projeto
```plaintext
AppBackFront/
├── Features/             # Módulos do app (Login, Home, Profile, etc)
│   ├── Cells/            # Células customizadas de TableView e CollectionView
│   └── ...               # VCs, Screens e ViewModels por funcionalidade
├── Service/              # Camada de rede e serviços genéricos
├── Model/                # Modelos de dados (NFTData, WalletData)
├── TabBarController/     # Configuração da navegação principal
├── Utils/                # Extensões e utilitários
└── Alert/                # Controlador central de alertas
```

## 🚀 Como Executar o Projeto
Clone o repositório.
Certifique-se de ter o CocoaPods instalado.
No terminal, navegue até a pasta do projeto e execute:
```Bash
pod install
```
Abra o arquivo `AppBackFront.xcworkspace` no Xcode.
Execute o app em um simulador ou dispositivo real (iOS 13.0+ recomendado).

## 🔐 Configuração do Firebase (Necessário para Execução)
Para que o projeto funcione corretamente com as funcionalidades de autenticação, é necessário configurar o seu próprio projeto no Firebase:
- Acesse o Firebase Console.
- Crie um novo projeto e adicione um app iOS com o Bundle ID com.rodrigojlf.AppBackFront.
- Faça o download do arquivo GoogleService-Info.plist.
- Mova o arquivo baixado para a pasta AppBackFront/ dentro do projeto no Xcode.
- Certifique-se de habilitar o método de autenticação E-mail/Senha no console do Firebase.
