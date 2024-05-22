import 'package:flutter/cupertino.dart';


class products extends ChangeNotifier {

  var eventProductList = [];      // 이벤트 상품
  var myProductList = [];         // 유저가 구매한 상품
  var cartProductList = [];       // 유저 장바구니 상품

  setProductList(type, list) {
    switch (type) {
      case "event" :
        eventProductList = list;
      case "mine" :
        myProductList = list;
      case "cart" :
        cartProductList = list;
    }
    notifyListeners();
  }
}

class product {

  var id;         //상품 ID
  var name;       //상품 이름
  var price;      //상품 가격
  var explain;    //상품 설명
  var event;      //상품 이벤트코드
  var main_image; //상품 이미지 URL
  var my_amount;  //상품 보유량 (default : -1)
  var amount;     //상품 총량
  var unit;       //상품 단위
  var discount;   //상품 할인율 (default : 0)

  product(this.id, this.name, this.price, this.explain, this.event, this.main_image, this.my_amount, this.amount, this.unit, this.discount);

}
