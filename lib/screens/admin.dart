import 'package:admin_fashion_shop/screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admin_fashion_shop/db/brand.dart';
import 'package:admin_fashion_shop/db/category.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

enum Page { dashboard, manage }

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.lightGreen;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  BrandService _brandService = BrandService();
  CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.1,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//==================DASHBOARD & ICON ===============================
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedPage = Page.dashboard;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard,
                      color:
                          _selectedPage == Page.dashboard ? active : notActive,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                //==================MANAGE & ICON ===============================
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedPage = Page.manage;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      color: _selectedPage == Page.manage ? active : notActive,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Manage',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
//=================================BODY===========================================
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              subtitle: TextButton(
                onPressed: null,
                child: Row(
                  children: const [
                    Icon(
                      Icons.attach_money,
                      size: 30,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        '12,000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: const Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  //===================USERS CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.people_outline,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Users',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //===================CATEGORY CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.category,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Categories',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '23',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //===================PRODUCTS CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.track_changes,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Products',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '120',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //===================SOLD CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.tag_faces,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Sold',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '13',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //===================ORDERS CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.shopping_cart,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Orders',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //===================RETURN CARD=======================================
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                        title: TextButton(
                          onPressed: null,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.close,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Return',
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
//===============PAGE.MANAGE===============================================
      case Page.manage:
        return ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add product"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProduct()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.change_history),
              title: const Text("Products list"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text("Add category"),
              onTap: () {
                _categoryAlert();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Category list"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text("Add brand"),
              onTap: () {
                _brandAlert();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text("brand list"),
              onTap: () {},
            ),
            const Divider(),
          ],
        );

      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'category cannot be empty';
            }
            return null;
          },
          decoration: const InputDecoration(hintText: "add category"),
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              _categoryService.createCategory(categoryController.text);
              Fluttertoast.showToast(msg: 'category created');
              Navigator.pop(context);
            },
            child: const Text('ADD')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCEL')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'brand cannot be empty';
            }
            return null;
          },
          decoration: const InputDecoration(hintText: "add brand"),
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              _brandService.createBrand(brandController.text);
              Fluttertoast.showToast(msg: 'brand created');
              Navigator.pop(context);
            },
            child: const Text('ADD')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCEL')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}
