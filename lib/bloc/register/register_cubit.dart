import 'dart:convert';
import 'package:day1/models/register/register.dart';
import 'package:day1/services/dio/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../services/shared-prefrence/cache_helper.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterHub?registerHub;
  userRegister(String name,String email,String password)
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: 'register',
        data:
        {
          'name':name,
          'email':email,
          'password':password,
        }).then((value) {
          print(value.data);
          var jsonData=jsonDecode(value.data);
          registerHub= RegisterHub.fromJson(jsonData);
          SharedPreferencesHelper.saveData(key: 'token', value: registerHub!.data!.accessToken);
          emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }
}
