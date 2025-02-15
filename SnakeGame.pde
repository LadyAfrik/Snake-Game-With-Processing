/*

Hello, welcome. This is a snake game played with the assistance of mouse.
Please check the ReadMe file for instructions to guide you in playing the game.


This is SnakeGame file which is the core file that controls the game loop and 
calls methods from the Snake and Food classes.
*/

//Constants for window size and unit size
int WIDTH = 500; // define the screen width
int HEIGHT = 500; // define the screen hight
int UNIT_SIZE = 20; // determines the size of each grid block.

// Game Objects. The snake and food are instances of the Snake and Food classes.
Snake snake;
Food food;
boolean running = false; // Keeps track of whether the game is active.

//The method below (settings) defines the game window size.
void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  frameRate(5); // slows the snake down for better control
  snake = new Snake(); // Initializes the snake object
  food = new Food(); // Initializes the food object
  running = true; // starts the game.
}

/*
The draw() method below does the following:
- Clears the screen on each frame.
- Checks if the game is running.
- Calls methods to update and display food, snake, and score.
- If the game is not running, it shows Game Over.
*/
void draw() { // The draw() method begins
  background(0);

  if (running) {
    food.drawFood();
    snake.move();
    snake.drawSnake();
    snake.checkFood(food);
    snake.checkCollision();
    displayScore();
  } else {
    gameOver();
  }
} // The draw() method ends

// Display the score
void displayScore() {
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Score: " + snake.foodEaten, width / 2, 30);
}

// Game Over screen
void gameOver() {
  fill(255, 0, 0);
  textSize(50);
  textAlign(CENTER);
  text("Game Over", width / 2, height / 2);

  fill(255);
  textSize(25);
  text("Score: " + snake.foodEaten, width / 2, height / 2 + 50);
}

// Handles mouse clicks to change the snake direction.
void mousePressed() {
  snake.changeDirectionToMouse(mouseX, mouseY);
}
