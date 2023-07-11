import 'package:default_project/data/network/repository/category_repository.dart';
import 'package:default_project/ui/product_profile/widgets/category_selecter.dart';
import 'package:flutter/material.dart';

import '../../data/network/repository/product_repository.dart';
import '../../models/product/products_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.productRepository,
    required this.categoryRepository,
  }) : super(key: key);

  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String activeCategoryName = "";

  List<ProductModel> products = [];
  List<String> categories = [];

  bool isLoading = false;

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    products = await widget.productRepository
        .getProductsByCategory(activeCategoryName);
    setState(() {
      isLoading = false;
    });
  }

  _init() async {
    categories = await widget.categoryRepository.getAllCategories();
  }

  @override
  void initState() {
    _init();
    _updateProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products screen"),
      ),
      body: Column(
        children: [
          categories.isNotEmpty
              ? CategorySelector(
                  categories: categories,
                  onCategorySelected: (selectedCategory) {
                    activeCategoryName = selectedCategory;
                    _updateProducts();
                  },
                )
              : const Center(child: CircularProgressIndicator()),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(products[index].title),
                        leading: Image.network(
                          products[index].image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
