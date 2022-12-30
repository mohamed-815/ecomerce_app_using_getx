class Categorydetails {
  String categoryname;
  String categoryheading;
  String image;
  Categorydetails(
      {required this.image,
      required this.categoryheading,
      required this.categoryname});
}

final categorylist = [
  Categorydetails(
      image: 'assets/141ad8d639fd9bfedc719ec93a3b80ef.jpg',
      categoryheading: 'Edible Fishes',
      categoryname: 'edibleseeds'),
  Categorydetails(
      image: 'assets/cartoon-aquarium-fish-vector-1132116.jpg',
      categoryheading: 'Aquarium',
      categoryname: 'aquarium'),
  Categorydetails(
      image:
          'assets/pet-shop-vet-store-set-domestic-animals-accessories-cat-dog-fish-cartoon-vector-food-toys-aid-bowl-shampoo-aquarium-240357678.jpg',
      categoryheading: 'Accessories',
      categoryname: 'accessories'),
  Categorydetails(
      image: 'assets/images.jpeg',
      categoryheading: 'Feeds',
      categoryname: 'feeds'),
  Categorydetails(
      image: 'assets/images (1).jpeg',
      categoryheading: 'Birds',
      categoryname: 'birds'),
];
