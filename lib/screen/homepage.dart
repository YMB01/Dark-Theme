import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:theme/servises/dark_theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            theme.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            size: 200,
          ),
          SizedBox(height: 20),
          Text(
            theme.getDarkTheme ? 'Dark Mode' : 'Light Mode',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Light'),
              Switch(
                onChanged: (value) {
                  setState(() {
                    theme.setDarkTheme = value;
                  });
                },
                value: theme.getDarkTheme,
              ),
              Text('Dark'),
            ],
          ),
        ],
      ),
    );
  }
}
