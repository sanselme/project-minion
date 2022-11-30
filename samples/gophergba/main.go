package main

import (
	"machine"
	"runtime/interrupt"
)

func main() {
	// Set up the display
	display.Configure()

	// Register display status
	regDispStat.SetBits(1<<3 | 1<<4)

	// Display Gopher text message and draw our Gophers
	drawGophers()

	// Creates an interrupt that will call the "update" function
	// bellow, hardware way to display things on the screen
	interrupt.New(machine.IRQ_VBLANK, update).Enable()

	// TODO: Infinite loop to avoid exiting the application
	for {
	}
}
