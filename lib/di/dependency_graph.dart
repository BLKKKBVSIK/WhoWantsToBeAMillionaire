import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_graph.config.dart';

final getFromDependencyGraph = GetIt.instance;

@injectableInit
Future setupDependencyInjection() async {
  $initGetIt(getFromDependencyGraph);
}
