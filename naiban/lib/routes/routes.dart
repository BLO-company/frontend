import 'package:flutter/material.dart';

import 'package:naiban/pages/_pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage(),
  'welcome': (_) => const WelcomePage(),
  'register': (_) => const LogInOutPage(),
};
