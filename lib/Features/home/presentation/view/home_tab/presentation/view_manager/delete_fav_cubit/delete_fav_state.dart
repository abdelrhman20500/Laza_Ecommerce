abstract class DeleteFavState{}
class DeleteFavInitial extends DeleteFavState{}
class DeleteFavLoading extends DeleteFavState{}
class DeleteFavSuccess extends DeleteFavState{}
class DeleteFavFailure extends DeleteFavState{
  final String errMessage;

  DeleteFavFailure(this.errMessage);
}