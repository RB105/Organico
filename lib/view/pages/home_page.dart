import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String location = 'Uz,Tashkent';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Center(
                child: Text("Your Location"),
              ),
              Center(
                  child: DropdownButton(
                      value: location,
                      items: const [
                        DropdownMenuItem(
                            value: 'US,Washington',
                            child: Text("USA,Washington")),
                        DropdownMenuItem(
                            value: 'France,Paris', child: Text("France,Paris")),
                        DropdownMenuItem(
                            value: 'UK,London', child: Text("UK,London")),
                        DropdownMenuItem(
                            value: 'Uz,Tashkent',
                            child: Text("Uzbekistan,Tashkent"))
                      ],
                      onChanged: (v) {})),
                      
            ],
          ),
        ),
      ),
    );
  }
}
