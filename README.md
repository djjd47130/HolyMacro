# Holy Macro!
## Scripted macro language for UI automation

# IMPORTANT NOTE

This project is in very raw development. It is originally designed for a single particular purpose, but has inspiration behind it for a more complex user-scripted solution to automate UI interactions with your Windows desktop.

# Prerequisites

This project utilizes other third-party libraries:

 - [DWScript (Delphi Web Script)](https://github.com/EricGrange/DWScript)
 - [SynEdit (Delphi Syntax Editor)](https://github.com/SynEdit/SynEdit)
 - [VCL Styles Utils](https://github.com/RRUZ/vcl-styles-utils)
 - [JDLib (JD Component Library)](https://github.com/djjd47130/JDLib)

# How it Works

Holy Macro! uses DWS (Delphi Web Script) to allow you to write your own macro scripts to perform operations such as move the mouse, click the mouse, input keyboard strokes, wait for triggers, etc. Files are saved with the extension .hms (Holy Macro! Script) which is plain text, directly containing the actual script to be run. It works similar to JavaScript, but using Pascal syntax.

# Selecting Saved Point

When you press the "Select Saved Point" button, the entire screen will become dimmed and blue. At that point, you need to click at the point of your screen whereever you want. When you click that point, the dimmed screen will disappear and become normal. Then, that saved point can be used inside your script.

# Starting and Stopping

Clicking the "START" button will begin your automation. It will perform the mouse clicks and any other events you need on the given schedule. Press "STOP" to terminate the automation. 

# System Tray Icon

There is a tray icon which appears in your system tray (by the clock). When you close the main window, it does not exit the application - it just hides to the tray. To completely close the application, right-click the tray icon and choose "Exit Holy Macro!"
