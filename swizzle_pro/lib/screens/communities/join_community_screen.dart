import 'package:flutter/material.dart';

class JoinCommunityScreen extends StatelessWidget {
  const JoinCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> suggestions = [
      "Yoga & Mindfulness",
      "Positive Thinking",
      "Students Support",
      "Healing Through Art",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Join Community")),
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(Icons.group_add, color: Colors.teal),
            title: Text(suggestions[index]),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Requested to join ${suggestions[index]}")),
                );
              },
              child: const Text("Join"),
            ),
          ),
        ),
      ),
    );
  }
}
