part of task_list_w_stream;

class SlidableListItem extends StatelessWidget {
  const SlidableListItem({
    Key? key,
    required this.taskList,
    required this.index,
  }) : super(key: key);

  final List<TaskModel> taskList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(taskList[index].id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              Provider.of<FirestoreDatabaseService>(context, listen: false)
                  .deleteTask(taskList[index].id);
            }),
            backgroundColor: Theme.of(context).colorScheme.onError,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (ctx) {
              showDialog(
                context: context,
                builder: (context) => UpdateTask(updatedTask: taskList[index]),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Task(
        taskName: taskList[index].taskName,
        taskDescription: taskList[index].taskDesc,
        isDone: taskList[index].isDone,
      ),
    );
  }
}
