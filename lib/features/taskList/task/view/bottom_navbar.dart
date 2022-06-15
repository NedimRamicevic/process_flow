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
  bool isAll = true;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (selectedIndex == index) {
          if (isAll == true) {
            selectTaskList(index, context);
          } else {
            selectTaskList(2, context);
          }
          setState(() {
            isAll = !isAll;
          });
        } else {
          selectTaskList(index, context);
        }
        setState(() {
          selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined), label: "Todos"),
        BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
      ],
    );
  }

  void selectTaskList(int index, BuildContext context) {
    switch (index) {
      case 0:
        Provider.of<BottomNavBarNotfier>(context, listen: false).sort =
            "unDone";
        break;
      case 1:
        Provider.of<BottomNavBarNotfier>(context, listen: false).sort =
            "isDone";
        break;
      case 2:
        Provider.of<BottomNavBarNotfier>(context, listen: false).sort = "all";
    }
  }
}

class BottomNavigationBartype {}
