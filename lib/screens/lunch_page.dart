import 'package:flutter/material.dart';
import 'package:recipe_finderapp/widgets/app_drawer.dart';

class LunchPage extends StatelessWidget {
  const LunchPage({super.key});

  Widget recipeCard(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.green),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FFF5),
      appBar: AppBar(
        title: const Text(
          'Lunch Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      drawer: const AppDrawer(), // ✅ Drawer added
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/lunchbanner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Lunch Recipes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),
            recipeCard('Grilled Chicken with Rice', 'assets/chickenrice.jpg'),
            recipeCard('Veggie Wrap', 'assets/vegie_wrap.jpg'),
            recipeCard('Spaghetti Bolognese', 'assets/spaghetti.jpg'),
            recipeCard('Caesar Salad', 'assets/caesarsalad.jpg'),
          ],
        ),
      ),
    );
  }
}