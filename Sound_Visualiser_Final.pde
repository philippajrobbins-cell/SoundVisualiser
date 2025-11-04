/**
 * SOUND VISUALISER 
 
 
 */

import ddf.minim.*;

Minim minim;
AudioInput mic;

boolean trails = true;

// Calibration for loud music
float sensitivity = 40;        // smaller = less sensitive
float spawnThreshold = 0.4;    // how easily it reacts (higher = less)
float smoothFactor = 0.08;     // controls smoothing of sound data

// Circle visual properties
float circleSize = 0;
float targetSize = 0;
float maxSize = 500;

color currentCol;

void setup() {
  size(900, 600);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 12);  // deep grey background 

  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 512);

  currentCol = color(120, 60, 70);  // starting green tone
}

void draw() {
  // smooth trailing effect
  if (trails) {
    noStroke();
    fill(0, 0, 12, 15);  // gentle background fade
    rect(0, 0, width, height);
  } else background(0, 0, 12);

  // read mic input
  float level = mic.mix.level() * sensitivity;

  // smooth out fluctuations (avoid flicker)
  targetSize = map(level, 0, 4, 100, maxSize);
  circleSize = lerp(circleSize, targetSize, smoothFactor);

  // determine colour by loudness zones
  // < 2.0 ~ <90 dB → green
  // 2.0–3.5 ~ 90–100 dB → orange
  // >3.5 ~ >100 dB → red
  float hueVal;
  if (level < 2.0)      hueVal = 120;  // dark green
  else if (level < 3.5) hueVal = 40;   // golden-orange
  else                  hueVal = 0;    // rich red

  // saturation & brightness slightly higher for bold but non-neon tones
  currentCol = color(hueVal, 70, 85);

  // draw main circle
  noStroke();
  fill(currentCol, 90);
  ellipse(width/2, height/2, circleSize, circleSize);

  // add a subtle halo for warmth
  fill(hue(currentCol), saturation(currentCol), 100, 12);
  ellipse(width/2, height/2, circleSize * 1.3, circleSize * 1.3);

}
