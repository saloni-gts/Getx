import 'package:get/get.dart';
import 'package:getx/product.dart';

class MyHomePageController extends GetxController {
  RxInt count = 0.obs;
  int isInCart = 0;

  List<Product> cartList=[];

  addToCart(Product val){
    cartList.add(val);
    print("cartList==${cartList.length}");
    update();
  }
  removeFromCart(Product val){
    for(int i=0;i<cartList.length;i++){
      if(val.id==cartList[i].id){
          cartList.remove(cartList[i]);
      }
    }
    update();
  }


  setCart(){
 if(isInCart==1){
   isInCart=0;
 }else{
   isInCart=1;
 }
 print("isInCart==${isInCart}");
 update();
  }


  RxString str="hello".obs;

  increment() {
    count.value=count.value+1;
    print(" count.value====${ count.value}");

  }

  Product? selectedProd;
  setSelectedProd(Product val) {
    selectedProd = val;
    update();
  }


 bool chekButton=false;

setCkhButton(){
  chekButton=!chekButton;

  print("tapvaluee====${chekButton}");
  update();
}

  addTolIst(String str){
    lst.add(str);
  }

List lst=["item1","item2","item3","item4","item5","item6","item7"];

int finAmt=0;

setFinAmt(int amt){
  finAmt=amt;
  update();
}

int crtAmt=0;
calAmt(){
  crtAmt=0;
  finAmt=0;
  for(int i=0;i<cartList.length;i++){
    crtAmt=crtAmt+cartList[i].price;
  }
  finAmt=crtAmt+100;

  update();
}


}