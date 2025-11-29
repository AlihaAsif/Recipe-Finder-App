import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to Recipe Finder App 🍲',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Discover tasty recipes for breakfast, lunch, and dinner! '
                  'Explore delicious options, save your favorites, and make cooking simple, fun, and inspiring.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // --- Team Section ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Created By',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.green, thickness: 1, indent: 40, endIndent: 40),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      TeamMemberCard(name: 'Aliha', id: 'FA23-BSE-092'),
                      TeamMemberCard(name: 'Ariba', id: 'FA23-BSE-138'),
                      TeamMemberCard(name: 'Fakiha', id: 'FA23-BSE-137'),
                      TeamMemberCard(name: 'Laiba', id: 'FA23-BSE-142'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // --- Illustration ---
            Image.asset(
              'assets/chef.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'Happy Cooking! 👩‍🍳',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom Widget for Team Members ---
class TeamMemberCard extends StatelessWidget {
  final String name;
  final String id;

  const TeamMemberCard({required this.name, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, color: Colors.green),
          const SizedBox(width: 8),
          Text(
            '$name ($id)',
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}