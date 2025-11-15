import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // use relative import while developing

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget recipeCard(String title, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
          'Recipe Finder App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
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
                    image: AssetImage('assets/foodbanner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Search Bar ---
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipes...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // --- Featured Recipes ---
              const Text(
                'Featured Recipes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 15),

              Column(
                children: [
                  recipeCard('Pasta Primavera', 'assets/pasta.jpg'),
                  recipeCard('Avocado Salad', 'assets/salad.jpg'),
                  recipeCard('Chicken Biryani', 'assets/biryani.jpg'),
                  recipeCard('Special Pizza', 'assets/pizza.jpg'),
                  recipeCard('Chocolate Cake', 'assets/cake.jpg'),
                  recipeCard('Halwa Puri', 'assets/halwapuri.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
