import 'package:flutter/material.dart';
import 'package:furniture_app/model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff624E88),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          BackButton(
                            color: const Color(0xff624E88),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Text(
                            'Back',
                            style: TextStyle(
                              color: Color(0xff624E88),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.6,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.width,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Image.network(
                                  productModel.image ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        productModel.title ?? '',
                        style: const TextStyle(
                          color: Color(0xff624E88),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        productModel.description ?? '',
                        style: TextStyle(
                          color: const Color(0xff624E88).withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(40),
              decoration: const BoxDecoration(
                  color: Color(0xffE4B1F0),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  'BUY NOW ₹ ${productModel.price}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
