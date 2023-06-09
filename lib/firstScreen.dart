
// import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'package:unique_tags/components/appbarComp.dart';
// import 'package:unique_tags/provider/authprovider.dart';
// import 'package:unique_tags/provider/petprovider.dart';
// import 'package:unique_tags/screen/home.dart';
// import 'package:unique_tags/util/app_font.dart';
// import 'package:unique_tags/util/app_images.dart';
// import 'package:unique_tags/util/appstrings.dart';
// import 'package:unique_tags/util/color.dart';
//
// import '../services/hive_handler.dart';
// import 'LogoutPage.dart';
// import 'addPet.dart';
// import 'calenderPage.dart';
//
// class DashBoard extends StatefulWidget {
//   const DashBoard({Key? key}) : super(key: key);
//
//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }
//
// class _DashBoardState extends State<DashBoard> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     Home(),
//     CalenderPage(),
//     LogoutPage()
//   ];
//
//   var loginUser = HiveHandler.getUser();
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//
//     });
//   }
//
//   @override
//   void initState() {
//     PetProvider petProvider = Provider.of(context,listen: false);
//     petProvider.getAllPet();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:false,
//       backgroundColor: Colors.white,
//       appBar: customAppbar(isbackbutton: false),
//
//
//
//       bottomNavigationBar: BottomNavigationBar(
//
//         unselectedIconTheme: IconThemeData(
//           color: Colors.grey
//         ),
//        // unSelectedColor:Colors.grey,
//         //selectedColor: AppColor.textLightBlueBlack,
//         selectedItemColor: AppColor.textLightBlueBlack,
//        unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         currentIndex: _selectedIndex,
//         // Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoutPage()));
//
//         items: [
//           BottomNavigationBarItem(
//
//             icon: InkWell(
//               child: Image.asset(AppImage.homeIcon,color: Colors.grey,),
//             ),
//             activeIcon: Image.asset(AppImage.homeIcon),
//             label: AppStrings.home,
//           ),
//           BottomNavigationBarItem(
//               icon: Image.asset(AppImage.petcareIcon,color: Colors.grey),
//               activeIcon: Image.asset(AppImage.petcareIcon),
//               label: AppStrings.petCare,
//               backgroundColor: AppColor.textFieldGrey),
//           BottomNavigationBarItem(
//             icon: Image.asset(AppImage.moreIcon,color: Colors.grey),
//             activeIcon: Image.asset(AppImage.moreIcon),
//             label: AppStrings.more,
//             backgroundColor: AppColor.textFieldGrey,
//           )
//         ],
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: true,
//
//         showUnselectedLabels: true,
//        // selectedItemColor: AppColor.textBlueBlack,
//         unselectedLabelStyle: TextStyle(
//           color: AppColor.textFieldGrey,
//           fontSize: 12.0,
//           fontFamily: AppFont.poppinSemibold,
//         ),
//         selectedLabelStyle: TextStyle(
//           color: AppColor.textLightBlueBlack,
//           fontSize: 12.0,
//           fontFamily: AppFont.poppinSemibold,
//         ),
//       ),
//
//       body: _widgetOptions.elementAt(_selectedIndex),
//
//
//     );
//
//   }
// }

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/sofapage.dart';

import 'allItem.dart';
import 'bedpage.dart';
import 'cartPage.dart';
import 'chair.dart';
import 'getController.dart';
import 'tablePage.dart';


class DashBoardMain extends StatefulWidget {
  int type;

  DashBoardMain({Key? key, this.type = 0, }) : super(key: key);
  @override
  _DashBoardMainState createState() => _DashBoardMainState();
}

class _DashBoardMainState extends State<DashBoardMain> with TickerProviderStateMixin {
  final PageStorageBucket bucket = PageStorageBucket();
  late TabController tabController;


  final List<Widget> mainScreens = [
    AllItems(),
    ChairPage(),
    TablePage(),
    BedPage(),
    SofaPage(),
    CartPage()
  ];
  MyHomePageController controller = Get.put(MyHomePageController());
  @override
  void initState() {

    // tabController.animateTo(1);
    print("call init state");
    // if (widget.type == 2) {
    //   Navigator.push(GlobalVariable.navState.currentContext!,
    //       MaterialPageRoute(builder: (context) => Googlemap()));
    // }





    super.initState();
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);

  }




  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    if (widget.type == 1) {
      tabController.animateTo(1);
    }
    print('working or not');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:


        SafeArea(
          bottom: true,
          top: true,

          child: PageStorage(
            child: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: mainScreens,
            ),
            bucket: bucket,
          ),
        ),
      // ),
      bottomNavigationBar: Material(

        // color: Colors.transparent,
        color: Color(0xFF035AA6),
        elevation: 0,

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            child: BottomAppBar(
              height: 65,
              // color: Colors.redAccent,
              notchMargin: 3,
              //shape: CircularNotchedRectangle(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TabBar(
                  tabs: [
                    Tab(
                        icon: Icon(Icons.home),
                        text: "Home"
                    ),
                    Tab(
                      icon: Icon(Icons.chair_alt_outlined),
                      text: "Chairs",
                    ),
                    Tab(
                      icon: Icon(Icons.table_restaurant_rounded),
                      text: "Tables",
                    ),
                    Tab(
                      icon: Icon(Icons.bed),
                      text: "Beds",
                    ),
                    Tab(
                      icon: Icon(Icons.chair),
                      text: "Sofas",
                    ),



                    Tab(
                      icon:Stack(
                        children: [
                          Icon(Icons.shopping_cart,size: 25),
// GetBuilder<MyHomePageController>(
//   builder: (controller) {
//     return Positioned(
//       left: 10,
//       bottom: 10,
//       child: Container(
//         height: 13,
//         width: 13,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.white,
//           ),
//           color: Colors.redAccent,
//         ),
//         child: Center(
//           child: Container(
//             child: Text(
//             controller.cartList.length.toString(),
//               style: TextStyle(
//                 color: Colors.white
//               ),
//             ),
//           ),
//         )
//
//       ),
//     );
//   }
// )
                        ],
                      ),
                      text: "Cart",
                    ),
                  ],
                  labelStyle: TextStyle(fontSize: 10),
                  labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  labelColor: Color(0xFF035AA6),

                  unselectedLabelColor: Colors.grey,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(5.0),
                  // indicatorColor: AppColor.textLightBlueBlack,
                  controller: tabController,
                  indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 65.0),
                    borderSide: BorderSide(color:  Color(0xFFFFA41B), width: 3),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


