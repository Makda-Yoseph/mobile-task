



import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_task/core/connection%20checker/connection.dart';
import 'package:mobile_task/feauture/grocery/data_layer/data_source/local_data_source.dart/local_data_source_grocery.dart';
import 'package:mobile_task/feauture/grocery/data_layer/data_source/remote_data_source.dart/remote_source.dart';
import 'package:mobile_task/feauture/grocery/data_layer/repository/grocery_repository_impl.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/repository/grocery_repository.dart';
import 'package:mobile_task/feauture/grocery/domain_layer/usecases/get_all_grocery.dart';
import 'package:mobile_task/feauture/grocery/presentation_layer/blocs/home_bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  var sharedPreference = await SharedPreferences.getInstance();
  var client = http.Client();
  var connectionChecker = Connectivity();

  // Register services
  getIt.registerSingleton<SharedPreferences>(sharedPreference);
  getIt.registerSingleton<http.Client>(client);
  getIt.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker());

  // Register services that depend on others
  getIt.registerSingleton<LocalDataSrc>(LocalDataSrc());
  getIt.registerSingleton<NetworkInfo>(NetworkInfo(getIt()));
  // getIt.registerSingleton<RemoteSource>(RemoteSource(client: getIt()));
  // getIt.registerSingleton<RemoteSourceImpl>(RemoteSourceImpl(client: getIt()));
  getIt.registerSingleton<RemoteSourceImpl>(RemoteSourceImpl(client: getIt()));

  
  // Register repository and use case
  getIt.registerSingleton<GroceryRepository>(ProductRepositoryImpl(
    remoteSource: getIt<RemoteSourceImpl>(),
    localDataSrc: getIt<LocalDataSrc>(),
    networkInfo: getIt<NetworkInfo>(),
  ));
  // getIt.registerSingleton<Userrepo>(UserRepoImpl(remoteSrc:getIt<RemoteSrcImpl>(),));
  // getIt.registerSingleton<Signup>(Signup(getIt<Userrepo>()));
  // getIt.registerSingleton<Signin>(Signin(getIt<Userrepo>()));
  // final getIt = GetIt.instance;

// Register the HomeBloc using the GetAllGrocery use case
// getIt.registerSingleton<HomeBloc>(HomeBloc(getallgrocery: getIt<GetAllGrocery>()));

  getIt.registerSingleton<GetAllGrocery>(GetAllGrocery(getIt<GroceryRepository>()));
  getIt.registerSingleton<HomeBloc>(HomeBloc(getallgrocery: getIt<GetAllGrocery>()));
  // getIt.registerSingleton<AddProduct>(AddProduct(getIt<productRepo>()));
  // getIt.registerSingleton<AddBloc>(AddBloc());
  // getIt.registerSingleton<Updateprod>(Updateprod(getIt<productRepo>()));
  // getIt.registerSingleton<UpdateBloc>(UpdateBloc());
  // getIt.registerSingleton<Deleteprod>(Deleteprod(getIt<productRepo>()));
  // getIt.registerSingleton<DeleteBlock>(DeleteBlock());
  // getIt.registerSingleton<UserBloc>(UserBloc());
  // getIt.registerSingleton<SigninBloc>(SigninBloc());

  
}
 



