import 'package:bloc/bloc.dart';

part 'password_visible_state.dart';

class PasswordVisibleCubit extends Cubit<PasswordVisibleState> {
  PasswordVisibleCubit() : super(PasswordVisibleState(isVisible: false));

  void changeIsVisible() =>
      emit(PasswordVisibleState(isVisible: !state.isVisible));
}
