import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/Controller/FirebaseFireStore.dart';
import 'package:home_food_inventory_app/Controller/UserProvider.dart';
import 'package:home_food_inventory_app/Controller/utils.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemDescriptionController =
      TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _itemNameController.dispose();
    _itemDescriptionController.dispose();
    _categoryController.dispose();
    _expiryDateController.dispose();
    _quantityController.dispose();
    _locationController.dispose();
  }

  void addProduct(String uid) async {
    setState(() {
      _isLoading = true;
    });
    String res = await FirebaseFireStore().uploadProduct(
      uid,
      _itemNameController.text,
      _itemDescriptionController.text,
      _categoryController.text,
      _expiryDateController.text,
      _quantityController.text,
      _locationController.text,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'Added') {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
  }

  void clearText(){
    _itemNameController.clear();
    _itemDescriptionController.clear();
    _categoryController.clear();
    _expiryDateController.clear();
    _quantityController.clear();
    _locationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(icon: const Icon(Icons.upload),
    //   onPressed: (){},)
    // );
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: const Text('Add Item'),
        //centerTitle: false,
        actions: [
          TextButton(
              onPressed: () => addProduct(userProvider.getUser.uid),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: _itemNameController,
                    decoration: const InputDecoration(
                      hintText: 'Item Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: AspectRatio(
                      aspectRatio: 600 / 600,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSTGwYgQzMGFfjJTx-VEoOwuRkRwpQvbF11WEkxF8_hdHYzKhCP&usqp=CAY'),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _itemDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'Item Description',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: 'Category',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      controller: _expiryDateController,
                      decoration: const InputDecoration(
                        hintText: 'Expiry Date',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        hintText: 'Quantity',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  hintText: 'Location',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(onPressed: clearText, style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all(Colors.lightGreen)
            ), child: const Text("Clear"),)
          ],
        ),
      ),
    );
  }
}
