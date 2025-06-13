import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/mode_provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/theme/themes.dart';

class MyHome extends ConsumerWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    //Watching providers
    final isDarkMode = ref.watch(modeNotifierProvider);
    final todos = ref.watch(todoListProvider);

    final theme = Theme.of(context);

    //bottom sheet to add tasks
    void showAddTaskSheet(BuildContext context, WidgetRef ref) {
      final TextEditingController textController = TextEditingController();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true, 
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom:  MediaQuery.of(context).viewInsets.bottom, 
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  'Add a New Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, 
                  decoration: TextDecoration.none, color: isDarkMode? AppTheme.darkModeTextColor: AppTheme.lightModeTextColor),
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
                    final String title = textController.text.trim();
                    if (title.isNotEmpty) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          Switch(
            padding: EdgeInsets.all(15),
            thumbIcon: isDarkMode? WidgetStateProperty.all(Icon(Icons.dark_mode)):WidgetStateProperty.all(Icon(Icons.light_mode)),
            value: isDarkMode,
            onChanged: (bool value) {
              ref.read(modeNotifierProvider.notifier).toggleMode();
            },
            activeColor: theme.floatingActionButtonTheme.backgroundColor,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          final textStyle = todo.isDone
              ? theme.textTheme.bodyMedium 
              : theme.textTheme.bodyLarge; 

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (value) {
                  ref.read(todoListProvider.notifier).toggleTodoStatus(index);
                },
              ),
              title: Text(
                todo.title,
                style: textStyle, 
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  ref.read(todoListProvider.notifier).removeTodo(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskSheet(context, ref);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
      ),
    );
  }
}
