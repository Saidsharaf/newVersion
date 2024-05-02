import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/login_model.dart';
import 'package:revive/modules/betweenOwner_Customer/profile_screen/state.dart';


class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(profileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  
}
