import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop4/controller/remote/dio/dio_helper.dart';
import 'package:workshop4/model/register_model.dart';
import '../../remote/dio/endpoint.dart';
part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());
static  JobCubit get(context)=> BlocProvider.of(context);

getDataProfile() {
  DioHelper.getData(url: profileEndPoint
  );
}
  getDataSearch(String name)async{

   Response response=
   await DioHelper.getData(url: SearchEndPoint,
    queryParameters: {
      'name': name,
      }
    );
  }
  RegisterModel registerModel =RegisterModel();
  Data data=Data();
  postRegister(String name ,String email,
      String password)async{
   Response response=await DioHelper
     .postData(url: registerEndPoint,
      data: data.toJson(),

      // {
      //   'name':name,
      //   'email': email,
      //   'password':password
      // }
      );
  }


}

