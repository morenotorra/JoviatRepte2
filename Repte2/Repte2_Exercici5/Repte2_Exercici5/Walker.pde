class Walker {

  int x = width/2;
  int y = height/2;

  Walker() {
  }

  void walk() {
    int choice = int(random(4));

    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else {
      y--;
    }
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}
