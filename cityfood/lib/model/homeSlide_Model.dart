class HomeSlide {
  final imgs;
  final nameOfItem;
  final reviewImg1;
  final reviewImg2;
  final reviewImg3;
  final reviewImg4;

  HomeSlide({
    required this.imgs,
    required this.nameOfItem,
    required this.reviewImg1,
    required this.reviewImg2,
    required this.reviewImg3,
    required this.reviewImg4,
  });
}

final List<HomeSlide> homeSlide = [
  HomeSlide(
      imgs: "assets/images/clothes1.png",
      nameOfItem: "BlackHoodie Mixed Gender",
      reviewImg1: 'assets/images/bacimg3.jpg',
      reviewImg2: 'assets/images/bacimg2.jpg',
      reviewImg3: 'assets/images/bacimg3.jpg',
      reviewImg4: 'assets/images/bacimg1.jpg'),
  HomeSlide(
      imgs: "assets/images/friedge1.png",
      nameOfItem: "Brand New LG Friedge",
      reviewImg1: 'assets/images/bacimg3.jpg',
      reviewImg2: 'assets/images/bacimg2.jpg',
      reviewImg3: 'assets/images/bacimg3.jpg',
      reviewImg4: 'assets/images/bacimg1.jpg'),
  HomeSlide(
      imgs: "assets/images/androidpic3.webp",
      nameOfItem: "Samsung Galaxy A15 ",
      reviewImg1: 'assets/images/bacimg3.jpg',
      reviewImg2: 'assets/images/bacimg2.jpg',
      reviewImg3: 'assets/images/bacimg3.jpg',
      reviewImg4: 'assets/images/bacimg1.jpg'),
  HomeSlide(
      imgs: "assets/images/funiture1.png",
      nameOfItem: "A Yellow Funiture Couch",
      reviewImg1: 'assets/images/bacimg3.jpg',
      reviewImg2: 'assets/images/bacimg2.jpg',
      reviewImg3: 'assets/images/bacimg3.jpg',
      reviewImg4: 'assets/images/bacimg1.jpg')
];
