import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesService {
  static final _firestore = FirebaseFirestore.instance;

// 🔑 Get current logged-in user's UID
  static String _userId() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");  // Ensure user is logged in
    }
    return user.uid;
  }

// 🔹 Reference to user's favorites collection
  static CollectionReference<Map<String, dynamic>> _favoritesCollection() {
    return _firestore
        .collection('users')
        .doc(_userId())
        .collection('favorites');
  }

  /// ADD recipe to favorites
  static Future<void> addToFavorites(Recipe recipe) async {
    await _favoritesCollection().doc(recipe.id).set(recipe.toJson());
  }

  /// REMOVE recipe from favorites
  static Future<void> removeFromFavorites(String recipeId) async {
    await _favoritesCollection().doc(recipeId).delete();
  }

  /// GET all favorite recipes
  static Future<List<Recipe>> getFavorites() async {
    final snap = await _favoritesCollection().get();
    return snap.docs.map((doc) => Recipe.fromJson(doc.data())).toList();
  }

  /// CHECK if a recipe is favorite
  static Future<bool> isFavorite(String recipeId) async {
    final doc = await _favoritesCollection().doc(recipeId).get();
    return doc.exists;
  }
}