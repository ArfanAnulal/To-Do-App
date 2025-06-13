import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build(){
    return [];
  }

  void addTodo(String title){
    state = [...state, Todo(title: title)];
  }

  void toggleTodoStatus(int index){
    state=[
      for(int i=0;i<state.length;i++)
        if(i==index)
          Todo(title: state[i].title, isDone: !(state[i].isDone))
        
        else
          state[i]
    ];
  }

  void removeTodo(int index){
    state = List.from(state)..removeAt(index);
  }
}

final todoListProvider = NotifierProvider<TodoListNotifier, List<Todo>>(
    TodoListNotifier.new,
  );

