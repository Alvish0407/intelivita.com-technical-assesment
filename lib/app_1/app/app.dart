import 'package:flutter/material.dart';
import 'package:intelivita_technical_assesment/app_1/app/features/items/presentation/items_grid_screen.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp1',
      theme: ThemeData(primarySwatch: Colors.blue),
      // In real app, I use [go_router] or [auto_route] for navigation.
      home: const ItemsGridScreen(),
    );
  }
}
