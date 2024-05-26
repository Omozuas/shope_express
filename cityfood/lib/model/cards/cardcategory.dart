class CardCatrgory {
  final imgs;
  final nameOfItem;

  final id;

  CardCatrgory({
    required this.imgs,
    required this.nameOfItem,
    this.id,
  });
}

List<CardCatrgory> categoryCard = [
  CardCatrgory(imgs: "assets/images/clothes1.png", nameOfItem: "Hoodie"),
  CardCatrgory(imgs: "assets/images/friedge1.png", nameOfItem: "electronics"),
  CardCatrgory(imgs: "assets/images/androidpic3.webp", nameOfItem: "android"),
  CardCatrgory(imgs: "assets/images/funiture1.png", nameOfItem: "Funiturs"),
  CardCatrgory(
      imgs: "assets/images/headsetImg1.png", nameOfItem: "head phones"),
  CardCatrgory(imgs: "assets/images/iphone3.png", nameOfItem: "iphones"),
  CardCatrgory(imgs: "assets/images/pcimg2.png", nameOfItem: "Laptops"),
  CardCatrgory(imgs: "assets/images/shoe1.png", nameOfItem: "shoes"),
];
