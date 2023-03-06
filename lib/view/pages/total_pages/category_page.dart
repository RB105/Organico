import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/widgets/loading_widget.dart';
import 'package:organico/provider/remote/stream/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final Stream<QuerySnapshot> streamData;
  const CategoryPage(
      {super.key, required this.streamData, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
          actions: const [Icon(Icons.filter_alt)],
        ),
        body: StreamBuilder(
          stream: streamData,
          builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: LoadingWidget(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Server error"),
              );
            } else {
              List<Map<String, dynamic>> data = [];
              snapshot.data!.docs.map((docment) {
                data.add(docment.data() as Map<String, dynamic>);
              }).toList();
              if (data.isEmpty) {
                return const Center(
                  child: Text("No products yet in this Category"),
                );
              } else {
                for (Map<String, dynamic> element in data) {
                  Provider.of<HomeProvider>(context).searchList.add(element);
                }
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'info',
                              arguments: data[index]);
                        },
                        child: Container(
                          width: 176,
                          height: 234,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.amberAccent),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 97,
                                height: 79,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data[index]['img'].toString()))),
                              ),
                              Text(data[index]['name'].toString(),style: const TextStyle(fontSize: 20),),
                              Text(data[index]['market'].toString()),
                              ListTile(
                                title: Text(
                                    "${data[index]['cost'].toString()} USD"),
                                trailing: const Icon(Icons.add_box_rounded),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }
          },
        ));
  }
}
