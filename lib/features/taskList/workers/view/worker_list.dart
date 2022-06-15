import 'package:flutter/material.dart';
import '../viewModel/worker_view_model.dart';
import 'package:provider/provider.dart';

class WorkerList extends StatefulWidget {
  const WorkerList({Key? key}) : super(key: key);

  @override
  State<WorkerList> createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  @override
  void initState() {
    super.initState();
    Provider.of<WorkerViewModel>(context, listen: false).getWorkers();
  }

  @override
  Widget build(BuildContext context) {
    final workers = Provider.of<WorkerViewModel>(context, listen: true).workers;
    return ListView.separated(
      itemCount: workers.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(workers[index].name!),
          subtitle: Text(workers[index].email!),
          onTap: () {},
        );
      },
    );
  }
}
