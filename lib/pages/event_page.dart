import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

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
            Card(
              child: ListTile(
                leading: Image.asset("assets/images/john.jpg"),
                title: const Text('John Margon'),
                subtitle: const Text(
                    'A sufficiently long subtitle warrants three lines.'),
                trailing: const Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset("assets/images/james.jpg"),
                title: const Text('James Parcaston'),
                subtitle: const Text(
                    'A sufficiently long subtitle warrants three lines.'),
                trailing: const Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
          ],
        ));
  }
}
