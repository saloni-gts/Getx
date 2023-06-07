import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:upi_india/upi_india.dart';

import 'getController.dart';

class UpiPayment extends StatefulWidget {
  const UpiPayment({Key? key}) : super(key: key);

  @override
  State<UpiPayment> createState() => _UpiPaymentState();
}

class _UpiPaymentState extends State<UpiPayment> {
  @override
Future<UpiResponse>?transaction;
  List<UpiApp>? apps;
  final UpiIndia _upi=UpiIndia();

  void initState(){
    _upi.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
        print("length=====");
     print(apps?.length);
      });
    }).catchError((e) {
      print("erroeerrr===>${e}");
      apps = [];
    });
    super.initState();
  }

  MyHomePageController controller = Get.put(MyHomePageController());
  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upi.startTransaction(
      app: app,
      receiverUpiId: "8130706830@ybl",
      receiverName: 'Jyoti',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }


  Widget displayUpiApps() {
    print("appsappsapps==>>${apps}");
    print("appsapps length==>>${apps?.length}");


    if (apps == null)
       return Center(
      child: Text(
        "No apps found to handle online transaction.",

        style: TextStyle(
            fontSize: 18,
            color: Colors.black
        ),
      ),
    );
    else if (apps!.length == 0)
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No apps found to handle transaction. \n Please choose 'Cash On Delivery'option",
               textAlign:TextAlign.center ,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width*.65,

                    child: Text(

                     "   Pay cash on delivery",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          ),
                    ),
                  ),
                  new Spacer(),



                  GetBuilder<MyHomePageController>(
                        builder: (newController) {
                          return Checkbox(
                                activeColor: Colors.blueAccent,
                                value:  newController.chekButton,
                                // groupValue: ,
                                onChanged: (value) {
                                  newController.setCkhButton();

                                  print("newController.chekButton====${newController.chekButton}");
                                  if(newController.chekButton){
                                    Fluttertoast.showToast(msg:"Order Placed Successfully" ,

                                    );
                                  }

                                }
                            );
                        }
                      )





                ],
              ),
            )

          ],
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }
  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }
  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: TextStyle(
            fontSize: 18,
            color: Colors.black
          )),
          Flexible(
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
              )
              )),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: transaction,
              builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                          )
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),


    );
  }
}
