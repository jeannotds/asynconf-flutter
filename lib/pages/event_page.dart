import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planning du salon"),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Image.asset(
                  "assets/images/arnaud.jpg",
                ),
                title: const Text('Arnaud Garnacho'),
                subtitle: const Text('Git blame --no-offense ?'),
                trailing: const Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
          ],
        ));
  }
}
