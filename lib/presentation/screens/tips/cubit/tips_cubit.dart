import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tips_state.dart';

class TipsCubit extends Cubit<TipsState> {
  TipsCubit() : super(const TipsState());
}
