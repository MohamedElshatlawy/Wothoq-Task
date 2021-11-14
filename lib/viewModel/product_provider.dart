import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/product_model.dart';
import 'package:v_room_app/repository/product_repo.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final productProvider =
    ChangeNotifierProvider<ProductProvider>((ref) => ProductProvider());

class ProductProvider extends ChangeNotifier {
  ProductModel fetchDate;
  int counter = 0;

  Future<ProductModel> getData() async {
    try {
      var response = await ProductRepository().productRequest();
      fetchDate = response;
      notifyListeners();
      return response;
    } catch (error) {
      print(error);
    }
  }

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter <= 0) {
      return;
    }
    counter--;
    notifyListeners();
  }

  void successDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: CustomText(
              text: S.current.product_added,
            ),
            contentPadding: EdgeInsets.all(20),
            actions: [
              CustomRoundedButton(
                text: S.current.ok,
                height: 50.h,
                pressed: () {
                  Navigator.pop(context);
                  counter = 0;
                  notifyListeners();
                },
              )
            ],
          );
        });
  }

  ProductProvider() {
    getData();
  }
}
