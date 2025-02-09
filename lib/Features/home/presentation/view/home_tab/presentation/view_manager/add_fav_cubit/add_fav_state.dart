abstract class AddFavState{}
class AddFavInitial extends AddFavState{}
class AddFavLoading extends AddFavState{}
class AddFavSuccess extends AddFavState{}
class AddFavFailure extends AddFavState{
  final String errMessage;

  AddFavFailure(this.errMessage);
}