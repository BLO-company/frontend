import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/_providers.dart';
import '../routes/routes.dart';
import '../themes/my_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogInOnProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naiban',
      theme: AppTheme.theme,
      initialRoute: 'welcome',
      routes: appRoutes,
    );
  }
}
