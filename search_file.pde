import java.util.regex.*;  

void setup() {
  String path = "/home/fulla/Desktop/year3term1/processing/search_file";
  String search = "dog";
  ArrayList<String> list = new ArrayList<String>() ;
  String[] listToStringArray = {} ;
  String[] Vowels = { "a" , "e" , "i" , "o" , "u" } ;
  Boolean found = false ;
  int count = 0 ;
  
  listFileNames(path,search,list) ;
  
  
  //print(list) ;
  
  for(int i = 0 ; i < list.size() ; i ++){
    listToStringArray = append(listToStringArray, list.get(i));
  }
  
  
  saveStrings("save.txt", listToStringArray);
  
  //check all like /home/fulla/Desktop/year3term1/processing/search_file/animal
  
  String[] lines = loadStrings("save.txt");
  for (int i = 0 ; i < lines.length; i++) {
    //lines[i] = lines[i].toLowerCase();
    if(lines[i].equals(search)){
          println(lines[i]) ;
          found = true ;
        }
  }
  
  //check one word with correct word
  
  String lowersearch = search.toLowerCase();
  for (int i = 0 ; i < lines.length; i++) {
      String[] splits = split(lines[i], '/');
      for (int j = 0 ; j < splits.length; j++) {
        splits[j] = splits[j].toLowerCase();
        if(splits[j].equals(lowersearch)){
          println(lines[i]) ;
          found = true ;
        }
      }
  }
  
  //check one word when incorrect vowels by using regex
  
  if (found == false) {
  for(int a = 0 ; a < Vowels.length ; a++){
    String newSearch = lowersearch.replace(Vowels[a],".");
    for (int i = 0 ; i < lines.length; i++) {
      String[] splits = split(lines[i], '/');
      for (int j = 0 ; j < splits.length; j++) {
        splits[j] = splits[j].toLowerCase();
        if(Pattern.matches(newSearch, splits[j])){
            println(lines[i]) ;
            count ++ ;
          }
        }
    }
  }
  if(count > 0 ){
    found = true ;
  }
  }
  
  if(found == false){
    String searchCheckCharacter = "[" + search + "]+" ;
    for (int i = 0 ; i < lines.length; i++) {
      String[] splits = split(lines[i], '/');
      for (int j = 0 ; j < splits.length; j++) {
          splits[j] = splits[j].toLowerCase();
          if(Pattern.matches(searchCheckCharacter, splits[j])){
              println(lines[i]) ;
              count ++ ;
            }
          }
    }
    if(count > 0 ){
    found = true ;
  }
  }
  
  if(found == true){
    println("---------------- We found & End Process ---------------") ;
  }
  if(found == false){
    println("------- We didn't find Sorry & The Process was End----------") ;
  }
}

void draw() {
}

void listFileNames(String dir , String search , ArrayList<String> list) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    
    if(names != null){
      //println(dir + "/" ) ;
      
      for (int i = 0; i < names.length; i++){
        //println(dir + "/" + names[i]) ;
        list.add(dir + "/" + names[i]) ;
        
        listFileNames(dir + "/" + names[i],search,list) ;
      
      }
      }
  
  } 
}
