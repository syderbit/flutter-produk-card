# product_card

[![pub package](https://img.shields.io/pub/v/produk_card.svg)](https://pub.dev/packages/produk_card)
[![likes](https://img.shields.io/pub/likes/produk_card?logo=dart)](https://pub.dev/packages/produk_card/score)
[![pub points](https://img.shields.io/pub/points/produk_card?logo=dart)](https://pub.dev/packages/produk_card/score)
[![popularity](https://img.shields.io/pub/popularity/produk_card?logo=dart)](https://pub.dev/packages/produk_card/score)
[![GitHub License](https://img.shields.io/github/license/syderbit/flutter-produk-card)]

A versatile Flutter package packed with powerful features to help developers design and customize stunning, responsive, and informative product cards for e-commerce or shopping applications. With this package, you can easily display essential product information such as name, category, price, discounts, ratings, and images in a clean and visually appealing layout. It also provides flexible customization options for colors, typography, and styles, allowing seamless integration with the overall theme of your application. Whether you are building a simple store or a large-scale marketplace, this package offers the tools you need to create engaging product cards that enhance the shopping experience.

## Getting started

To use this package, add `product_card` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  product_card: ^0.0.1
```

## Usage

Import the package in your Dart file:

```dart
import 'package:product_card/product_card.dart';
```

Then, use the `ProductCard` widget in your application:

```dart
ProductCard(
  id: 2, // Produk ID
  imageUrl: 'https://altitude.ph/cdn/shop/collections/AD_Store_Revamp_DJI-28_2000x.jpg', //add your image url here or assets image
  categoryName: 'Pants',
  productName: 'Men Linen Pants',
  price: 2450000,
  localePrice: 'en_US', // Default set to id_ID
  onTap: (id) {
    // Handle card tap event
  },
  onFavoritePressed: (id, isFav) {
    // Handle favorite button press
  },
  shortDescription: 'comfortable & airy.', // Optional short description
  rating: 4.2, // Optional rating
  discountPercentage: 35.0, // Optional discount percentage
  isAvailable: true, // Optional availability status
  cardColor: Colors.white, // Optional card background color
  textColor: Colors.black, // Optional text color
  borderRadius: 8.0, // Optional border radius
)
```

## Output

</td>
<td><img src="https://raw.githubusercontent.com/syderbit/flutter-produk-card/refs/heads/main/example_produk_card.png" alt="Example Product Card Image">
</td>
</tr>
</table>

## Contributing

Community contributions are highly encouraged. Should you encounter any issues or wish to propose improvements (e.g., better documentation), please create an issue or submit a pull request in the repo. [GitHub repository](https://github.com/syderbit/flutter-produk-card).

## Author

This package is created and maintained by [Aditya R].

## Contact

If you want to connect or have any questions or need further assistance, feel free to reach out:

- Email: [syderbit[at]gmail[dot]com](mailto:syderbit@gmail.com)
- GitHub: [@syderbit](https://github.com/syderbit)

## License

This package is released under the [MIT License](https://opensource.org/licenses/MIT).
