import 'custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isVisible;
  const LoadingWidget(this.isVisible, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.5),
          child: Center(child: CustomProgressIndicator()),
        ));
  }
}
