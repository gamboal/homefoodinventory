import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(icon: const Icon(Icons.upload),
    //   onPressed: (){},)
    // );

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
              onPressed: () {},
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
                decoration: const InputDecoration(
                  hintText: 'Item Description',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: TextField(
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
                decoration: const InputDecoration(
                  hintText: 'Location',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
