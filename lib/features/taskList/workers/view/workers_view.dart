import 'package:flutter/material.dart';
import '../view/worker_list.dart';
import '../viewModel/worker_view_model.dart';
import 'package:provider/provider.dart';

class WorkersView extends StatelessWidget {
  const WorkersView({Key? key}) : super(key: key);

  final title = 'Workers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ChangeNotifierProvider(
            create: (context) => WorkerViewModel(), child: const WorkerList()),
      ),
    );
  }
}
