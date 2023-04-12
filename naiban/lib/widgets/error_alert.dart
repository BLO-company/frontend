import 'package:flutter/material.dart';
import 'package:naiban/themes/my_theme.dart';

void errorAlert(BuildContext context, String msg) {
  showModalBottomSheet(
    isDismissible: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) => _ErrorAlert(msg),
  );
}

class _ErrorAlert extends StatelessWidget {
  final String msg;

  const _ErrorAlert(this.msg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Revisar
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppTheme.dark,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: AppTheme.dark2,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
