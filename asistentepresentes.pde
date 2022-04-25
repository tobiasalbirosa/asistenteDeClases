String chat [], horario[], lista [];
boolean presente [];
Table table;

void setup() {

  table = new Table();


  table.addColumn("id");
  table.addColumn("presente");


  chat = loadStrings("chat/chat.txt");
  lista = loadStrings("lista/lista.txt");
  horario = loadStrings("lista/lista.txt");

  presente = new boolean[lista.length];

  for (int j = 0; j <  lista.length; j++) {
    TableRow newRow = table.addRow();

    for (int i = 0; i <  chat.length; i++) {

      if (chat[i].indexOf(lista[j]) != -1 && chat[i].indexOf(":") == -1) {  

        println(chat[i-1].substring(0, 9) + chat[i]);
        newRow.setString("id", lista[j]);
        newRow.setString("presente", "P");

        if (chat[i-1].substring(0, 9).indexOf(":") != -1) {
          newRow.setString("horario", chat[i-1].substring(0, 9));
        }

        presente[j] = true;
      } else if (presente[j] == false) {

        newRow.setString("id", lista[j]);
        newRow.setString("presente", "A");
      }
    }
  }

  saveTable(table, "data/lista.csv");
}
