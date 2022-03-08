import 'package:flutter/material.dart';
import 'package:process_flow/provider/task_provider.dart';
import 'package:provider/provider.dart';

import 'settingsForm.dart';
import 'taskList.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: const TaskAddForm(),
            );
          });
    }

    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          child: const TaskList(),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.school),
                  onPressed: null,
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: _showSettingsPanel,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
