import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:organico/provider/local/info_provider.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> list = Provider.of<InfoProvider>(context).wishList;
    return Scaffold(
      appBar: AppBar(title: const Text('Wish List'),),
      body: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffE9F0F7),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(Icons.favorite)
                    ),
                  ),
                  title: Text(list[index]['name'].toString()),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
            itemCount: list.length),
    );
  }
}