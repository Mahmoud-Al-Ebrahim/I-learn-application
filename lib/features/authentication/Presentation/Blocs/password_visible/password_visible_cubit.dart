import 'package:bloc/bloc.dart';
import '../password_visible/password_visible_state.dart';
class PasswordVisibleCubit extends Cubit<PasswordVisibleChanged> {
  PasswordVisibleCubit() : super(PasswordVisibleChanged(false,false));
bool passwordVisible=false;
bool confirmPasswordVisible=false;
void changeVisibility(bool passwordVisible,bool confirmPasswordVisible)
{
  this.passwordVisible=passwordVisible;
  this.confirmPasswordVisible=confirmPasswordVisible;
  emit(PasswordVisibleChanged(passwordVisible,confirmPasswordVisible));
}
}
