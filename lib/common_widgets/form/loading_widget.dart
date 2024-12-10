import 'package:flutter/material.dart';
import 'package:ogtaxi/constants/kdevice_info.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getDeviceWidth(context),
      child: const ElevatedButton(
        onPressed: null, // Disable button when loading
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
