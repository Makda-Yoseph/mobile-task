import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_bloc.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_state.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_event.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/widgets/cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch groceries when the page initializes
    context.read<HomeBloc>().add(ImageFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '🍔 Burger',
          style: GoogleFonts.roboto(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocBuilder<HomeBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ImageLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.65, 
              ),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final grocery = state.items[index];
                return GroceryCard(grocery: grocery);
              },
            );
          } else if (state is ImageLoadFailState) {
            return Center(child: Text('Failed to load groceries'));
          }
          return Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }
}