import 'package:dio/dio.dart';
import 'package:workshop4/model/register_model.dart';

import 'endpoint.dart';

class DioHelper{

static late Dio dio;
 static init(){
   dio =Dio(
     BaseOptions(
       baseUrl: baseUrl,
       headers: {
         'Accept':'application/json',
         'Content-Type': 'application/json',
       }
     )
   );
 }

static Future<Response> getData({
 required String url,
  Map<String,dynamic>? queryParameters,
   String? token,
})async{
   try{
   dio.options.headers={
     'Authorization' :'Bearer ${token ?? ""}'
   };
 Response response=await  dio.get(url,
   queryParameters: queryParameters);
 return response;
 }
 catch(e){
   rethrow;
   }
 }


static Future<Response> postData({
  required String url,
  Map<String,dynamic>? queryParameters,
  String? token,
  required Map<String,dynamic> data,
})async{
  try{
    dio.options.headers={
      'Authorization' :'Bearer ${token ?? ""}'
    };
    Response response=await  dio.post(url,
        data: data,
        queryParameters: queryParameters);
    return response;
  }
  catch(e){
    rethrow;
  }
}


}