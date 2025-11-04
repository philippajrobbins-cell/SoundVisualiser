# SoundVisualiser
An interactive animation that recives sound and displays it in a unqiue way.

is an interactive, data-driven prototype that transforms live sound into motion and colour.  
Developed in **Processing (Java mode)** using the **Minim** audio library, the program visualises microphone input through a single animated circle.  

As the sound grows louder, the circle expands and changes colour from green to orange and red, representing safe, caution, and danger sound levels.  
The project aims to promote awareness around **hearing protection** in live music environments, turning invisible sound data into a calm, aesthetically engaging experience.  

---

# Features  
- **Real-time sound input:** Captures and analyses live audio using the Minim library.  
- **Smooth animation:** Uses `lerp()` (linear interpolation) to create fluid, organic motion.  
- **Colour feedback:**  
  - Green → Safe (below 90 dB)  
  - Orange → Warning (90–100 dB)  
  - Red → Danger (above 100 dB)  

- 🌈 **Visual design:** Dark, colourful tones and smooth transitions create a subtle, ambient feel suited for festivals or installations.  

---

## ⚙️ Installation  
1. Download and install [Processing](https://processing.org/download/).  
2. Add the [Minim library](https://code.compartmental.net/tools/minim/):  
   - In Processing: go to **Sketch → Import Library → Add Library…**, search **“Minim”**, then click **Install**.  
3. Clone or download this repository:  
   ```bash
   git clone https://github.com/<your-username>/pastel-sound-visualiser.git
