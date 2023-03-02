import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline_sharp))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Center(
                  child: Image.network(data['img'].toString()),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data['created_at']),
                        SizedBox(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              const Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      " 💲${data['cost'].toString()}/kg",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )),
            Expanded(
                flex: 4,
                child: Column(
                  children: [],
                ))
          ],
        ),
      ),
    );
  }
}
