import 'package:flutter/material.dart';
import 'package:recipe_finderapp/widgets/app_drawer.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

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
          'Breakfast Recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      drawer: const AppDrawer(), // ✅ Reusable drawer added
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// --- Banner Image ---
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/breakfast_banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Section Title ---
            const Text(
              'Popular Breakfast Recipes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),

            // --- Recipe Cards ---
            recipeCard('Pancakes with Maple Syrup', 'assets/pancake.jpg'),
            recipeCard('Omelette with Veggies', 'assets/omelette.jpg'),
            recipeCard('French Toast Delight', 'assets/frenchtoast.jpg'),
            recipeCard('Healthy Smoothie', 'assets/smoothie.jpg'),
          ],
        ),
      ),
    );


  }
}