import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_request_using_bloc/bloc/app_bloc.dart';
import 'package:post_request_using_bloc/repository/product_repo.dart';
import 'package:post_request_using_bloc/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => ProductRepository(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ProductsAdded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Products Added"),
              duration: Duration(seconds: 2),
            ));
          }
        },
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is ProductsAdding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return HomePage();
        }),
      ),
    );
  }
}
