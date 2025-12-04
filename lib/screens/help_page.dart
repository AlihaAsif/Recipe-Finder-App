import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  final List<Map<String, String>> faq = const [
    {
      'question': 'How to create an account?',
      'answer': 'Go to Profile page, enter your email and password, and click Sign Up.'
    },
    {
      'question': 'How to reset password?',
      'answer': 'Click on Forgot Password? in Profile page. You will get instructions.'
    },
    {
      'question': 'How to add recipes to favorites?',
      'answer': 'Open any recipe and tap the heart icon to add it to favorites.'
    },
    {
      'question': 'How to change app theme?',
      'answer': 'Go to Settings page and toggle Dark Mode on/off.'
    },
    {
      'question': 'How to contact support?',
      'answer': 'Send an email to support@recipefinder.com.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & FAQ'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: faq.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ExpansionTile(
              title: Text(
                faq[index]['question']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    faq[index]['answer']!,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
