class SearchEntity {
  final String productId;
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;

  SearchEntity(
      {
        required this.productDescription,
        required this.productId,
        required this.productName,
        required this.productPrice,
        required this.productImage});
}
