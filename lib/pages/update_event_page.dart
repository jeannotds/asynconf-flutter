import 'package:asyncof/models/events_model.dart';
import 'package:flutter/material.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  const EditEventPage({super.key, required this.event});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modification de l'evenement"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.event.speaker),
            Text(widget.event.subject),
          ],
        ),
      ),
    );
  }
}
