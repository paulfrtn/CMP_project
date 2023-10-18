JSONArray restaurants;
String API_key = "fsq38cXjeK1z9x90nAlL7s2TeDh0DHxC5PigADMwPJkuL0Y=";
String url = ""+API_key;

JSONArray API_rest;

void setup() {
  size(480, 720);
  background(#2a9d8f);
  File file = new File(dataPath("Json/restaurants.json"));
  
  if (file.exists()) {
    // Si le fichier existe, chargez le contenu dans le tableau JSON
    restaurants = loadJSONArray("Json/restaurants.json");
  } else {
    // Si le fichier n'existe pas, créez un nouveau JSONArray vide
    restaurants = new JSONArray();
    // Enregistrez le JSONArray dans un fichier
    saveJSONArray(restaurants, "Json/restaurants.json");
    println("Nouveau fichier JSON créé : fichier.json");
  }
  
  API_rest = loadJSONArray("Json/API.json");
  
  
  
}

void draw() {
  background(#2a9d8f);
  load_restaurants(restaurants);
  add_restaurant(restaurants,API_rest);
  println(restaurants);
}
