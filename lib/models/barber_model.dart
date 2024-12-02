class BarberData {
  final String bannerImage;
  final String bannerButtonTitle;
  final List<BarberShop> nearestBarbershop;
  final List<BarberShop> mostRecommended;
  final List<BarberShop> list;

  BarberData({
    required this.bannerImage,
    required this.bannerButtonTitle,
    required this.nearestBarbershop,
    required this.mostRecommended,
    required this.list,
  });

  factory BarberData.fromJson(Map<String, dynamic> json) {
    return BarberData(
      bannerImage: json['banner']['image'],
      bannerButtonTitle: json['banner']['button_title'],
      nearestBarbershop: (json['nearest_barbershop'] as List)
          .map((item) => BarberShop.fromJson(item))
          .toList(),
      mostRecommended: (json['most_recommended'] as List)
          .map((item) => BarberShop.fromJson(item))
          .toList(),
      list: (json['list'] as List)
          .map((item) => BarberShop.fromJson(item))
          .toList(),
    );
  }
}

class BarberShop {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  BarberShop({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory BarberShop.fromJson(Map<String, dynamic> json) {
    return BarberShop(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: (json['review_rate'] as num).toDouble(),
    );
  }
}
