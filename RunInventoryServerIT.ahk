#Requires AutoHotkey v2.0

^!n::  ; Ctrl+Alt+N
{
    if WinExist("ahk_class SunAwtFrame")
    	WinActivate
    else
        Run "Notepad"

    RunIT
}

RunIT() 
{
	startTime := FormatTime()
	loops := 100
	loopCounter := 0
	Loop loops
	{

		MouseClick "left", 1231, 13
		sleep 30000

		found := 0
		;MsgBox "Inside loop"
		maxWhile := 0
		while (found < 1)
		{
			;MsgBox "Inside while"
			if maxWhile >= 10
				break
			try
			{
				if ImageSearch(&FoundX, &FoundY, 20, 900, 430, 995, "C:\Users\Scott\Documents\AutoHotkey\tests-passed.png" ) {
					found := 1
					;MsgBox "image found " FoundX "x" FoundY
					break
				}
				else
				{
					;MsgBox "image not found on screen"
					maxWhile += 1
					sleep 2000
				}
			}
			catch as exc
				MsgBox "Could not conduct the search due to the following error:`n" exc.Message
		}
		dest := "C:\Users\Scott\scratch\ij-test-logs\yo-ra-" loopCounter ".txt"
		FileCopy "C:\Users\Scott\scratch\ij-test-logs\yo-ra.txt", dest, 1
		loopCounter += 1
	}
	endTime:= FormatTime() 
	MsgBox "done RunIT " found "- ran " loopCounter " started " startTime " - ended " endTime
}
