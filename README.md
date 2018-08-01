# Clickr
## Simulate Mouse Clicks and much more

# IMPORTANT NOTE
This project is in very raw development. It is originally designed for a single particular purpose, but has inspiration behind it for a more complex user-scripted solution to automate UI interactions with your Windows desktop.

#How it Works

Currently, the logic is hard-coded to automatically "click" a certain point on the screen every 40 seconds. This consists of:

 1. Obtaining current mouse pointer position
 2. Moving the mouse position to a particular desired point
 3. "Clicking" the mouse's left button twice
 4. Waiting for 40 seconds before doing it again
 
This suites the requirements for its original purpose, but it is intended to grow into a more complex environment, where you can create your own schedule, simulate keyboard entry, gestures, and even write your own script for UI automation.

