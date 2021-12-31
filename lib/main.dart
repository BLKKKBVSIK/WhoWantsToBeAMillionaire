import 'package:flutter/material.dart';
import 'package:whowanttobeamillionaire/di/dependency_graph.dart';
import 'package:whowanttobeamillionaire/misc/theme.dart';
import 'package:whowanttobeamillionaire/ui/homepage/homepage_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(
    MaterialApp(
      theme: customAppTheme,
      debugShowCheckedModeBanner: false,
      title: 'Who wants to be a millionaire?',
      home: const Homepage(),
    ),
  );
}
