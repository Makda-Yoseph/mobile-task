import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_task/core/dependency_injections/service_locator.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_bloc.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_event.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/pages/detail_page.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/pages/home_page.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/pages/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();  
  runApp(MYApp());
}

class MYApp extends StatelessWidget {
  // final prdrep  = productRepo();
  
  @override
  Widget build(BuildContext context) {  
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(ImageFetch()),
        ),
        // BlocProvider(
        //   create: (context) => getIt<AddBloc>(),
        // ),
        // BlocProvider(
        //   create: (context) => getIt<AddBloc>(),
        // ),
        // BlocProvider(
        //   create: (context) => getIt<AddBloc>(),
        // ),
        // BlocProvider(
        //   create: (context) => getIt<AddBloc>(),
        // ),
        // BlocProvider(
        //   create: (context) => getIt<AddBloc>(),
        // ),
        // BlocProvider(
        //   create: (context)=> getIt<UpdateBloc>(),
        //   ),
        // BlocProvider(
        //   create:(context)=> getIt<DeleteBlock>(),
        //   ),
        // BlocProvider(
        //   create: (context)=>getIt<UserBloc>(),
        //   ),
        // BlocProvider(
        //   create: (context)=>getIt<SigninBloc>(),                                      
        //   )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          
          '/': (context) => SplashScreen(),
          // '/signin':(context)=> Signinpage(),
          // '/signup':(context)=> Signuppage(),
          '/homepage':(context)=>HomePage(),
          // '/update': (context) => up(),
          // '/updatingform':(context)=>Updatingform(),
          '/detail': (context) => Detail(),
          // '/search': (context) => Search(),
        },
      ),
    );
  }
}