import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/theme/themes.dart';

class MyHome extends ConsumerWidget {
  MyHome({super.key});
  final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
    TodoListNotifier.new,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showAddTaskSheet(BuildContext context, WidgetRef ref) {
      final TextEditingController textController = TextEditingController();

      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(bottom: 30, top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add a New Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Task Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Add Task'),
                  onPressed: () {
                    final String title = textController.text;
                    if (title.trim().isNotEmpty) {
                      ref.read(todoListProvider.notifier).addTodo(title);
                      Navigator.pop(context); 
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    }

    final todos = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List', style: AppTextTheme.appBarText),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            color: AppTheme.cardBackgroundColor,
            shape: AppTheme.cardShape,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (value) {
                  ref.read(todoListProvider.notifier).toggleTodoStatus(index);
                },
                activeColor: const Color(0xFFF07DEA),
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  color: todo.isDone
                      ? const Color(0xFF888888)
                      : const Color(0xFFEFEFEF),
                  decoration: todo.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFFE94560),
                ),
                onPressed: () {
                  ref.read(todoListProvider.notifier).removeTodo(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Color.fromARGB(255, 93, 34, 93),
        onPressed: () {
          showAddTaskSheet(context, ref);
        },
        shape: CircleBorder(),
        child: Icon(size: 35, Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(color: Color.fromARGB(255, 13, 13, 35)),
    );
  }
}
