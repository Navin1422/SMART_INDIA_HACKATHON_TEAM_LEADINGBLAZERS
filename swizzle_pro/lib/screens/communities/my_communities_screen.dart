import 'package:flutter/material.dart';

class MyCommunitiesScreen extends StatelessWidget {
  const MyCommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Communities")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.group, color: Colors.teal),
            title: const Text("Mental Health Warriors"),
            subtitle: const Text("A supportive community"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.teal),
            title: const Text("Mindfulness Circle"),
            subtitle: const Text("Daily meditation sessions"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
