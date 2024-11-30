
import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<String> categories = ['Starters', 'Main Course', 'Desserts', 'Beverages'];

  final Map<String, List<Map<String, String>>> menuItems = {
    'Starters': [
      {'name': 'Spring Rolls', 'price': '\$5.99'},
      {'name': 'Garlic Bread', 'price': '\$4.99'},
    ],
    'Main Course': [
      {'name': 'Grilled Chicken', 'price': '\$12.99'},
      {'name': 'Vegetable Pasta', 'price': '\$9.99'},
    ],
    'Desserts': [
      {'name': 'Chocolate Cake', 'price': '\$6.99'},
      {'name': 'Ice Cream Sundae', 'price': '\$4.99'},
    ],
    'Beverages': [
      {'name': 'Fresh Lime Soda', 'price': '\$2.99'},
      {'name': 'Iced Tea', 'price': '\$3.99'},
    ],
  };

   MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final items = menuItems[category]!;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: ExpansionTile(
              title: Text(
                category,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              children: items.map((item) {
                return ListTile(
                  title: Text(item['name']!),
                  trailing: Text(
                    item['price']!,
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
