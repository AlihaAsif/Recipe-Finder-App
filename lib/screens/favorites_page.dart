import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  // ✅ Function to build one horizontal recipe card
  Widget recipeCard(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          // --- Left side: Recipe Image ---
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

          // --- Right side: Text & Icon ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Delicious and easy to make!',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // --- Favorite Icon ---
          const Icon(Icons.favorite, color: Colors.red),
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
          'Your Favorite Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Only Recipe Cards ---
            recipeCard('Pancakes', 'assets/pancake.jpg'),
            recipeCard('Biryani', 'assets/biryani.jpg'),
            recipeCard('Salad Bowl', 'assets/caesarsalad.jpg'),
          ],
        ),
      ),
    );
  }
}