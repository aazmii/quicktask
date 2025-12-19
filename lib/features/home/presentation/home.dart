import 'package:flutter/material.dart';
import 'package:quicktask/features/todo/presentation/task_list_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('News')),
    Center(child: const TaskListPage()),
    Center(child: Text('Profile')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // shows selected tab content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // IMPORTANT for 4 tabs
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
        ],
      ),
    );
  }
}
