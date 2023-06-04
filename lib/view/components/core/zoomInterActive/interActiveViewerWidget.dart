import 'package:flutter/material.dart';

void zoomWidget(context, {required Widget child}){
   showDialog(
      context: context,
      builder: (context) {
        return  Center(
          child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(8),
            minScale: 0.5,
            maxScale: 3,
            child: child,
          ),
        );
      }
  );
}