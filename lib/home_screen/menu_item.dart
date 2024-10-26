import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/app_state.dart';
import 'package:fluttercourse/models/cart.dart';
import 'package:fluttercourse/models/product.dart';

class MenuItem extends StatelessWidget {
  final Product product;
  final VoidCallback onProductsChange;

  const MenuItem(this.product, this.onProductsChange, {super.key});

  @override
  Widget build(BuildContext context) {
    final image = product.image;
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xffFFFFFF),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Image.network(
                image,
                fit: BoxFit.cover,
                height: constraints.maxHeight * 0.4,
                width: double.infinity,
              ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  color: Color(0xff5B5B5B),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "\$${product.price}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color(0xffDF2F31),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Spacer(),
            CounterWidget(product,onProductsChange),
            const SizedBox(
              height: 8,
            ),
          ],
        );
      }),
    );
  }
}

const Color _counterWidgetColor = Color(0xffDF9321);

class CounterWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onProductsChange;

  const CounterWidget(this.product, this.onProductsChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CounterButton(
          Icons.remove,
          () {
            cart.removeFromCart(product);
            onProductsChange();
          },
        ),
         Text(
          product.count.toString(),
          style: const TextStyle(
            color: _counterWidgetColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        CounterButton(
          Icons.add,
          () {
            cart.addToCart(product);
            onProductsChange();
          },
        ),
      ],
    );
  }
}

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTapCallback;

  const CounterButton(this.icon, this.onTapCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: _counterWidgetColor),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 16,
          color: _counterWidgetColor,
        ),
      ),
    );
  }
}
