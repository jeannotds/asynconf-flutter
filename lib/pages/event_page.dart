import 'package:asyncof/models/events_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> showEventsDetailDialog(Event eventData) async {
      String date =
          DateFormat.yMd().add_jm().format(eventData.timestamp.toDate());
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
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
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
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
            ],
          );
        },
      );
    }

    return Center(
        // stream : la requette a notre collection en temps reel
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Events")
                // .where('type', isEqualTo: "talk")
                .snapshots(),
            //Builder : Construire la vue avec les donnees recuperer et à afficher
            builder:
                // AsyncSnapshot<QuerySnapshot> : Recuperer la reponse de la requette
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //Verifier si la reponse est disponible ou en cours
              if (snapshot.connectionState == ConnectionState.waiting) {
                //CircularProgressIndicator : tourne pour attendre la reponse
                return const CircularProgressIndicator();
              }
              //Verifier si les donnees envoyées existent
              if (!snapshot.hasData) {
                return const Text("Aucune conference");
              }
              // Creer une liste dynamique
              List<Event> events = [];

              for (var data in snapshot.data!.docs) {
                events.add(Event.fromData(data));
              }

              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final speaker = event.speaker;
                    final avatar = event.avatar;
                    final Timestamp timestamp = event.timestamp;
                    String date =
                        DateFormat.yMd().add_jm().format(timestamp.toDate());
                    final subject = event.subject;
                    return Card(
                      child: ListTile(
                        // leading: Image.asset(
                        //   "$avatar",
                        // ),
                        leading: Image.network(
                          avatar,
                        ),
                        title: Text('$speaker ($date)'),
                        subtitle: Text(subject),
                        // trailing: const Icon(Icons.more_vert),
                        trailing: IconButton(
                            onPressed: () {
                              // appel de la fonction popup
                              showEventsDetailDialog(event);
                            },
                            icon: const Icon(Icons.info_sharp)),
                        isThreeLine: true,
                      ),
                    );
                  });
            }));
  }
}