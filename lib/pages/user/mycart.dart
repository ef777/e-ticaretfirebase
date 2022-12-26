// my cart page with list of items in cart and total price of items in cart
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    var mycart;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: mycart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(mycart[index].image),
                      ),
                      title: Text(mycart[index].name),
                      subtitle: Text('Price: ' + mycart[index].price),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            mycart.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Total Price: ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Rs. 500',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: MaterialButton(
                child: Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Path: ankprj/lib/pages/user/myorders.dart
