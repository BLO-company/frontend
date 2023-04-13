import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/_blocs.dart';
import '../providers/_providers.dart';
import '../routes/routes.dart';
import '../services/_services.dart';
import '../themes/my_theme.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(
          create: (context) => MapBloc(
            locationBloc: BlocProvider.of<LocationBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(trafficService: TrafficService()),
        ),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogInOnProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
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
      initialRoute: 'home',
      routes: appRoutes,
    );
  }
}


//* Ejecutar código cuando se termine de hacer el build
// WidgetsBinding.instance.addPostFrameCallback((_) {
//       final gpsBloc = BlocProvider.of<GpsBloc>(context);
//       if (!gpsBloc.state.isAllGranted) {
//         gpsErrorAlert(context);
//       } // Llamada a _updateMessage() después del build
//     });