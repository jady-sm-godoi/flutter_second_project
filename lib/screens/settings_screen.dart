import 'package:flutter/material.dart';
import 'package:udemy_recipe/components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(
      {Key? key, required this.onSettingsChanged, required this.settings})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwichet(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwichet(
                    'Sem gluten',
                    'Apenas receitas sem gluten',
                    settings.isGlutenFree,
                    (value) => setState(() {
                          settings.isGlutenFree = value;
                        })),
                _createSwichet(
                    'Vegana',
                    'Apenas receitas veganas',
                    settings.isVegan,
                    (value) => setState(() {
                          settings.isVegan = value;
                        })),
                _createSwichet(
                    'Sem Lactose',
                    'Apenas receitas sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() {
                          settings.isLactoseFree = value;
                        })),
                _createSwichet(
                    'Vegetariana',
                    'Apenas receitas vegetariana',
                    settings.isVegetarian,
                    (value) => setState(() {
                          settings.isVegetarian = value;
                        })),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
