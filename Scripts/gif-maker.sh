#!/bin/bash

mkdir frames
ffmpeg -i input.mp4 -vf "fps=15,scale=640:-1" frames/frame_%04d.png

ffmpeg -i input.mp4 -vf "fps=15,scale=640:-1,palettegen" palette.png

ffmpeg -framerate 15 -i frames/frame_%04d.png -i palette.png -lavfi "paletteuse" output.gif
