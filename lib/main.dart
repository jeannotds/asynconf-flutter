import 'package:asyncof/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Asynconf 2024"),
        ),
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          //Here is for styles

          //Element Selected color menu
          selectedItemColor: Colors.green,

          //Element no selected
          unselectedItemColor: Colors.grey,

          //Size Icon
          iconSize: 40,

          elevation: 10,

          //Items of navigation
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Planning"),
          ],
        ),
      ),
    );
  }
}
