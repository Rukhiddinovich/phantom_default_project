import 'package:default_project/data/network/repository/category_repository.dart';
import 'package:default_project/data/network/repository/user_repository.dart';
import 'package:default_project/ui/product_profile/product_screen.dart';
import 'package:default_project/ui/user/user_screen.dart';
import 'package:flutter/material.dart';

import '../data/network/provider/api_provider.dart';
import '../data/network/repository/product_repository.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key, required this.apiProvider}) : super(key: key);

  final ApiProvider apiProvider;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];
  int activePage = 0;

  late ProductRepository productRepository;
  late UserRepository userRepository;
  late CategoryRepository categoryRepository;

  @override
  void initState() {
    productRepository = ProductRepository(apiProvider: widget.apiProvider);
    userRepository = UserRepository(apiProvider: widget.apiProvider);
    categoryRepository = CategoryRepository(apiProvider: widget.apiProvider);

    screens.add(ProductsScreen(
      productRepository: productRepository,
      categoryRepository: categoryRepository,
    ));
    screens.add(UsersScreen(
      userRepository: userRepository,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activePage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: Colors.black,
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            label: "Users",
          ),
        ],
      ),
    );
  }
}
