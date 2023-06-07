import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getx/upiPayment.dart';

import 'longbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addressCntroler = new TextEditingController();

  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: LongButton(text: "Proceed To Payment Screen",context: context,onTap1: (){

          print("state===>${stateValue}");
          print("city===>${cityValue}");
          print("add===>${addressCntroler.text}");

          if(stateValue.isEmpty && cityValue.isEmpty && addressCntroler.text.isEmpty){
            Fluttertoast.showToast(
                msg: "Please fill up the details to continue",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                fontSize: 16.0
            );

          }else if(stateValue.isEmpty){
            Fluttertoast.showToast(
                msg: "Choose State ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                fontSize: 16.0
            );
          }else if(cityValue.isEmpty){
            Fluttertoast.showToast(
                msg: "Choose Ciyt",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                fontSize: 16.0
            );
          }else if(addressCntroler.text.isEmpty){
            Fluttertoast.showToast(
                msg: "Enter the Address",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                fontSize: 16.0
            );
          }
          else if(stateValue.isNotEmpty && cityValue.isNotEmpty && addressCntroler.text.isNotEmpty){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpiPayment()));

          }

        }),
      ),
      backgroundColor:  Color(0xFF035AA6),
      appBar: AppBar(
        // title: Text('Delivery Address'),
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.pin_drop,
              color:  Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
          // color: Colors.amberAccent,

          height: MediaQuery.of(context).size.height*.65,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              )),


          padding: EdgeInsets.symmetric(horizontal: 20),
          // height: 450,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),

              Text("Fill up the delivery details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "assets/fonts/Poppins-Bold.ttf",
              ),
              ),

SizedBox(
  height: 15,
),
              ///Adding CSC Picker Widget in app
              CSCPicker(

                // disableCountry: true,
                disableCountry: true,
                defaultCountry:CscCountry.India,
                ///Enable disable state dropdown [OPTIONAL PARAMETER]
                showStates: true,

                /// Enable disable city drop down [OPTIONAL PARAMETER]
                showCities: true,

                ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1)),

                ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey.shade300,
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1)),

                ///selected item style [OPTIONAL PARAMETER]
                selectedItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                dropdownHeadingStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),

                ///DropdownDialog Item style [OPTIONAL PARAMETER]
                dropdownItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),

                ///Dialog box radius [OPTIONAL PARAMETER]
                dropdownDialogRadius: 10.0,

                ///Search bar radius [OPTIONAL PARAMETER]
                searchBarRadius: 10.0,

                ///triggers once country selected in dropdown
                onCountryChanged: (value) {
                  setState(() {
                    print("value====${value}");
                    ///store value in country variable
                    countryValue = value;
                  });
                },



                onStateChanged: (value) {
                  setState(() {
                    stateValue = value ?? "";
                  });
                },

                onCityChanged: (value) {
                  setState(() {
                    ///store value in city variable
                    cityValue = value ?? "";
                  });
                },
              ),

              ///print newly selected country state and city in Text Widget
              TextButton(
                  onPressed: () {
                    setState(() {
                      print("stateValuestateValue===${stateValue}");
                      address = "$cityValue, $stateValue, $countryValue";
                    });
                  },
                  child: Text("Print Data")),
              Text(address),

              SizedBox(
                height: 20,
              ),

              // Text("hello"),

              TextField(
                  controller: addressCntroler,
                  minLines: 1,
                  maxLines: 5,

                  decoration: InputDecoration(
                    hintText: "Enter Your Address...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      // fontStyle: FontStyle.italic,
                    ),
                    border: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  )),

              SizedBox(
                height: 10,
              ),


            ],
          )),
    );
  }
}
