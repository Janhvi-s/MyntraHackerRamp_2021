import 'dart:ui';

class Item {

  String title;
  String description;
  Color color;
  String price;
  
  String imageUrl;


  Item(this.title, this.description, this.color, this.price, this.imageUrl);

}

List<Item> getGridItems(){
  return <Item>[
    Item(
      'Yellow Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
      Color(0xFFDFDFF8), 
      '30',  
      'assets/images/Yellow-Floral-Tiered-Ruffled-Mini-Dress.jpg',
    ),
    Item(
      'White Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
      Color(0xFFDFDFF8), 
      '45',  
      'assets/images/a5ab92d77c68c22e869c91c8e17c412e.jpg',
    ),
    Item(
      'Brown Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
      Color(0xFFDFDFF8), 
      '38', 
      'assets/images/browndress.jpg',
    ),
    Item(
      'Floral Dress',
      "This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length", 
      Color(0xFFDFDFF8), 
      '42', 
      'assets/images/whitedress.jpg',
    ),
    Item(
      'Blue Dress',
      "This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length", 
      Color(0xFFDFDFF8), 
      '48', 
      'assets/images/blue.jpg',
    ),
    Item(
      'Red Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
     Color(0xFFDFDFF8), 
      '37',
      'assets/images/reddress.jpg',
    ),
    Item(
      'Pale yellow Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
      Color(0xFFDFDFF8), 
      '', 
      'assets/images/paleyellow.jpg',
    ),
    Item(
      ' Pink Dress',
      'This Dress is floral printed piece from Urbanic. It is stretchy ,made from cotton fabric and above knee length', 
     Color(0xFFDFDFF8), 
      '2.45',  
      'assets/images/blue1.jpg',
    ),
  ];
}