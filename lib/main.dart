import 'package:flutter/material.dart';

void main() {
  runApp(const CentralIncidentesApp());
}

class CentralIncidentesApp extends StatelessWidget {
  const CentralIncidentesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central de Incidentes',
      home: Scaffold(
        appBar: AppBar(title: const Text('Central de Incidentes')),
      ),
    );
  }
}
