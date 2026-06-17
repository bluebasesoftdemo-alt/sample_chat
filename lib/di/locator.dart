import 'package:get_it/get_it.dart';

import '../features/login/data/datasource/login_remote_data_source/login_remote_data_source_impl.dart';
import '../features/login/data/repositories/login_repository_impl.dart';
import '../features/login/domain/usecase/login_usecase.dart';
import '../features/login/presentation/provider/login_provider.dart';

final locator = GetIt.instance;

void setLocator() {
  //Login
  locator.registerLazySingleton<LoginRemoteDataSourceImpl>(
    () => LoginRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<LoginRepositoryImpl>(
    () => LoginRepositoryImpl(
      loginRemoteDataSourceImpl: locator<LoginRemoteDataSourceImpl>(),
    ),
  );
  locator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepository: locator<LoginRepositoryImpl>()),
  );
  locator.registerFactory(
    () => LoginProvider(loginUseCase: locator<LoginUseCase>()),
  );
  //otp
  /* locator.registerLazySingleton<OtpRemoteDataSourceImpl>(() => OtpRemoteDataSourceImpl());
  locator.registerLazySingleton<OtpRepositoryImpl>(()=> OtpRepositoryImpl(otpRemoteDataSourceImpl: locator<OtpRemoteDataSourceImpl>()));
  locator.registerLazySingleton<OtpUseCase>(() => OtpUseCase(otpRepository: locator<OtpRepositoryImpl>()));
  locator.registerFactory(()=>OtpProvider(otpUseCase: locator<OtpUseCase>()));*/
  //profile
  /* locator.registerLazySingleton<ProfileRemoteDataSourceImpl>(() => ProfileRemoteDataSourceImpl());
  locator.registerLazySingleton<ProfileRepositoryImpl>(()=> ProfileRepositoryImpl(profileRemoteDataSourceImpl: locator<ProfileRemoteDataSourceImpl>()));
  locator.registerLazySingleton<ProfileUseCase>(() => ProfileUseCase(profileRepository: locator<ProfileRepositoryImpl>()));
  locator.registerFactory(()=>ProfileProvider(profileUseCase: locator<ProfileUseCase>()));*/
  //Search - Local
  /* locator.registerLazySingleton<LocalDataSourceImpl>(() => LocalDataSourceImpl());
  locator.registerLazySingleton<SearchRepositoryImp>(()=> SearchRepositoryImp(localDataSourceImpl: locator<LocalDataSourceImpl>()));
  locator.registerLazySingleton<SearchUseCase>(() => SearchUseCase(searchRepository: locator<SearchRepositoryImp>()));
  locator.registerFactory(()=>SearchProvider(searchUseCase: locator<SearchUseCase>()));*/

  //Home
  // locator.registerLazySingleton<HomeRemoteDataSourceImpl>(() => HomeRemoteDataSourceImpl());
  // locator.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl(locator<HomeRemoteDataSourceImpl>()));
  // locator.registerLazySingleton<HomeUseCase>(() => HomeUseCase(locator<HomeRepositoryImpl>()));
  // locator.registerFactory(()=>HomeProvider(locator<HomeUseCase>()));

  //Search - Remote
  /* locator.registerLazySingleton<RemoteDataSourceImpl>(() => RemoteDataSourceImpl());
  locator.registerLazySingleton<SearchRepositoryImp>(() => SearchRepositoryImp(remoteDataSourceImpl:locator<RemoteDataSourceImpl>()));
  locator.registerLazySingleton<SearchUseCase>(() => SearchUseCase(searchRepository: locator<SearchRepositoryImp>()));
  locator.registerFactory(()=>SearchProvider(searchUseCase: locator<SearchUseCase>()));*/

  //Search Key - Remote
  /*locator.registerLazySingleton<SearchKeyUseCase>(() => SearchKeyUseCase(searchRepository: locator<SearchRepositoryImp>()));
  locator.registerFactory(()=>SearchKeyProvider(searchKeyUseCase: locator<SearchKeyUseCase>()));*/

  //TakePicture
  /* locator.registerLazySingleton<UploadTakePictureDataSrcImpl>(() => UploadTakePictureDataSrcImpl());
  locator.registerLazySingleton<TakePictueRepositoryImpl>(() => TakePictueRepositoryImpl(uploadTakePictureDataSrcImpl: locator<UploadTakePictureDataSrcImpl>()));
  locator.registerLazySingleton<TakePictureUseCase>(() => TakePictureUseCase(takePictureRepository: locator<TakePictueRepositoryImpl>()));
  locator.registerLazySingleton(() => TakePictureProvider(takePictureUseCase: locator<TakePictureUseCase>()));*/

  //Address
  /*locator.registerLazySingleton<AddressRemoteDataSourceImpl>(() => AddressRemoteDataSourceImpl());
  locator.registerLazySingleton<AddressRepoImpl>(() => AddressRepoImpl(addressRemoteDataSourceImpl: locator<AddressRemoteDataSourceImpl>()));
  locator.registerLazySingleton<AddressUseCase>(() => AddressUseCase(addressRepo: locator<AddressRepoImpl>()));
  locator.registerLazySingleton(() => AddAddressProvider(addressUseCase: locator<AddressUseCase>()));*/

  //ItemProfile
  /*locator.registerLazySingleton<ItemProfileRemoteDataSourceImpl>(() => ItemProfileRemoteDataSourceImpl());
  locator.registerLazySingleton<ItemProfileRepositoryImpl>(() => ItemProfileRepositoryImpl(locator<ItemProfileRemoteDataSourceImpl>()));
  locator.registerLazySingleton<ItemProfileUseCase>(() =>ItemProfileUseCase(locator<ItemProfileRepositoryImpl>()));
  locator.registerLazySingleton(() => ItemProfileProvider(itemProfileUseCase: locator<ItemProfileUseCase>()));
*/
  //Add Cart
  /* locator.registerLazySingleton<CartRemoteDataSourceImpl>(() => CartRemoteDataSourceImpl());
  locator.registerLazySingleton<CartRepositoryImpl>(() => CartRepositoryImpl(locator<CartRemoteDataSourceImpl>()));
  locator.registerLazySingleton<CartUseCase>(() =>CartUseCase(locator<CartRepositoryImpl>()));
  locator.registerLazySingleton(() => CartProvider(cartUseCase: locator<CartUseCase>()));*/
  // Place Order
  /* locator.registerLazySingleton<OrderRemoteDataSourceImpl>(() => OrderRemoteDataSourceImpl());
  locator.registerLazySingleton<OrderDetailsRepositoryImpl>(() => OrderDetailsRepositoryImpl(locator<OrderRemoteDataSourceImpl>()));
  locator.registerLazySingleton<OrderDetailsUseCase>(() =>OrderDetailsUseCase(locator<OrderDetailsRepositoryImpl>()));
  locator.registerLazySingleton(() => OrderDetailsProvider(locator<OrderDetailsUseCase>()));*/
}
