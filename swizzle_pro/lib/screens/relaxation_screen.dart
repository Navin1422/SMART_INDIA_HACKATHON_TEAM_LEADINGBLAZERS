import 'package:flutter/material.dart';

class RelaxationScreen extends StatelessWidget {
  const RelaxationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Relaxation Space")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.music_note, color: Colors.teal),
              title: const Text("Calming Music"),
              subtitle: const Text("Play soothing audios"),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.video_library, color: Colors.teal),
              title: const Text("Relaxation Videos"),
              subtitle: const Text("Watch peaceful clips"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
