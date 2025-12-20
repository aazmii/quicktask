import 'package:flutter/material.dart';
import 'package:quicktask/features/news/presentation/view/news_list/news.page.dart';
import 'package:quicktask/features/todo/presentation/view/task_list_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: NewsPage()),
    Center(child: const TaskListPage()),
    Center(child: Text('Profile')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Profile',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
        ],
      ),
    );
  }
}
