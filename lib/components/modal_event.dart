// event_dialog.dart

import 'package:asyncof/pages/update_event_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/events_model.dart';

Future<void> showEventsDetailDialog(
    BuildContext context, Event eventData) async {
  String date = DateFormat.yMd().add_jm().format(eventData.timestamp.toDate());
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Conference Lior ${eventData.speaker}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image.network(
                eventData.avatar,
                height: 200,
              ),
              Text(
                'Titre : ${eventData.subject}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Speaker : ${eventData.speaker}',
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                'Data de la conf : $date',
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Fermer'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Modifier'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEventPage(event: eventData),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
