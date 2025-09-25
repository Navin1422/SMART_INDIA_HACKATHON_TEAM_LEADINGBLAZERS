import 'package:flutter/material.dart';

class RemoveFriendScreen extends StatelessWidget {
  const RemoveFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> friends = ["Alice", "Bob", "Charlie"];

    return Scaffold(
      appBar: AppBar(title: const Text("Remove Friend")),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(friends[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${friends[index]} removed")),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
