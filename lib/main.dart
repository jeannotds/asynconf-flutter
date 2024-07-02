import 'package:asyncof/pages/add_event_page.dart';
import 'package:asyncof/pages/event_page.dart';
import 'package:asyncof/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // _ it means variable private
  int _currentIndex = 0;

  // A method to change currentIndex
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: [
          const Text("Accueil"),
          const Text("Liste de conference"),
          const Text("Formulaire")
        ][_currentIndex]),
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          //Use for change menu idex
          currentIndex: _currentIndex,

          onTap: (index) {
            setCurrentIndex(index);
          },

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
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Ajout"),
          ],
        ),
      ),
    );
  }
}
