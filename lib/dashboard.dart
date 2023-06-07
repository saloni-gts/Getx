import 'package:flutter/material.dart';

import 'allItem.dart';
import 'chair.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:Color(0xff282747),
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color(0xff282747),
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 120,
                child: TabBar(
                  onTap: (vall) {
                    print("TAB INDEX $vall");
                    print("TAB INDEX Vallll ${_tabController.index}");
                  },
                  controller: _tabController,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16, ),
                  labelStyle: TextStyle(
                    fontSize: 16, ),
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("All"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Chair"),
                      ),
                    ),
                    // Tab(
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text("Table"),
                    //   ),
                    // ),
                    // Tab(
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text("Bed"),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

         body: TabBarView(
             controller: _tabController,
           children: [
             AllItems(),
             ChairPage()

           ],


         ),

        ),
      )

    );
  }
}
