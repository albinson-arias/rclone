import 'package:flutter_svg/flutter_svg.dart';
import 'package:rclone_client/rclone_client.dart';
import 'package:flutter/material.dart';
import 'package:rclone_flutter/core/routing/app_router.dart';
import 'package:rclone_flutter/core/utils/assets/gen/assets.gen.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('https://rcloneapi.albinson-apps.com/')
// var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await preloadSVGs();
  runApp(const MyApp());
}

Future<void> preloadSVGs() async {
  var loader = SvgAssetLoader(Assets.logo.path);
  await svg.cache
      .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      title: 'BPlace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        colorSchemeSeed: Colors.blue.shade300,
      ),
    );
  }
}
