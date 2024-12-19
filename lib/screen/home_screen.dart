import 'package:flutter/material.dart';
import 'package:furniture_app/api_service/api_services.dart';
import 'package:furniture_app/model/product_model.dart';
import 'package:furniture_app/screen/home_page_header.dart';
import 'package:furniture_app/screen/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  List<ProductModel> productModel = [];
  List<ProductModel> filterProduct = [];
  bool isLoading = true;

  void getProducts() async {
    ApiServices().getProducts().then((value) {
      productModel = value!;
      isLoading = false;
      setState(() {});
    }).onError((err, s) {
      print('Error => $err');
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (searchController.text.isEmpty) {
      filterProduct = productModel;
    } else {
      filterProduct = [];
      filterProduct = productModel
          .where((product) => product.title!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    return Scaffold(
      backgroundColor: const Color(0xff624E88),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageHeader(
              searchController: searchController,
              onChanged: (String value) {
                setState(() {});
              },
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Visibility(
                    visible: isLoading == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff624E88),
                      ),
                    ),
                    child: Visibility(
                      visible: filterProduct.isNotEmpty,
                      replacement: Center(
                        child: Text(
                          'No Product Found!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        ),
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        itemCount: filterProduct.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    productModel: filterProduct[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 150,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffE4B1F0),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              filterProduct[index].title ?? '',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff624E88),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 40,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                              color: Color(0xff7E60BF),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '₹ ${filterProduct[index].price.toString()}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Center(
                                        child: Image.network(
                                            filterProduct[index].image ?? ''),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
