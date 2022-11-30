package main

import (
	"runtime/interrupt"

	"tinygo.org/x/tinydraw"
	"tinygo.org/x/tinyfont"

	"github.com/sanselme/project-minion/samples/gophergba/pkg/fonts"
)

func drawGophers() {
	// Display a textual message "Gopher" with Google colors
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 36, 60, 'G', gBlue)
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 71, 60, 'o', gRed)
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 98, 60, 'p', gYellow)
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 126, 60, 'h', gGreen)
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 154, 60, 'e', gBlue)
	tinyfont.DrawChar(display, &fonts.Bold24pt7b, 180, 60, 'r', gRed)

	// Display a "press START button" message - center
	tinyfont.WriteLine(display, &tinyfont.TomThumb, 85, 90, "Press START button", white)

	// Display two gophers
	tinyfont.DrawChar(display, &fonts.Regular58pt, 5, 140, 'B', green)
	tinyfont.DrawChar(display, &fonts.Regular58pt, 195, 140, 'X', red)
}

func clearScreen() {
	tinydraw.FilledRectangle(display, int16(0), int16(0), screenWidth, screenHeight, black)
}

func update(interrupt.Interrupt) {
	// Read uint16 from register regKeypad that represents the state
	// of current buttons pressed and compares it against the defined
	// values for each button on the GBA
	switch regKeypad.Get() {
	// Start the "game"
	case keyStart:
		// Clear display
		clearScreen()

		// Display gopher
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	// Go back to Menu
	case keySelect:
		clearScreen()
		drawGophers()
	// Gopher to the right
	case keyRight:
		// Clear display
		clearScreen()
		x += 10
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	// Gopher to the left
	case keyLeft:
		// Clear display
		clearScreen()
		x -= 10
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	// Gopher to the down
	case keyDown:
		// Clear display
		clearScreen()
		y += 10
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	// Gopher to the up
	case keyUp:
		// Clear display
		clearScreen()
		y -= 10
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	// Gopher jump
	case keyA:
		// Clear display
		clearScreen()
		y -= 20
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
		// Clear display
		clearScreen()
		y += 20
		tinyfont.DrawChar(display, &fonts.Regular58pt, x, y, 'B', green)
	}
}
