import 'package:flutter/material.dart';
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
    InfoProvider infoProvider = InfoProvider();
    List<Map<String, dynamic>> list =
        Provider.of<InfoProvider>(context).wishList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                Navigator.pushNamed(context, 'info',arguments: list[index]);
              },
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: const Color(0xffE9F0F7),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Icon(Icons.favorite)),
              ),
              title: Text(list[index]['name'].toString()),
              trailing: IconButton(
                  onPressed: () {
                    infoProvider.deleteFromWishList(list[index], list);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_rounded)),
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
