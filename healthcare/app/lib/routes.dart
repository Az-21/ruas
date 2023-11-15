import 'package:go_router/go_router.dart';
import 'package:mhrc/home/page.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const HomePage()),
]);
