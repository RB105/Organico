import 'package:flutter/material.dart';
import 'package:organico/view/pages/bottom_navigation_pages/home_page.dart';
import 'package:organico/view/pages/bottom_navigation_pages/profile_page.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Widget> _pages = [ const HomePage(),const ProfilePage()];
   int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            currentIndex:
                _currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "Profile"),
            ],
            onTap: onTabTapped,
          ),
    );
  }
   void onTabTapped(int index) {
     setState(() {
     _currentIndex = index;
     });
   }
}