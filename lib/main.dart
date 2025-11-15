import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/breakfast_page.dart';
import 'screens/lunch_page.dart';
import 'screens/dinner_page.dart';
import 'screens/profile_page.dart';
import 'screens/favorites_page.dart';
import 'screens/about_page.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Finder App',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
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
            BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: 'Breakfast'),
            BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: 'Lunch'),
            BottomNavigationBarItem(icon: Icon(Icons.dinner_dining), label: 'Dinner'),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'screens/home_page.dart';
// import 'screens/breakfast_page.dart';
// import 'screens/lunch_page.dart';
// import 'screens/dinner_page.dart';
// import 'screens/profile_page.dart';
// import 'screens/favorites_page.dart';
// import 'screens/about_page.dart';
//
// void main() {
//   runApp(const RecipeFinderApp());
// }
//
// class RecipeFinderApp extends StatefulWidget {
//   const RecipeFinderApp({super.key});
//
//   @override
//   State<RecipeFinderApp> createState() => _RecipeFinderAppState();
// }
//
// class _RecipeFinderAppState extends State<RecipeFinderApp> {
//   int _selectedIndex = 0;
//
//   // --- List of pages for bottom navigation ---
//   final List<Widget> _pages = [
//     const HomePage(),
//     const BreakfastPage(),
//     const LunchPage(),
//     const DinnerPage(),
//   ];
//
//   // --- Function to handle navigation tap ---
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Recipe Finder App',
//       theme: ThemeData(primarySwatch: Colors.green),
//       routes: {
//         '/profile': (context) => const ProfilePage(),
//         '/favorites': (context) => const FavoritesPage(),
//         '/about': (context) => const AboutPage(),
//       },
//       home: Scaffold(
//         // --- Page content changes based on selected index ---
//         body: _pages[_selectedIndex],
//
//         // 🌟 Floating Action Button added here
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.green.shade700,
//           child: const Icon(Icons.add, color: Colors.white),
//           onPressed: () {
//             // Action when the FAB is pressed
//             // You can navigate to "Add Recipe" page or show a message
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Floating Action Button Pressed!'),
//               ),
//             );
//           },
//         ),
//
//         // Optional: Control position of FAB
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//
//         // --- Bottom Navigation Bar ---
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.green.shade700,
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,
//           onTap: _onItemTapped,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: 'Breakfast'),
//             BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: 'Lunch'),
//             BottomNavigationBarItem(icon: Icon(Icons.dinner_dining), label: 'Dinner'),
//           ],
//         ),
//       ),
//     );
//   }
// }