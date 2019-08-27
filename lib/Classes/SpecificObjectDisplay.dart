const String nameJ = "Nazwa Produktu";
const String localisationJ = "Lokalizacja";
const String descriptionJ = "Opis";
const String producttypeJ = "Typ produktu ";
const String priceJ = "Cena";
const String numberJ = "Numer";

class ObiektOferty {
  String key;
  String name;
  String localisation;
  String description;
  String producttype;
  String price;
  String number;

  ObiektOferty(this.key,
      [this.name,
      this.localisation,
      this.description,
      this.number,
      this.price,
      this.producttype]);
 
  static Map toMap(ObiektOferty item) {
    Map jsonMap = {
      nameJ: item.name,
      localisationJ: item.localisation,
      descriptionJ: item.description,
      numberJ: item.number,
      priceJ: item.price,
      producttypeJ: item.producttype,
    };
    return jsonMap;
  }

  String getItemName(){
    return name;
  }

}
