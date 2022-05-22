import 'package:flutter/material.dart';
import 'package:process_flow/provider/bottom_navbar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          switch (index) {
            case 0:
              Provider.of<BottomNavBarNotfier>(context).sort = "isDone";
              break;
            case 1:
              Provider.of<BottomNavBarNotfier>(context).sort = "unDone";
              break;
            case 2:
              Provider.of<BottomNavBarNotfier>(context).sort = "all";
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined), label: "Todos"),
        BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
      ],
    );
  }
}
