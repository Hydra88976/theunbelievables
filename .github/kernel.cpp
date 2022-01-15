// This is the main kernel file  of our operating system that is booted 
// from our bootloader at 0x7e00:0x0000 memory location
#include "include/cursor.h"
#include "include/mapping.h"
#include "include/types.h"
#include "include/printstr.h"
#include "include/keyboard.h"
//#include "idt.cpp"

//	[+] This is the main entry point of our c++ kernel
//  [+] directly loaded after bootloader

extern "C" void _main() {

	SetCursorPosition(PositionFromCoords(0, 0));
	//InitializeIDT();

	//MainKeyboardHandler = KeyboardHandler;
	PrintString("[+]=====================198XAD==================[+]\n");
	PrintString("\n[+]\n");
	PrintString("\n[+]\n");
	//PrintString(IntegerToString(500));
	//StandardKeyboardHandler(10,10);

	//float testFloat = -672.938f;

	//SetCursorPosition(PositionFromCoords(0, 1));
	//PrintString(FloatToString(testFloat, 10));
	return;
}

