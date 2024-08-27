import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/entities/grocery_entity.dart';

class Detail extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<Detail> {
  late GroceryEntity grocery;
  bool isFavorite = false; // State for the favorite icon
  List<bool> isChecked = []; // State for checkboxes

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    grocery = ModalRoute.of(context)?.settings.arguments as GroceryEntity;
    isChecked = List<bool>.filled(grocery.option.length, false); // Initialize the checkbox states
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        grocery.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 400,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.white, // Change color based on state
                          size: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite; // Toggle favorite state
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('${grocery.title}', style: GoogleFonts.roboto(fontSize: 25)),
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
                          fontSize: 25,
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
                          fontSize: 25,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          '${grocery.rating}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(170, 170, 170, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all Reviews',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                ],
              ),
              SizedBox(height: 3),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Text(
                      'Description: ${grocery.description}',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See more',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text('Additional Options', style: GoogleFonts.poppins(fontSize: 20)),
              Column(
                children: grocery.option.map((option) {
                  int index = grocery.option.indexOf(option);
                  return Row(
                    children: [
                      Expanded(
                        child: Text(option.name),
                      ),
                      Text('\$${option.price.toStringAsFixed(2)}'),
                      IconButton(
                        icon: Icon(
                          isChecked[index] ? Icons.check_box : Icons.check_box_outline_blank,
                        ),
                        onPressed: () {
                          setState(() {
                            isChecked[index] = !isChecked[index]; // Toggle checkbox state
                          });
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),

              SizedBox(height: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}
