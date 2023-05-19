# world_cup_app

Esse projeto tem como base aplicações de conhecimentos de Dart e Flutter:
- Lista de seleções carregada dinamicamente em um ListView baseado em um repositório estático;
- Selecionando itens da lista com evento de onLongPress;
- Alterando texto da AppBar com a quantidade de itens selecionados;
- Mostrando FloatingActionButton para favoritar ao selecionar os itens da lista;
- Passando informações do item da lista para uma outra Page ao clicar;
- Estilo de texto (Widget) personalizado; 
- Navegação com PageView usando BottomNavigationBar ou NavigationBar, as duas opções estão personalizadas (Widget) podendo ser alternadas via código (Verificar home_page.dart) o que possibilitaria por exemplo TESTES AB;

```dart
// Use CustomBottomNavigationBar or CustomNavigationBar
bottomNavigationBar: CustomBottomNavigationBar(
    selectedIndex: currentPage,
    onDestinationSelected: (int page) {
        pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        );
    },
    ),
});
```

- Uso do Provider para gerenciar o estado da lista de seleções ao favoritar algum item da mesma;
- Mudança de tema do aplicativo (Dark, Light ou o padrão do celular);
