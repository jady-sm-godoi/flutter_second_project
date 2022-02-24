import 'package:flutter/material.dart';
import 'package:udemy_recipe/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal meal) toggleFavorite;
  final bool Function(Meal meal) isFavorite;

  const MealDetailScreen(
      {Key? key, required this.toggleFavorite, required this.isFavorite})
      : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(child) {
    return Container(
        width: 350,
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients!.length,
                  itemBuilder: (item, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients![index]),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  }),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(ListView.builder(
              itemCount: meal.steps?.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text(meal.steps![index]),
                    ),
                    const Divider()
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isFavorite(meal)
            ? Theme.of(context).colorScheme.secondary
            : Colors.amber.shade200,
        child: Icon(
            isFavorite(meal) ? Icons.favorite : Icons.favorite_border_outlined),
        onPressed: () => toggleFavorite(meal),
      ),
    );
  }
}
