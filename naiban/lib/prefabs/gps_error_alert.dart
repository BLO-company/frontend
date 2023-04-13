import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naiban/widgets/_widgets.dart';

import '../blocs/_blocs.dart';
import '../themes/my_theme.dart';

void gpsErrorAlert(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return const _ErrorAlert();
    },
  );
}

class _ErrorAlert extends StatelessWidget {
  const _ErrorAlert();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final gpsBloc = BlocProvider.of<GpsBloc>(context);
        if (gpsBloc.state.isAllGranted) {
          return true;
        } // Ll
        return false;
      },
      child: AlertDialog(
        backgroundColor: AppTheme.dark,
        elevation: 0,
        surfaceTintColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        content: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            if (state.isAllGranted) Navigator.pop(context);

            return !state.isGpsEnabled
                ? const _EnableGpsMessage()
                : const _AccessButton();
          },
        ),
        // content: const Text('Debe de habilitar el GPS'),
      ),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe de habilitar el GPS',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppTheme.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Es necesario el acceso a GPS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 24),
        Button(
          'Solicitar Acceso',
          width: .7,
          onTap: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
        )
      ],
    );
  }
}
