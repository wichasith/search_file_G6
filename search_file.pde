import java.util.regex.*;  

String[] list = {} ; 

void setup() {
  String path = sketchPath();
  String search = "Shiba";
  String[] Vowels = { "a", "e" , "i" , "o" , "u" } ;
  Boolean found = false ;
  listFileNames(path,search) ;
  
  saveStrings("save.txt", list);
  
  String[] lines = loadStrings("save.txt");
  for (int i = 0 ; i < lines.length; i++) {
    if(lines[i].equals(search)){
          println(lines[i]) ;
        }
  }
  
  for (int i = 0 ; i < lines.length; i++) {
      String[] splits = split(lines[i], '/');
      for (int j = 0 ; j < splits.length; j++) {
        if(splits[j].equals(search)){
          println(lines[i]) ;
          found = true ;
        }
      }
    
  }
  
  if (found == false) {
  for(int a = 0 ; a < Vowels.length ; a++){
    String newSearch = search.replace(Vowels[a],".");
    for (int i = 0 ; i < lines.length; i++) {
      String[] splits = split(lines[i], '/');
      for (int j = 0 ; j < splits.length; j++) {
        if(Pattern.matches(newSearch, splits[j])){
            println(lines[i]) ;
          }
        }
    }
  }
  }
  

}

void draw() {
  
}

void listFileNames(String dir , String search) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    if(names != null){
      for (int i = 0; i < names.length; i++){
        list = append(list , dir + "/" + names[i]) ;
        listFileNames(dir + "/" + names[i],search) ;
      }
    }
  } 
}
