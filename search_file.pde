String[] list = {} ; 

void setup() {
  String path = sketchPath();
  String search = "/home/fulla/Desktop/year3term1/processing/search_file/animal/cat";
  listFileNames(path,search) ;
  //for(int i = 0; i < list.length ; i ++){
  //println(list[i]) ;
  //}
  saveStrings("save.txt", list);
  
  String[] lines = loadStrings("save.txt");
  for (int i = 0 ; i < lines.length; i++) {
    if(lines[i].equals(search)){
          println(lines[i]) ;
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
