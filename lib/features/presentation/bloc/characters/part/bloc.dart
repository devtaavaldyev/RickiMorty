import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_ricki_2/features/presentation/bloc/characters/characters_bloc.dart';

class CharacterBloc implements Bloc<CharacterEvents, CharacterStates> {
  @override
  void add(CharacterEvents event) {}

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  void emit(CharacterStates state) {}

  @override
  bool get isClosed => throw UnimplementedError();

  @override
  void on<E extends CharacterEvents>(EventHandler<E, CharacterStates> handler,
      {EventTransformer<E>? transformer}) {}

  @override
  void onChange(Change<CharacterStates> change) {}

  @override
  void onError(Object error, StackTrace stackTrace) {}

  @override
  void onEvent(CharacterEvents event) {}

  @override
  void onTransition(Transition<CharacterEvents, CharacterStates> transition) {}

  @override
  CharacterStates get state => throw UnimplementedError();

  @override
  Stream<CharacterStates> get stream => throw UnimplementedError();
}
