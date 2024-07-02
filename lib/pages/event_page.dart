import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events = [
    {
      "speaker": "Jeannot ds",
      "avatar": "assets/images/john.jpg",
      "subject": "Show me your wisdom",
      "date": "13h00 à 14h"
    },
    {
      "speaker": "Beni sm",
      "avatar": "assets/images/james.jpg",
      "subject": "The way of glory",
      "date": "10h20 à 15h"
    },
    {
      "speaker": "Levis ds",
      "avatar": "assets/images/arnaud.jpg",
      "subject": "See me",
      "date": "14h45 à 18h"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Planning du salon"),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                final speaker = event["speaker"];
                final avatar = event["avatar"];
                final date = event["date"];
                final subject = event["subject"];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      "$avatar",
                    ),
                    title: Text('$speaker ($date)'),
                    subtitle: Text('$subject'),
                    // trailing: const Icon(Icons.more_vert),
                    trailing: const Icon(Icons.info_sharp),
                    isThreeLine: true,
                  ),
                );
              }),
        ));
  }
}
