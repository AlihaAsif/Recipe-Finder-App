import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/home_page.dart';
import 'screens/breakfast_page.dart';
import 'screens/lunch_page.dart';
import 'screens/dinner_page.dart';
import 'screens/profile_page.dart';
import 'screens/favorites_page.dart';
import 'screens/about_page.dart';
// import 'firebase_options.dart'; // Uncomment if using FlutterFire CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RecipeFinderApp());
}

class RecipeFinderApp extends StatefulWidget {
  const RecipeFinderApp({super.key});

  @override
  State<RecipeFinderApp> createState() => _RecipeFinderAppState();
}

class _RecipeFinderAppState extends State<RecipeFinderApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BreakfastPage(),
    const LunchPage(),
    const DinnerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// 🔹 Auto sign-in with email for development
  Future<void> _signInWithEmail() async {
    final auth = FirebaseAuth.instance;
    try {
// Replace with your test email/password or implement sign-up UI
      await auth.signInWithEmailAndPassword(
          email: "[test@example.com](mailto:test@example.com)", password: "123456");
    } catch (e) {
// If user not found, create account
      await auth.createUserWithEmailAndPassword(
          email: "[test@example.com](mailto:test@example.com)", password: "123456");
    }
  }

  @override
  void initState() {
    super.initState();
    _signInWithEmail(); // auto login with email
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder App',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/about': (context) => const AboutPage(),
      },
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.free_breakfast), label: 'Breakfast'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lunch_dining), label: 'Lunch'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dinner_dining), label: 'Dinner'),
          ],
        ),
      ),
    );
  }
}