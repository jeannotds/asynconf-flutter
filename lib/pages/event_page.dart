import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // final events = [];
  @override
  Widget build(BuildContext context) {
    return Center(
        // stream : la requette a notre collection en temps reel
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Events").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return const Text("Aucune conference");
              }

              List<dynamic> events = [];
              for (var element in snapshot.data!.docs) {
                events.add(element);
              }

              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final speaker = event["speaker"];
                    final avatar = event["avatar"].toString().toLowerCase();
                    final Timestamp timestamp = event["date"];
                    String date =
                        DateFormat.yMd().add_jm().format(timestamp.toDate());
                    final subject = event["subject"];
                    return Card(
                      child: ListTile(
                        // leading: Image.asset(
                        //   "$avatar",
                        // ),
                        leading: Image.network(
                          "$avatar",
                        ),
                        title: Text('$speaker ($date)'),
                        subtitle: Text('$subject'),
                        // trailing: const Icon(Icons.more_vert),
                        trailing: const Icon(Icons.info_sharp),
                        isThreeLine: true,
                      ),
                    );
                  });
            }));
  }
}

// Scaffold(
//         appBar: AppBar(
//           title: const Text("Planning du salon"),
//         ),
//         body:
//         );

// Center(
//           child: ListView.builder(
//               itemCount: events.length,
//               itemBuilder: (context, index) {
//                 final event = events[index];
//                 final speaker = event["speaker"];
//                 final avatar = event["avatar"];
//                 final date = event["date"];
//                 final subject = event["subject"];
//                 return Card(
//                   child: ListTile(
//                     leading: Image.asset(
//                       "$avatar",
//                     ),
//                     title: Text('$speaker ($date)'),
//                     subtitle: Text('$subject'),
//                     // trailing: const Icon(Icons.more_vert),
//                     trailing: const Icon(Icons.info_sharp),
//                     isThreeLine: true,
//                   ),
//                 );
//               }),
//         )


