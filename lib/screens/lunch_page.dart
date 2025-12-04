import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';
import 'recipe_details_page.dart';

class LunchPage extends StatefulWidget {
  const LunchPage({super.key});

  @override
  State<LunchPage> createState() => _LunchPageState();
}

class _LunchPageState extends State<LunchPage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      final recipes = await RecipeService.getRecipesByCategory('lunch');
      setState(() {
        _recipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget recipeCard(Recipe recipe) {
    return _AnimatedRecipeCard(
      recipe: recipe,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsPage(recipe: recipe),
          ),
        );
      },
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _RecipeSearchDelegate(_recipes),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
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
            ..._recipes.map((recipe) => recipeCard(recipe)),
          ],
        ),
      ),
    );
  }
}

// ---------------- Animated Recipe Card ----------------
class _AnimatedRecipeCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const _AnimatedRecipeCard({required this.recipe, required this.onTap});

  @override
  State<_AnimatedRecipeCard> createState() => _AnimatedRecipeCardState();
}

class _AnimatedRecipeCardState extends State<_AnimatedRecipeCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.97),
      onTapUp: (_) {
        setState(() => _scale = 1.0);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Card(
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
                    image: AssetImage(widget.recipe.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.recipe.title,
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
        ),
      ),
    );
  }
}

// ---------------- Multi-Ingredient Search Delegate ----------------
class _RecipeSearchDelegate extends SearchDelegate {
  final List<Recipe> recipes;

  _RecipeSearchDelegate(this.recipes);

  @override
  List<Widget> buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) {
    final queryIngredients = query
        .toLowerCase()
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final results = recipes.where((recipe) {
      final recipeIngredients = recipe.ingredients.map((e) => e.toLowerCase()).toList();
      // Match recipes that contain ALL ingredients
      return queryIngredients.every((ingredient) => recipeIngredients.contains(ingredient));
    }).toList();

    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final queryIngredients = query
        .toLowerCase()
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final results = recipes.where((recipe) {
      final recipeIngredients = recipe.ingredients.map((e) => e.toLowerCase()).toList();
      // Show recipes that contain ANY ingredient as suggestions
      return queryIngredients.any((ingredient) => recipeIngredients.contains(ingredient));
    }).toList();

    return _buildSearchResults(results);
  }

  Widget _buildSearchResults(List<Recipe> results) => ListView.builder(
    itemCount: results.length,
    itemBuilder: (context, index) {
      final recipe = results[index];
      return ListTile(
        leading: Image.asset(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(recipe.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailsPage(recipe: recipe),
            ),
          );
        },
      );
    },
  );
}
