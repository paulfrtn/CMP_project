

void load_restaurants(JSONArray restaurants){
    if (restaurants != null) {
    for (int i = 0; i < restaurants.size(); i++) {
      JSONObject restaurant = restaurants.getJSONObject(i);
      float id = restaurant.getFloat("id");
      String name = restaurant.getString("name");
      String address = restaurant.getString("address");
      float latitude = restaurant.getFloat("latitude");
      float longitude = restaurant.getFloat("longitude");
      int usersCount = restaurant.getInt("usersCount");
      int priceTier = restaurant.getInt("priceTier");
      float rating = restaurant.getFloat("rating");

      // Créez un objet de restaurant avec les données lues
      Restaurant restObj = new Restaurant(id, name, address, latitude, longitude, usersCount, priceTier, rating);
      println(restObj);
     
    }
  } else {
    println("Aucun restaurant trouvé.");
  }
}

void add_restaurant(JSONArray restaurants, JSONArray API_rest) {
  JSONObject newRestaurant = null;
  
  if (restaurants == null) {
    // Si le fichier restaurants.json est vide, créez un nouveau JSONArray vide
    restaurants = new JSONArray();
  }
  
  if (API_rest != null && API_rest.size() > 0) {
    // Si le fichier API.json n'est pas vide, récupérez le premier restaurant du fichier
    JSONObject firstRestaurant = API_rest.getJSONObject(0);
    float id = firstRestaurant.getFloat("id");
    String name = firstRestaurant.getString("name");
    String address = firstRestaurant.getString("address");
    float latitude = firstRestaurant.getFloat("latitude");
    float longitude = firstRestaurant.getFloat("longitude");
    int usersCount = firstRestaurant.getInt("usersCount");
    int priceTier = firstRestaurant.getInt("priceTier");
    float rating = firstRestaurant.getFloat("rating");

    // Créez un objet JSON pour le nouveau restaurant
    newRestaurant = new JSONObject();
    newRestaurant.setFloat("id", id);
    newRestaurant.setString("name", name);
    newRestaurant.setString("address", address);
    newRestaurant.setFloat("latitude", latitude);
    newRestaurant.setFloat("longitude", longitude);
    newRestaurant.setInt("usersCount", usersCount);
    newRestaurant.setInt("priceTier", priceTier);
    newRestaurant.setFloat("rating", rating);
  } else {
    println("Aucun restaurant trouvé dans API_rest.");
  }
  
  if (newRestaurant != null) {
    // Ajoutez le nouveau restaurant au tableau des restaurants existants
    restaurants.append(newRestaurant);

    // Sauvegardez les restaurants mis à jour dans le fichier JSON
    saveJSONArray(restaurants, "Json/restaurants.json");

    println("Restaurant ajouté et enregistré : " + newRestaurant.getString("name"));
  }
}
