import 'package:client/screens/courses/courses.dart';
import 'package:client/screens/info/info.dart';
import 'package:client/screens/map/map.dart';
import 'package:client/screens/more/more.dart';
import 'package:client/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          MapScreen(),
          CoursesScreen(),
          InfoScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: HeronNavigationBar(
        selectedIndex: _selectedIndex,
        onSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          HeronNavigationBarItem(
            icon: HugeIcons.strokeRoundedMapsLocation01,
            label: "Map",
          ),
          HeronNavigationBarItem(
            icon: HugeIcons.strokeRoundedRoute01,
            label: "Courses",
          ),
          HeronNavigationBarItem(
            icon: HugeIcons.strokeRoundedLibrary,
            label: "Info",
          ),
          HeronNavigationBarItem(
            icon: HugeIcons.strokeRoundedMoreHorizontalCircle01,
            label: "More",
          )
        ],
      ),
    );
  }
}
