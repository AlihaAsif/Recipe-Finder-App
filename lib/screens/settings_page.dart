import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;
  const SettingsPage({required this.onThemeChanged, required this.isDarkMode, super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (val) {
              setState(() {
                isDarkMode = val;
              });
              widget.onThemeChanged(val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Dark Mode ${val ? "Enabled" : "Disabled"}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            secondary: const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
