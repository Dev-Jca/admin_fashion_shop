import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_fashion_shop/db/brand.dart';
import 'package:admin_fashion_shop/db/category.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  late String _currentCategory;
  late String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color green = Colors.green;
  String? _selectedCategory; // Field

  @override
  void initState() {
    // _getCategories();
    //  _getBrand();
    // getCategoriesDropDown();
    print(categoriesDropDown.length);
    // currentCategory = categoriesDropDown[0].value!;

    super.initState();
  }

//Creating Method for a list of DropDownMenuItems that are Strings that will be gotten from firestore
  // void getCategoriesDropDown() {
  //   for (int index = 0; index < categories.length; index++) {
  //     setState(() {
  //       categoriesDropDown.insert(
  //         0,
  //         DropdownMenuItem(
  //           value: categories[index]['category'],
  //           child: Text(
  //             categories[index]['category'],
  //           ),
  //         ),
  //       );
  //     });
  //   }

  //   for (DocumentSnapshot category in categories) {
  //     dropDownItems.add(
  //       DropdownMenuItem(
  //         value: category['category'],
  //         child: Text(category['category']),
  //       ),
  //     );
  //   }
  // }

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
        child: Column(
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
//code for the drop down
            FutureBuilder<QuerySnapshot>(
              future: _categoryService.getAll(),
              builder: (context, snapshot) {
                print(snapshot.connectionState);

                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                print("Docs ${snapshot.data!.size}");

                final list =
                    snapshot.data!.docs.map((e) => e["category"]).toList();

                return DropdownButton(
                  items: list.map((value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  value: _selectedCategory ?? list[0] as String,
                  onChanged: (String? newVal) {
                    setState(() {
                      _selectedCategory = newVal;
                    });
                  },
                );
              },
            ),
//==================TYPEAHEAD CODE ==================================================
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: TypeAheadField(
            //     textFieldConfiguration: const TextFieldConfiguration(
            //       autofocus: false,
            //       // style: DefaultTextStyle.of(context)
            //       //     .style
            //       //     .copyWith(fontStyle: FontStyle.italic),
            //       decoration: InputDecoration(hintText: 'product name'),
            //     ),
            //     suggestionsCallback: (pattern) async {
            //       return await _categoryService.getSuggestions(pattern);
            //     },
            //     itemBuilder: (context, suggestion) {
            //       return ListTile(
            //         leading: const Icon(Icons.category),
            //         title: Text(suggestion['category']),
            //       );
            //     },
            //     onSuggestionSelected: (suggestion) {
            //       // Navigator.of(context).push(MaterialPageRoute(
            //       //     builder: (context) => ProductPage(product: suggestion)));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // _getCategories() async {
  //   List<DocumentSnapshot> data = await _categoryService.getCategories();
  //   print(data.length);
  //   setState(() {
  //     categories = data;
  //     print(categories.length);
  //   });
  // }

//this happens when an item in the dropdown categories is clicked on
  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  void _getBrand() {}
}
