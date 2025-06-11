# **To-Do List App - A Riverpod Project**

A sleek, modern, and fully functional To-Do List application built with Flutter. This project showcases an advanced, scalable architecture using Riverpod for state management, moving beyond basic state handling to a professional, industry-standard pattern.


## **📸 Demo & Screenshots**

This app features a custom dark-mode theme with vibrant, colorful accents to create an engaging user experience.

*(Remember to replace this placeholder with a real GIF or screenshots of your beautiful app!)*


## **✨ Features**



* **Full CRUD Functionality:** Create, Read, Update (toggle status), and Delete tasks.
* **Advanced State Management:** Architected with **Riverpod**, separating business logic from the UI for a clean, scalable, and testable codebase.
* **Reactive UI:** The UI instantly reacts to any changes in the application state, providing a seamless user experience.
* **Modern UI/UX:**
    * A custom, dark-mode-centric theme.
    * Smooth animations for adding and removing tasks.
    * A modal bottom sheet for adding new tasks without leaving the main screen.
* **Immutable State:** Follows best practices by treating state as immutable, ensuring predictable and bug-free state transitions.
* **Optimized for Performance:** Uses ListView.builder to efficiently handle and display even very long lists of tasks.


## **🛠️ Technologies & Packages Used**



* **Core:** Flutter, Dart
* **State Management:** flutter_riverpod


## **🚀 The Architectural Leap: From setState to Riverpod**

This project represents the next step in my Flutter development journey, building directly on the fundamentals learned in my earlier "Profile Builder" app. The primary goal here was to master professional state management.

While setState is excellent for local widget state, it becomes difficult to manage when multiple screens need to share and modify the same data. This app solves that problem by using Riverpod to create a centralized, reliable "source of truth" for the application's state.

This demonstrates an understanding of:



* **Separation of Concerns:** The UI (home.dart) is only responsible for displaying data and forwarding user events. The logic (todo_provider.dart) is responsible for managing the state.
* **Dependency Injection:** Riverpod provides a clean way to access business logic from the UI without tight coupling.
* **Immutability:** Understanding why mutating state directly is problematic and how to correctly create new states for a predictable application.


## **💡 How It Works: The Riverpod Pattern**

The application's architecture is centered around a NotifierProvider:



1. **todo.dart (The Model):** A simple class that defines the structure of a single to-do item (title and isDone).
2. **todo_provider.dart (The Brain):**
    * A TodoListNotifier class holds the list of todos and contains all the methods to modify it (addTodo, removeTodo, toggleTodoStatus).
    * A global todoListProvider is defined, which allows any widget in the app to access the TodoListNotifier.
3. **home.dart (The UI):**
    * The HomeScreen is a ConsumerWidget, which can "listen" to providers.
    * It uses **ref.watch()** to get the list of todos and automatically rebuild when the list changes.
    * It uses **ref.read()** within onPressed callbacks to call functions on the notifier (e.g., ref.read(todoListProvider.notifier).addTodo(...)) without causing unnecessary rebuilds.
4. **main.dart (The Root):** The entire application is wrapped in a ProviderScope to make all providers available throughout the widget tree.


## **📈 Future Improvements**



* **Persistence:** Use a package like shared_preferences or a database like Hive to save the to-do list locally so it persists between app launches.
* **Firebase Integration:** Move the state to a Firestore backend to allow for real-time syncing across multiple devices.
* **Animations:** Add custom animations for when tasks are added or removed to further enhance the user experience.