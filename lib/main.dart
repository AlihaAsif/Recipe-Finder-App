import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_page.dart';
import 'screens/breakfast_page.dart';
import 'screens/lunch_page.dart';
import 'screens/dinner_page.dart';
import 'screens/profile_page.dart';
import 'screens/favorites_page.dart';
import 'screens/about_page.dart';
import 'screens/settings_page.dart'; // 🔹 Settings page
import 'screens/help_page.dart'; // 🔹 Help page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Load Dark Mode setting
  final prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('darkMode') ?? false;

  runApp(RecipeFinderApp(isDarkMode: isDarkMode));
}

class RecipeFinderApp extends StatefulWidget {
  final bool isDarkMode;
  const RecipeFinderApp({required this.isDarkMode, super.key});

  @override
  State<RecipeFinderApp> createState() => _RecipeFinderAppState();
}

class _RecipeFinderAppState extends State<RecipeFinderApp> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  // 🔹 Callback for SettingsPage to toggle Dark Mode
  void toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = value;
    });
    await prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routes: {
        '/home': (context) => const MainScaffold(),
        '/profile': (context) => const ProfilePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/about': (context) => const AboutPage(),
        '/settings': (context) => SettingsPage(
          isDarkMode: isDarkMode,
          onThemeChanged: toggleTheme,
        ),
        '/help': (context) => const HelpPage(),
      },
      home: const ProfilePage(),
    );
  }
}

// 🔹 Main Scaffold with Bottom Navigation Bar
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    BreakfastPage(),
    LunchPage(),
    DinnerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: 'Breakfast'),
          BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: 'Lunch'),
          BottomNavigationBarItem(icon: Icon(Icons.dinner_dining), label: 'Dinner'),
        ],
      ),
    );
  }
}
