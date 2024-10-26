import '../models/product.dart';
import 'model.dart';

Product mapProductEntityToProduct(ProductEntity entity, {int initialCount = 0}) {
  return Product(
    entity.imageId, // Assuming imageId is used as the image
    entity.name,
    entity.usdPrice,
    initialCount,
  );
}