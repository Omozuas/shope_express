import 'package:cityfood/services/Apis/product_api/productApi.dart';
import 'package:cityfood/services/models/providers/singleProduct_provider/singleProduct_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProductPage extends StatefulWidget {
  const ViewProductPage({super.key});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProduct();
  }

  ProductModelById? _productModel;
  var id = '';

  void getProduct() async {
    final preferences = await SharedPreferences.getInstance();
    final get = Provider.of<ProductProviderApi>(context, listen: false);
    get
        .getAProduct(
            preferences.getString('token')!, preferences.getString('productId'))
        .then((value) {
      setState(() {
        _productModel = value.finalproduct;
        id = _productModel!.id;
        print(_productModel!.ratings);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<ProductProviderApi>();

    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, bottom: 15, top: 15),
        child: Row(
          children: [
            Flexible(
              child: Container(
                width: 650,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 650,
                      height: 450,
                      // color: Colors.grey[200],
                      child: Center(
                          child: Image.asset(
                        'assets/images/clothes1.png',
                        width: 400,
                        height: 400,
                      )),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/clothes1.png',
                                    width: 120,
                                    height: 120,
                                  )),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/clothes1.png',
                                    width: 120,
                                    height: 120,
                                  )),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/clothes1.png',
                                    width: 120,
                                    height: 120,
                                  )),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/clothes1.png',
                                    width: 120,
                                    height: 120,
                                  )),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [

    //     // SizedBox(
    //     //   height: 300,
    //     // ),
    //     // get.loading
    //     //     ? CircularProgressIndicator()
    //     //     : Container(
    //     //         child: Text(id),
    //     //       ),
    //     // InkWell(
    //     //   onTap: () async {
    //     //     getProduct();
    //     //   },
    //     //   child: Text("data"),
    //     // )
    //   ],
    // );
  }
}
