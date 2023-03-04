import 'package:flutter/material.dart';
import 'package:organico/provider/local/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            actions: const [Icon(Icons.settings)],
          ),
          body: Column(
            children: [
              ListTile(
                  leading: const CircleAvatar(
                      child: Icon(
                    Icons.bedtime_sharp,
                    size: 26,
                  )),
                  title: const Text(
                    "Night Mode",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton(
                      onPressed: () {
                        themeProvider.changeTheme(context);
                      }, child: const Text("Change Theme"))),
            ],
          ),
        );
      },
    );
  }
}
