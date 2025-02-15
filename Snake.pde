/*

Hello, welcome. This is a snake game played with the assistance of mouse.
Please check the ReadMe file for instructions to guide you in playing the game.

This is Snake class controls the snake's movement, growth, and collisions.
*/
class Snake {
  int[] x, y; // x[] & y[] store the snake's body positions.
  int length; // length determines how long the snake is.
  int foodEaten; // foodEaten tracks the player's score.
  int directionX, directionY; // directionX, directionY store movement direction.

/*
The below perform the following:
- Initializes the snake in the middle of the screen.
- Starts with a length of 5.
- Moves to the right by default (directionX = UNIT_SIZE).
*/
  Snake() {
    x = new int[(WIDTH * HEIGHT) / (UNIT_SIZE * UNIT_SIZE)];
    y = new int[(WIDTH * HEIGHT) / (UNIT_SIZE * UNIT_SIZE)];
    length = 5;
    foodEaten = 0;
    directionX = UNIT_SIZE;
    directionY = 0;

    // Start in the middle of the screen
    for (int i = 0; i < length; i++) {
      x[i] = WIDTH / 2 - i * UNIT_SIZE;
      y[i] = HEIGHT / 2;
    }
  }

  void drawSnake() {
    fill(255);
    for (int i = 0; i < length; i++) {
      rect(x[i], y[i], UNIT_SIZE, UNIT_SIZE);
    }
  }

/*
The move() method below perform the following:
- Moves each body segment forward.
- Updates the head position based on directionX & directionY.
*/
  void move() {
    // Move body
    for (int i = length - 1; i > 0; i--) {
      x[i] = x[i - 1];
      y[i] = y[i - 1];
    }

    // Move head
    x[0] += directionX;
    y[0] += directionY;
  }

/*
The below checkFood() function perform the following:
- Checks if the snake eats food.
- Grows the snake and increases the score.
- Respawns the food at a new position.
*/
  void checkFood(Food food) {
    if (dist(x[0] + UNIT_SIZE / 2, y[0] + UNIT_SIZE / 2, 
             food.x + UNIT_SIZE / 2, food.y + UNIT_SIZE / 2) < UNIT_SIZE) {
      length++;
      foodEaten++;
      food.respawn(this);
    }
  }

/*
The checkCollision() below method perform the following:
- Checks if the snake collides with itself.
- Checks if the snake hits the wall.
- Ends the game (running = false) if a collision happens.
*/
  void checkCollision() {
    for (int i = 1; i < length; i++) {
      if (x[0] == x[i] && y[0] == y[i]) {
        running = false;
      }
    }

    if (x[0] < 0 || x[0] >= WIDTH || y[0] < 0 || y[0] >= HEIGHT) {
      running = false;
    }
  }

/*
The changeDirectionToMouse() function below performs the following:
- Changes direction based on the mouse click.
- Moves in the dominant direction (horizontal or vertical).
*/
  void changeDirectionToMouse(int mx, int my) {
    int deltaX = mx - x[0];
    int deltaY = my - y[0];

    if (abs(deltaX) > abs(deltaY)) {
      directionX = deltaX > 0 ? UNIT_SIZE : -UNIT_SIZE;
      directionY = 0;
    } else {
      directionY = deltaY > 0 ? UNIT_SIZE : -UNIT_SIZE;
      directionX = 0;
    }
  }
}
