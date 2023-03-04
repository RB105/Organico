import 'package:flutter/material.dart';
import 'package:organico/provider/remote/stream/home_provider.dart';
import 'package:provider/provider.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
           close(context, null);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> results =
        Provider.of<HomeProvider>(context).searchList.where((element) {
      return element['name']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    return _listView(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> suggestions =
        Provider.of<HomeProvider>(context).searchList.where((element) {
      return element['name']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    return _listView(suggestions);
  }

    ListView _listView(List<Map<String, dynamic>> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'info',arguments: list[index]);
          },
          title: Text(list[index]['name'].toString()),
        );
      },
    );
  }
}
