import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DynamicWidgets extends StatefulWidget {
  const DynamicWidgets({Key? key}) : super(key: key);

  @override
  State<DynamicWidgets> createState() => _DynamicWidgetsState();
}

class _DynamicWidgetsState extends State<DynamicWidgets> {
  List<DynamicWidget> listDynamic = [];

  addDynamic() {
    setState(() {
      listDynamic.add(const DynamicWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Flexible(
          child: ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (context, index) {
          return listDynamic[index];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addDynamic();
          setState(() {
            listDynamic.add(const DynamicWidget());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DynamicWidget extends StatefulWidget {
  const DynamicWidget({Key? key}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Enter your name',
        ),
      ),
    );
  }
}
