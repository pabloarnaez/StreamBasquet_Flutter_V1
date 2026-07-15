
import 'package:flutter/material.dart';

void main() {
  runApp(const StreamBasquetApp());
}

class StreamBasquetApp extends StatelessWidget {
  const StreamBasquetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Basquet',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Stream Basquet')),
        body: const Center(
          child: Text('Proyecto Base v1'),
        ),
      ),
    );
  }
}
