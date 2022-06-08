import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_fashion_shop/db/brand.dart';
import 'package:admin_fashion_shop/db/category.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  late String currentCategory;
  late String currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color green = Colors.green;

  @override
  void initState() {
    _getCategories();
    categoriesDropDown = getCategoriesDropDown();
    currentCategory = categoriesDropDown[0].value!;

    super.initState();
  }

//Creating Method for a list of DropDownMenuItems that are Strings that will be gotten from firestore
  List<DropdownMenuItem<String>> getCategoriesDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (DocumentSnapshot category in categories) {
      dropDownItems.add(
        DropdownMenuItem(
          value: category['category'],
          child: Text(category['category']),
        ),
      );
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(
          Icons.close,
          color: black,
        ),
        title: Text(
          'add product',
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.5, color: grey.withOpacity(0.5)),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                        child: Icon(
                          Icons.add,
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.5, color: grey.withOpacity(0.5)),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                        child: Icon(
                          Icons.add,
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.5, color: grey.withOpacity(0.5)),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                        child: Icon(
                          Icons.add,
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'enter a product name with 10 characters at maximum',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: green,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productNameController,
                decoration: const InputDecoration(hintText: 'product name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You must enter the product name';
                  } else if (value.length > 10) {
                    return "product name can't have more than 10 letter";
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: DropdownButton(
                  value: currentCategory,
                  items: categoriesDropDown,
                  onChanged: changeSelectedCategory()),
            )
          ],
        ),
      ),
    );
  }

  void _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    setState(() {
      categories = data;
    });
  }

  changeSelectedCategory() {}
}
