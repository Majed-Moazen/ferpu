import 'package:ferpo/features/cart/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<AbstractState> {
  PaymentCubit() : super(InitialState());

  List<bool> selected = List.generate(
    3,
    (index) => false,
  );

  void togglePayment(int index) {
    selected = List.generate(
      3,
      (index) => false,
    );
    selected[index] = true;
    emit(ChangePaymentState());
  }
}
