import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclone_client/rclone_client.dart';
import 'package:flutter/material.dart';
import 'package:rclone_flutter/presentation/cubits/color_cubit/color_cubit.dart';
import 'package:rclone_flutter/presentation/cubits/pixels_cubit/pixels_cubit.dart';
import 'package:rclone_flutter/presentation/screens/board_screen.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rclone Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => PixelsCubit(client),
          ),
          BlocProvider(
            create: (context) => ColorCubit(),
          ),
        ],
        child: const BoardScreen(),
      ),
    );
  }
}
