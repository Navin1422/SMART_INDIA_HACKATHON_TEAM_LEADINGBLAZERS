import 'package:flutter/material.dart';

class MyFriendsScreen extends StatelessWidget {
  const MyFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> friends = ["Alice", "Bob", "Charlie", "David"];

    return Scaffold(
      appBar: AppBar(title: const Text("My Friends")),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(friends[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Viewing ${friends[index]}'s profile")),
            );
          },
        ),
      ),
    );
  }
}
