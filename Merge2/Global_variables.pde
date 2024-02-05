boolean LOADING = true;
boolean MENU = true;
boolean menuOpen = false;
boolean VIEW_LIST = false;
boolean CREDITS = false;
boolean PROFILE = false;
boolean ADD_REST = false;
boolean weatherapp = false;
boolean addRestaurantHover = false;
boolean viewListHover = false;
boolean animatingMenu = false;
boolean add_rest = false;
boolean enter_session_pseudo = false;
boolean enter_session_password = false;
boolean logged_in = false;
boolean login =false;
boolean creating=false;
boolean creation=false;
boolean enter_pseudo = false;
boolean enter_password = false;
boolean enter_first_name=false;
boolean enter_last_name=false;
boolean enter_email=false;
boolean enter_age=false;
boolean enter_adress=false;
boolean enter_phone_num=false;
boolean enter_profile_pic=false;
boolean cameraActive = false;
boolean photoTaken = false;
boolean one_use=false;
boolean animatingText = false;
boolean isDay = true;
boolean state = false;


float buttonWidth1 = 280;
float buttonWidth2 = 280;
float buttonWidth3 = 280;
float buttonHeight1 = 60;
float buttonHeight2 = 60;
float buttonHeight3 = 60;
float enlargedButtonWidth = 300;
float enlargedButtonHeight = 70;
float animationSpeed = 0.5;
float textsize1 = 16;
float textsize2 = 16;
float textsize3 = 16;
float targetFrameRate = 10; 

int animationTimer = 0;
int animationSpeedRect = 5;
int animatingTextIndex = 0;
int lastFrame = 0;
int page=0;
int age;
int scrollPosition = 0;
int targetScrollPosition = 0;
int contentHeight = 0;
int FavIndoor = 0;
int FavPrice = 0;
int FavRating = 0;

int C3 = #f5e7cc; 
int C2 = #E28413; 
int C1 = #000022;

PImage arrowImage;
PImage capturedImage;
PImage profile_pic;
PImage HomeIn;
PImage HomeOut;
PImage AddIn;
PImage AddOut;
PImage FavIn;
PImage FavOut;
PImage WeatherIn;
PImage WeatherOut;
PImage SunImg;
PImage MoonImg;
PImage CloudImg;
PImage RainImg;
PImage Menu;
PImage rating1;
PImage rating2;
PImage rating3;
PImage rating4;
PImage rating5;
PImage coin;

JSONArray users;
JSONArray restaurants;
JSONArray API_rest;

JSONObject userJSON;

String session_pseudo = "";
String session_password = "";
String first_name = "";
String last_name = "";
String email="";
String new_pseudo="";
String new_password="";
String adress = "";
String phone_num="";

Capture video;

Restaurant[] restaurants_array;
Restaurant[] indoor_array;
Restaurant[] FavRestaurant;
Restaurant[] outdoor_array;
User[] users_array;
User current_user;
int[] favorites_array = new int[0];


void loadImages(){
  HomeIn = loadImage("images/HomeIn.png");
  HomeOut = loadImage("images/HomeOut.png");
  SunImg = loadImage("images/sun.png");
  MoonImg = loadImage("images/moon.png");
  CloudImg = loadImage("images/cloud.png");
  RainImg = loadImage("images/rain.png");
  WeatherIn = loadImage("images/WeatherIn.png");
  WeatherOut = loadImage("images/WeatherOut.png");
  Menu = loadImage("images/menu.png");
  AddIn = loadImage("images/AddIn.png");
  AddOut = loadImage("images/AddOut.png");
  FavIn = loadImage("images/FavIn.png");
  FavOut = loadImage("images/FavOut.png");
  rating1 = loadImage("images/rating1.png");
  rating2 = loadImage("images/rating2.png");
  rating3 = loadImage("images/rating3.png");
  rating4 = loadImage("images/rating4.png");
  rating5 = loadImage("images/rating5.png");
  coin = loadImage("images/coin.png");
}
