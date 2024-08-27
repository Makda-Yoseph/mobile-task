import 'package:flutter/material.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';

class GroceryCard extends StatefulWidget {
  final GroceryEntity grocery;

  GroceryCard({required this.grocery});

  @override
  _GroceryCardState createState() => _GroceryCardState();
}

class _GroceryCardState extends State<GroceryCard> {
  bool _isHeartPressed = false;

  void _toggleHeart() {
    setState(() {
      _isHeartPressed = !_isHeartPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final grocery = widget.grocery;

    return Card(
      elevation: 150,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: grocery);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150, // Set the desired height
                      child: Image.network(
                        grocery.imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          grocery.title,
                          style: TextStyle(
                            color: Color.fromRGBO(62, 62, 62, 1),
                            fontSize: 20,
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                  // SizedBox(height: 3),
                  Row(
                  
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          ' ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(170, 170, 170, 1),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.yellow),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              '${grocery.rating}', // Replace with actual rating if needed
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(170, 170, 170, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                       
                    ],
                  ),
                  SizedBox(height: 5),
                 Row(
  children: [
    if (grocery.discount != grocery.price) ...[
      SizedBox(width: 5),
      Padding(
        padding: EdgeInsets.only(left: 10, right: 2),
        child: Text(
          '\$${grocery.price.toString()}',
          style: TextStyle(
            color: Color.fromRGBO(139, 137, 137, 1),
            fontSize: 20,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          '\$${(grocery.price - grocery.discount).toString()}',
          style: TextStyle(
            color: Color.fromRGBO(173, 60, 60, 1),
            fontSize: 20,
          ),
        ),
      ),
    ] else
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          '\$${grocery.price.toString()}',
          style: TextStyle(
            color: Color.fromRGBO(173, 60, 60, 1),
            fontSize: 20,
          ),
        ),
      ),
  ],
),
                  SizedBox(height: 10),
                  
                       
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: _toggleHeart,
              child: Icon(
                _isHeartPressed ? Icons.favorite : Icons.favorite_border,
                color: _isHeartPressed ? Colors.red : Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
