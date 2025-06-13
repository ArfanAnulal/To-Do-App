import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:todo_app/main.dart';
import '../models/todo.dart';



class TodoListNotifier extends Notifier<List<Todo>> {
  final _store = intMapStoreFactory.store('todos'); //creates an area in the database to store todos
  Database get _db => SembastDatabase.instance.database; //gets the database instance
  @override
  List<Todo> build(){
    return [];
  }


  Future<void> loadTodos() async {
    final snapshots = await _store.find(_db); //load all data from the DB space todos
    state = snapshots.map((snapshot) {
      return Todo.fromJson(snapshot.value, snapshot.key);
    }).toList();
  }

  Future<void> addTodo(String title) async{
    final newTodo = Todo(title: title);
    await _store.add(_db, newTodo.toJson());
    await loadTodos();
  }

  Future<void> toggleTodoStatus(Todo todo) async{
    final updatedTodo = Todo(title: todo.title, isDone: !todo.isDone);
    await _store.record(todo.id!).update(_db, updatedTodo.toJson());
    await loadTodos();
  }
  

  Future<void> removeTodo(int todoId) async{
    await _store.record(todoId).delete(_db);
    await loadTodos();
  }
}

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
    TodoListNotifier.new,
  );

