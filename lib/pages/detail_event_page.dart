import 'package:asyncof/pages/update_event_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:asyncof/models/events_model.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat.yMd().add_jm().format(event.timestamp.toDate());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de l\'événement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              event.avatar,
              height: 200,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Titre : ${event.subject}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Speaker : ${event.speaker}',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date de la conférence : $date',
              style: const TextStyle(fontSize: 17),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) =>  EditEventPage(event: event))
                    MaterialPageRoute(
                        builder: (context) => EditEventPage(event: event)),
                  );
                },
                child: const Text("Modifier"))
          ],
        ),
      ),
    );
  }
}
