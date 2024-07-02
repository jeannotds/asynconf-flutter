import 'package:asyncof/pages/event_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                    "assets/images/chapeau-de-remise-de-diplome.png"),
              ),
              const Text(
                "Asyncof 2022",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Salon virtuel de l'informatique. Du 27 au 29 Octobre 2024",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(20))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventPage()));
                },
                icon: const Icon(Icons.calendar_month),
                label: const Text(
                  "Afficher le planning",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )),
    );
  }
}

// Scaffold(
//         appBar: AppBar(
//           title: const Text("Asyncof 2022"),
//         ),
//         body: );


// Center(
//           child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: const BoxDecoration(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: Image.asset(
//                         "assets/images/chapeau-de-remise-de-diplome.png"),
//                   ),
//                   const Text(
//                     "Asyncof 2022",
//                     style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//                   ),
//                   const Text(
//                     "Salon virtuel de l'informatique. Du 27 au 29 Octobre 2024",
//                     style: TextStyle(fontSize: 24),
//                     textAlign: TextAlign.center,
//                   ),
//                   const Padding(padding: EdgeInsets.only(top: 20)),
//                   ElevatedButton.icon(
//                     style: const ButtonStyle(
//                         backgroundColor: WidgetStatePropertyAll(Colors.blue),
//                         foregroundColor: WidgetStatePropertyAll(Colors.white),
//                         padding: WidgetStatePropertyAll(EdgeInsets.all(20))),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const EventPage()));
//                     },
//                     icon: const Icon(Icons.calendar_month),
//                     label: const Text(
//                       "Afficher le planning",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   )
//                 ],
//               )),
//         )