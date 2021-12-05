#!/bin/bash

mimeo "$(locate home media | rofi -threads 0 -dmenu -i -p "locate:")"

