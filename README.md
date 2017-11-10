# Generative X
This is a simple piece of algorithmic artwork I developed for an assignment in Art-104: Foundations: Visual Thinking. 

## Running

This can program can be run if you have the [processing](https://processing.org/) software sketchbook. This is a language based off of Java with a focus on the visual arts. After cloning the repository, simply load it up into the sketchbook and run it.

## How it works
This algorithm places an invisible X on a canvas, where it then throws a large amount of points on at this canvas. If the point falls on the X, that point will be saved, whereas it will be ignored if it lies elsewhere. Afterwords, it will go through all these points and connect points that are located close enough to eachother, giving each line a random color.

![Alt text](generative_x.png "Generative X")