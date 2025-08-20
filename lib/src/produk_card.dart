import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class ProdukCard extends StatefulWidget {
  /// The unique identifier of the product.
  final String id;

  /// The URL of the product image.
  final String? imageUrl;

  /// A short description of the product.
  final String? shortDescription;

  /// The category name of the product.
  final String? categoryName;

  /// The name of the product.
  final String? productName;

  /// The price of the product.
  final double? price;

  /// The price start of the product. When price available priceStart & priceEnd not used
  final double? priceStart;

  /// The price start of the product. When price available priceStart & priceEnd not used
  final double? priceEnd;

  /// The currency symbol used for the price.
  // final String currency;

  /// The locale format used for the price.
  final String? localePrice;

  /// A callback function triggered when the card is tapped.
  final void Function(String id)? onTap;

  /// A callback function triggered when the favorite button is pressed.
  final void Function(String id, bool isFav)? onFavoritePressed;

  /// Indicates whether the product is available.
  final bool? isAvailable;

  /// The background color of the card.
  final Color cardColor;

  /// The text color used for labels and descriptions.
  final Color textColor;

  /// The border radius of the card.
  final double borderRadius;

  /// The rating of the product (optional).
  final double? rating;

  /// The discount percentage of the product (optional).
  final double? discountPercentage;

  /// The width of the card
  final double? width;

  /// The height of the card
  final double? height;

  const ProdukCard({
    super.key,
    required this.id,
    this.imageUrl,
    this.categoryName,
    this.productName,
    this.price,
    this.priceStart,
    this.priceEnd,
    // this.currency = 'Rp',
    this.localePrice = 'id_ID',
    this.onTap,
    this.onFavoritePressed,
    this.shortDescription = '',
    this.isAvailable,
    this.cardColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.borderRadius = 12.0,
    this.rating,
    this.discountPercentage,
    this.width,
    this.height,
  });

  @override
  State<ProdukCard> createState() => _ProdukCardState();
}

class _ProdukCardState extends State<ProdukCard> {
  ValueNotifier<bool> isFav = ValueNotifier<bool>(false);
  String currencySymbol = '';

  String formatPrice(double? price) {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: widget.localePrice ?? 'id_ID',
      decimalDigits: 2, //
    );
    return formatter.format(price ?? 0);
  }

  @override
  void dispose() {
    isFav.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    currencySymbol = NumberFormat.simpleCurrency(locale: widget.localePrice ?? 'id_ID').currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!(widget.id) : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: widget.height ?? 330, //
          minWidth: widget.width ?? 200,
          maxWidth: widget.width ?? 200,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
          elevation: 4,
          color: widget.cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image and favorite button
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      child: Builder(
                        builder: (context) {
                          try {
                            if (widget.imageUrl != null) {
                              Uri? uri = Uri.tryParse(widget.imageUrl!);
                              if (uri?.isAbsolute ?? false) {
                                return CachedNetworkImage(
                                  imageUrl: widget.imageUrl!, //
                                  fit: BoxFit.cover,
                                  height: 130,
                                  width: double.infinity,
                                  placeholder: (context, url) => SpinKitFadingCircle(size: 25, color: Colors.grey),
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                      "assets/no_image.png",
                                      package: 'produk_card',
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                );
                              } else {
                                return Image.asset(widget.imageUrl!, height: 130, width: double.infinity, fit: BoxFit.cover);
                              }
                            }
                            return Image.asset("assets/no_image.png", package: 'produk_card', height: 130, width: double.infinity, fit: BoxFit.cover);
                          } catch (e) {
                            return Image.asset("assets/no_image.png", package: 'produk_card', height: 130, width: double.infinity, fit: BoxFit.cover);
                          }
                        },
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () {
                            isFav.value = !isFav.value;
                            if (widget.onFavoritePressed != null) {
                              widget.onFavoritePressed?.call(widget.id, isFav.value);
                            }
                          },
                          child: ValueListenableBuilder<bool>(
                            valueListenable: isFav,
                            builder: (context, value, child) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: value ? const Color.fromARGB(255, 245, 30, 15) : Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(value ? Icons.favorite_rounded : Icons.favorite_border_rounded, color: Colors.white, size: 18),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Product details
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.productName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: widget.textColor),
                    ),
                    Text(widget.categoryName ?? '', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),

                    const SizedBox(height: 4),
                    SizedBox(
                      height: 43,
                      child: Text(
                        widget.shortDescription ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                      ),
                    ),

                    if (widget.rating != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Icon(index < widget.rating!.round() ? Icons.star : Icons.star_border, color: Colors.orange, size: 15),
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...[
                          if ((widget.isAvailable ?? false) == true) ...[
                            Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green, size: 15),
                                SizedBox(width: 4),
                                Text(
                                  'Available',
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green.shade400),
                                ),
                              ],
                            ),
                          ] else ...[
                            Row(
                              children: [
                                Icon(Icons.do_disturb_alt_rounded, color: Colors.red.shade400, size: 15),
                                SizedBox(width: 4),
                                Text(
                                  'Out of Stock',
                                  style: TextStyle(color: Colors.red.shade400, fontWeight: FontWeight.bold, fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ],
                        if (widget.discountPercentage != null)
                          Text(
                            '${widget.discountPercentage?.toStringAsFixed(0)}% OFF',
                            style: TextStyle(color: Colors.red.shade400, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    ...[
                      if (widget.price != null && widget.price!.toString().isNotEmpty) ...[
                        Text(
                          '$currencySymbol ${formatPrice(widget.price ?? 0.0)}',
                          style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ] else if (widget.priceStart != null && widget.priceEnd != null) ...[
                        Text(
                          "$currencySymbol ${formatPrice(widget.priceStart)}",
                          style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "s/d $currencySymbol ${formatPrice(widget.priceEnd)}",
                          style: TextStyle(color: widget.textColor, fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
