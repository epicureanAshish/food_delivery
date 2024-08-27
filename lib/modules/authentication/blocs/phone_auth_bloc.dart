import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_auth_event.dart';
part 'phone_auth_state.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  PhoneAuthBloc() : super(PhoneAuthInitial()) {
    on<PhoneAuthValidate>(phoneAuthValidate);
  }


  FutureOr<void> phoneAuthValidate(PhoneAuthValidate event, Emitter<PhoneAuthState> emit) {
    if(event.mobile?.length==10){
      emit.call(PhoneAuthValidationSuccess(event.mobile));
    }else{
      emit.call(PhoneAuthValidationFailure(event.mobile));
    }
  }
}
