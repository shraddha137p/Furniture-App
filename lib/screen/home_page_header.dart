import 'package:flutter/material.dart';
import 'package:furniture_app/model/product_model.dart';

class HomePageHeader extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;
  HomePageHeader(
      {super.key, required this.searchController, required this.onChanged});

  final List<ProductModel> productModel = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hay Shraddha',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              controller: searchController,
              onChanged:onChanged,
              decoration: const InputDecoration(
                  hintText: 'Search here...',
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xff624E88),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
