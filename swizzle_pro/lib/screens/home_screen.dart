import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'story_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ✅ Dummy stories
  final List<Map<String, String>> stories = [
    {"name": "Alice", "quote": "Believe in yourself, you are unstoppable."},
    {"name": "Bob", "quote": "Every day is a fresh start."},
    {"name": "Charlie", "quote": "Happiness comes from inner peace."},
    {"name": "David", "quote": "Stay strong, brighter days are ahead."},
  ];

  // ✅ Dummy posts
  final List<Map<String, String>> posts = [
    {
      "name": "Alice",
      "image": "https://picsum.photos/400/200?random=1",
      "caption": "Keep moving forward, one step at a time."
    },
    {
      "name": "Bob",
      "image": "https://picsum.photos/400/200?random=2",
      "caption": "Focus on progress, not perfection."
    },
    {
      "name": "Charlie",
      "image": "https://picsum.photos/400/200?random=3",
      "caption": "Spread kindness wherever you go."
    },
  ];

  // ✅ Like states
  final Map<int, bool> likedPosts = {};

  // ✅ Dummy friends for sharing
  final List<String> friends = ["Alice", "Bob", "Charlie", "David", "Eva"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swizzle AI Home"),
      ),
      drawer: const AppDrawer(), // 👈 Drawer for Communities & Friends
      body: Column(
        children: [
          // 🔥 Stories Section
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                final color = Colors.primaries[index % Colors.primaries.length];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryScreen(
                          name: story["name"]!,
                          quote: story["quote"]!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 90,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: color,
                          child: Text(
                            story["name"]![0], // First letter
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          story["name"]!,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 🔥 Feed Section
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final isLiked = likedPosts[index] ?? false;

                return Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          post["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // Post image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          post["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),

                      // Post caption
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          post["caption"]!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),

                      // Like & Share
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                likedPosts[index] = !isLiked;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.teal),
                            onPressed: () {
                              _showShareOptions(context, post["name"]!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 Share Options Bottom Sheet
  void _showShareOptions(BuildContext context, String postOwner) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Share with a friend",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...friends.map(
            (friend) => ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: Text(friend),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Shared $postOwner's post with $friend"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
