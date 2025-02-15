/*

Hello, welcome. This is a snake game played with the assistance of mouse.
Please check the ReadMe file for instructions to guide you in playing the game.

This is Food class controls the food spawning and display.
*/

class Food {
  int x, y; // x & y store the food's position.

//The constructor below calls respawn() to generate an initial food position.
  Food() {
    respawn(null);
  }
  
//The drawFood method below displays the food as a colored rectangle.
  void drawFood() {
    fill(210, 115, 90);
    rect(x, y, UNIT_SIZE, UNIT_SIZE);
  }

/*
The respawn() function below generates food at a random position.
And avoids placing food inside the snake's body.
*/
  void respawn(Snake snake) {
    boolean validPosition;
    do {
      validPosition = true;
      x = floor(random(WIDTH / UNIT_SIZE)) * UNIT_SIZE;
      y = floor(random(HEIGHT / UNIT_SIZE)) * UNIT_SIZE;

      if (snake != null) {
        for (int i = 0; i < snake.length; i++) {
          if (x == snake.x[i] && y == snake.y[i]) {
            validPosition = false;
            break;
          }
        }
      }
    } while (!validPosition);
  }
}
