// import 'package:flutter/material.dart';
// import 'chat_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Swizzle Pro',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ChatScreen(), // <-- Show your chat screen
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/doctor_screen.dart';
import 'screens/relaxation_screen.dart';
import 'screens/quotes_screen.dart';
import 'screens/games_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const SwizzleApp());
}

class SwizzleApp extends StatelessWidget {
  const SwizzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swizzle AI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF6FDF9), // calm green background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Roboto'),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    AiChatScreen(),
    DoctorScreen(),
    RelaxationScreen(),
    QuotesScreen(),
    GamesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: "AI Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Doctor"),
          BottomNavigationBarItem(icon: Icon(Icons.spa), label: "Relax"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Quotes"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}



