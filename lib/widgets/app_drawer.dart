import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green.shade700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: const AssetImage('assets/logo.jpg'),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Recipe Finder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.green),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.green),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.green),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           // --- Drawer Header ---
//           DrawerHeader(
//             decoration: BoxDecoration(color: Colors.green.shade700),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 35,
//                   backgroundImage: const AssetImage('assets/logo.jpg'),
//                   backgroundColor: Colors.white,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Recipe Finder',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // --- Drawer Items ---
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.home, color: Colors.green),
//                   title: const Text('Home'),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/home');
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.person, color: Colors.green),
//                   title: const Text('Profile'),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/profile');
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.favorite, color: Colors.green),
//                   title: const Text('Favorites'),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/favorites');
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.info, color: Colors.green),
//                   title: const Text('About'),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/about');
//                   },
//                 ),
//               ],
//             ),
//           ),
//
//           // --- Floating-style button at bottom ---
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: FloatingActionButton.extended(
//               backgroundColor: Colors.green.shade700,
//               icon: const Icon(Icons.add, color: Colors.white),
//               label: const Text(
//                 'Add Recipe',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Add Recipe button pressed!'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }