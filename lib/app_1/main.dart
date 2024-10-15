/*
Task:- 1
Design a user interface that displays a list of items using a model list. When an item is tapped, show the respective options below that selected item.
1. Implement a list of items using a model list.
2. Each item in the list should be tappable.
3. When an item is tapped, display a set of options related to that item between the first and second Row of list for example , I have tabbed on first Item from the first row then the menu box should be shown between the first row and second row...
4. Ensure the options are only shown for the currently selected item and not for other items.
5. The interface should update dynamically to reflect the changes when a different item is tapped.
Requirements:-
- Use a model to define the list items.
- Use an appropriate UI framework or library for the implementation.
- Ensure a smooth user experience with dynamic updates.
- Provide a clear and user-friendly design.
Network Image : https://i.ibb.co/HgjT1rt/Image.png (You can use this URl for Image)
Note :- 
Use any state management except SetState() to perform this task.
Code style should be standard, clean code, with proper commenting.
You can use the internet for general searches related to problem solving, but can't search complete codes.
You need to share your screen all the time (Entire screen).
*/

// My Take
/* 
This isn't possible with the in-built Flutter widgets.
We can use overlay but we can't shift the rows downwards 
when the tile expands. It can be overlapped on the below tiles.

Either we use existing package if any or Custom RenderObjects to achieve this.
Here, I am using [StaggeredGridView].
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelivita_technical_assesment/app_1/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp1());
}
