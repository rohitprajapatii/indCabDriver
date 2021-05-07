import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import 'package:indcabdriver/Network/default_response.dart';
import 'package:indcabdriver/Network/request/intro/user_reg.dart';
import 'package:indcabdriver/Network/request/add_ratings.dart';
import 'package:indcabdriver/Network/request/add_wallet.dart';
import 'package:indcabdriver/Network/request/coupon_check.dart';
import 'package:indcabdriver/Network/request/emergency_raise.dart';
import 'package:indcabdriver/Network/request/favourite_adrs.dart';
import 'package:indcabdriver/Network/response/user_address.dart';
import 'package:indcabdriver/Network/response/booking_his.dart';
import 'package:indcabdriver/Network/response/login_result.dart';

import 'package:http/http.dart' as http;

part 'api_service.g.dart';

@RestApi(baseUrl: "http://3.140.249.61:8080")

abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;



  @GET('/driver/login?driverContactNo={id}')
  Future<HttpResponse> userLogin(@Path("id") String id);

  @POST('/user/registration')
  Future<HttpResponse> userRegistration(@Body() UserReg user);

  @GET('/booking_type/get')
  Future<HttpResponse>bookingType();

  @GET('/booking/get?userId=1')
  Future<List<BookinHis>> bookingHistory(@Path("id") String id);

  @POST('/wallet/add')
  Future<HttpResponse> walletAdd(@Body() AddWallet addWallet);

  @GET('/wallet/get?userId=1')
  Future<HttpResponse> getWallet(@Path("id") String id);

  @POST('/coupon/check')
  Future<HttpResponse> couponCheck(@Body() CouponCheck couponCheck);

  @POST('/favourite/add')
  Future<List<UserAddress>> favouriteAdrs(@Body() FavouriteAdrs favouriteAdrs);

  @GET('/favourite/get?userId=1')
  Future<HttpResponse> favouriteGetAdrs(@Path("id") String id);


  @POST('/rating/add')
  Future<HttpResponse> Ratingsadd(@Body() AddRatings addRatings);

  @POST('/booking/emergency/add')
  Future<HttpResponse> emergecy(@Body() Emergecy_Raise emergecy_raise);

  // @POST("/useraddress_edit")
  // Future<HttpResponse> editAddress(@Header("Authorization") String authHeader);
  //
  // @POST("/useraddress_add")
  // Future<HttpResponse> addAddress(@Header("Authorization") String authHeader);
  //
  // @GET("/useraddress_delete")
  // Future<HttpResponse> deleteAddress(@Header("Authorization") String authHeader);
  //
  // @GET("/myorder")
  // Future<HttpResponse> myOrder(@Header("Authorization") String authHeader);




// @GET("https://httpbin.org/get")
// Future<String> namedExample(
//     @Query("apikey") String apiKey,
//     @Query("scope") String scope,
//     @Query("type") String type,
//     @Query("from") int from
//     );}

// PUT("/tasks/{id}")
// Future<Task> updateTask(@Path() String id, @Body() Task task);

}