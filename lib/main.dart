import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Asyncof 2022"),
          ),
          body: Center(
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
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Salon virtuel de l'informatique. D 27 au 29 Octobre 2024",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          )),
    );
  }
}
