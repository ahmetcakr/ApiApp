import 'package:api_json/model/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  List<ServisModel>? _items;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      final datas = response.data;

      if (datas is List) {
        setState(() {
          _items = datas.map((e) => ServisModel.fromJson(e)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              shadowColor: Colors.white,
              child: ListTile(
                title: Text(_items?.elementAt(index).id.toString() ?? ''),
                subtitle: Text(_items?.elementAt(index).title ?? ''),
                trailing: _items?.elementAt(index).completed == true
                    ? const Icon(Icons.check)
                    : const Icon(Icons.close),
                dense: true,
                isThreeLine: true,
                leading: const Icon(Icons.person_outline),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.5,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
