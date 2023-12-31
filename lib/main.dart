import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/thememanager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final ThemeManager _manager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispose() {
    _manager.removeListener((themeListerner));
    super.dispose();
  }

  @override
  void initState() {
    _manager.addListener((themeListerner));
    super.initState();
  }

  themeListerner() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _manager.themeMode,
      home: LoginView(),
    );
  }
}

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  @override
  Widget build(BuildContext context) {
    // ThemeManager _manager = ThemeManager();
    return Scaffold(
      appBar: AppBar(
        title: Text("Themes"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Switch(
                      value: _manager.themeMode == ThemeMode.light,
                      onChanged: (newValue) {
                        setState(() {
                          _manager.toggleTheme(newValue);
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "Ligth",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Switch(
                      value: _manager.themeMode == ThemeMode.dark,
                      onChanged: (newValue) {
                        setState(() {
                          _manager.toggleTheme(newValue);
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      "Dark",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
