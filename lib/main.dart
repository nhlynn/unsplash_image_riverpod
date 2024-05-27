import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unsplash_image_riverpod/ui/detail.dart';
import 'data/model/image_model.dart';
import 'ui/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Unsplash Image',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, routeState) => const Home()),
          GoRoute(
              path: '/detail',
              builder: (context, routeState) {
                var imageModel = routeState.extra as ImageResult;
                return ImageViewDetail(
                  imageModel: imageModel,
                );
              })
        ],
      ),
    );
  }
}
