// AMADODaniela_E03
// Ejercicio 3 - Movimiento, arrays, colorMode() y map()
// Descripcion: Este sketch muestra flores que se mueven y rebotan en el espacio
// Cada flor es una figura compuesta por circulos que representa vida y energía en expansion

int arraySize = 30;

float[] xPositions;
float[] yPositions;

float[] xSpeeds;
float[] ySpeeds;

int[] xDirections;
int[] yDirections;

void setup() {
  size(800, 800);
  noStroke();

  xPositions = new float[arraySize];
  yPositions = new float[arraySize];

  xSpeeds = new float[arraySize];
  ySpeeds = new float[arraySize];

  xDirections = new int[arraySize];
  yDirections = new int[arraySize];

  for (int i = 0; i < arraySize; i++) {
    xPositions[i] = random(width);
    yPositions[i] = random(height);
    xSpeeds[i] = random(8);
    ySpeeds[i] = random(9);
    xDirections[i] = (random(1) > 0.5) ? 1 : -1;
    yDirections[i] = (random(1) > 0.5) ? 1 : -1;
  }
}

void draw() {
  background(255, 200, 200); 

  for (int i = 0; i < arraySize; i++) {
    // actualizar posición
    xPositions[i] = xPositions[i] + xSpeeds[i] * xDirections[i];
    yPositions[i] = yPositions[i] + ySpeeds[i] * yDirections[i];

    // rebote
    if (xPositions[i] > width || xPositions[i] < 0) {
      xDirections[i] = xDirections[i] * -1;
    }
    if (yPositions[i] > height || yPositions[i] < 0) {
      yDirections[i] = yDirections[i] * -1;
    }

    //flor 
    float x = xPositions[i];
    float y = yPositions[i];

    // petalos 
    fill(255); 
    ellipse(x - 15, y - 15, 20, 20);
    ellipse(x + 15, y - 15, 20, 20);
    ellipse(x - 15, y + 15, 20, 20);
    ellipse(x + 15, y + 15, 20, 20);
    ellipse(x, y - 20, 20, 20);
    ellipse(x, y + 20, 20, 20);
    ellipse(x - 20, y, 20, 20);
    ellipse(x + 20, y, 20, 20);

    // centro rojo
    fill(255, 0, 0); 
    ellipse(x, y, 30, 30);

    // centro
    fill(255, 255, 0);
    ellipse(x, y, 12, 12);
  }
}
