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
    getProduct();
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
        ),
        get.loading
            ? CircularProgressIndicator()
            : Container(
                child: Text(id),
              ),
        InkWell(
          onTap: () async {
            getProduct();
          },
          child: Text("data"),
        )
      ],
    );
  }
}
