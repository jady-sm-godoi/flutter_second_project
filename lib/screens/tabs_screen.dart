import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedScreenIndex = 0;

  final List<String> _titles = ['Lista de Categorias', 'Meus favoritos'];

  final List<Widget> _screens = const [
    CategoriesScreen(),
    FavoriteScreen(),
  ];

  _selectIndex(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titles[selectedScreenIndex]),
      ),
      body: _screens[selectedScreenIndex],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
