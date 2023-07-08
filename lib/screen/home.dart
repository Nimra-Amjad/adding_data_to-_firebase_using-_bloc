import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_request_using_bloc/bloc/app_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _create() async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: "Price"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      final String name = _nameController.text;
                      final double? price =
                          double.tryParse(_priceController.text);
                      if (price != null) {
                        postData(context);
                        _nameController.text = '';
                        _priceController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Create"))
              ],
            ),
          );
        });
  }

  void postData(context) {
    BlocProvider.of<AppBloc>(context)
        .add(Create(_nameController.text, _priceController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adding data using Bloc"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _create();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
