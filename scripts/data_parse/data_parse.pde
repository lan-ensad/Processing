Table input, output;

void setup(){
  size(200, 200);
  input = loadTable("etudiants_2021-2022.csv", "header");
  output = new Table();
  output.addColumn("Nom");
  output.addColumn("Prenom");
  output.addColumn("Annee");
  output.addColumn("NIP");

  println(input.getRowCount() + " total rows");

  for(int i=0; i<input.getRowCount(); i++){
    //NOM ET PRENOM
    //------------------------
    print(i + " : ");
    TableRow row = input.getRow(i);
    String st = row.getString("Nom et Prénom");
    String nom = "";
    String prenom = "";
    boolean bnom = true;
    boolean bprenom = false;
    for(int j=0; j<st.length(); j++){
      if(st.charAt(j)==' '){
        if(st.charAt(j+2)>=97 && st.charAt(j+2)<=122 ){
          j++;
          bnom = false;
          bprenom = true;
        }else if(st.charAt(j+2)>=126 && st.charAt(j+2)<=165 ){
          j++;
          bnom = false;
          bprenom = true;
        }
      }
      if(bnom){
        nom+=st.charAt(j);
      }else if(bprenom){
        prenom+=st.charAt(j);
      }
    }
    //NIP
    String nip = row.getString("NIP");
    //Annee
    String annee = row.getString("Année");

    //Print Tables !
    TableRow newRow = output.addRow();
    newRow.setString("Nom", nom);
    newRow.setString("Prenom", prenom);
    newRow.setString("Annee", annee);
    newRow.setString("NIP", nip);
    println(nom + " - " + prenom + " - " + annee + " - " + nip);
  }
  saveTable(output, "students.csv");
  exit();
}
