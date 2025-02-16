abstract class AddCartState{}
class AddCartInitial extends AddCartState{}
class AddCartLoading extends AddCartState{}
class AddCartFailure extends AddCartState{
  final String errMessage;
  AddCartFailure({required this.errMessage});
}

class AddCartSuccess extends AddCartState{}
