import 'package:flutter/material.dart';
import 'package:fluttercourse/app_state.dart';
import 'package:fluttercourse/home_screen/checkout_widget.dart';
import 'package:fluttercourse/home_screen/menu_item.dart';
import 'package:fluttercourse/models/product.dart';

import '../data/product_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6E6E6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Menu"),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  static const gridViewChildAspectRatio = 171 / 224;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final products = await ProductService().fetchProducts();
    setState(() {
      this.products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: Body.gridViewChildAspectRatio,
            children: <Widget>[
              for (int i = 0; i < products.length; i++)
                MenuItem(products[i], () {
                  setState(() {});
                }),
            ],
          ),
        ),
        CheckoutWidget(
          totalPrice: cart.totalPrice,
          totalProducts: cart.totalProducts,
        )
      ],
    );
  }
}
