class Restaurant {
   float id;
   String name;
   String address;
   float longitude;
   float latitude;
   int usersCount;
   int priceTier;
   float rating; 

   Restaurant(float id, String name, String address, float latitude, float longitude, int usersCount, int priceTier, float rating) {
     this.id = id;
     this.name = name;
     this.address = address;
     this.latitude = latitude;
     this.longitude = longitude;
     this.usersCount = usersCount;
     this.priceTier = priceTier;
     this.rating = rating;
   }

   void display(float x, float y) {
     textSize(14);
     fill(C1);
     text("Nom: " + name, x, y + 20);
     text("Adresse: " + address, x, y + 40);
     text("Nombre d'utilisateurs: " + usersCount , x, y + 60);
     text("Niveau de prix: " + priceTier, x, y + 80);
     text("Note: " + rating, x, y + 100);
   }
}
