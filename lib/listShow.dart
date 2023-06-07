import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'getController.dart';

class ShowList extends StatefulWidget {
  const ShowList({Key? key}) : super(key: key);

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  void initState() {
    MyHomePageController controller = Get.put(MyHomePageController());

    print("controller ==length==${controller.lst.length}");
    super.initState();
  }
  MyHomePageController controller = Get.put(MyHomePageController());
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: controller.addTolIst(""), 
        tooltip: 'Add to list',
        child: const Icon(Icons.add),
      ),




      appBar: AppBar(
        title: Text("Show List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .50,
              color: Colors.yellowAccent,
              child: GetBuilder<MyHomePageController>(
                builder: (newController) {
                  return ListView.builder(
                      itemCount: newController.lst.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Chip(
                            label: Text(newController.lst[index]),
                          ),
                        );
                      });
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addCounter() {

    
  }
}
