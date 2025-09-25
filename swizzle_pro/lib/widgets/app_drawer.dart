import 'package:flutter/material.dart';
import '../screens/communities/my_communities_screen.dart';
import '../screens/communities/join_community_screen.dart';
import '../screens/friends/my_friends_screen.dart';
import '../screens/friends/add_friend_screen.dart';
import '../screens/friends/remove_friend_screen.dart';
import '../screens/friends/pending_requests_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Swizzle Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Communities Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Communities",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.teal),
              title: const Text("My Communities"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyCommunitiesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.teal),
              title: const Text("Join Community"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JoinCommunityScreen()),
                );
              },
            ),
            const Divider(),

            // Friends Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Friends",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text("My Friends"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFriendsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.teal),
              title: const Text("Add Friend"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddFriendScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_remove, color: Colors.teal),
              title: const Text("Remove Friend"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RemoveFriendScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail, color: Colors.teal),
              title: const Text("Pending Requests"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PendingRequestsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
