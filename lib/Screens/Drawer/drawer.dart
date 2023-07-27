import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black26,
            ),
            child: Center(
              child: Text('Drawer Header'),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person),
            title: const Text('Drawer Body'),
          ),
        ],
      ),
    );
  }
}
