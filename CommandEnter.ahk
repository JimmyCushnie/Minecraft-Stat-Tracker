; This script enters every line of a file into Minecraft chat, preceded by the / character.
; Data Packs are the optimal way of running thousands of commands in Minecraft, but sometimes those are not an option.

; Unfortunately I was not able to optimize the speed very much; without the three `sleep 100`s minecraft freaks out and doesn't work properly.
; The script takes about 30 minutes to add all 4,552 objectives.




sleep 3000                              ; give me some time to alt-tab to minecraft after starting the program

FileRead, commands, Commands.txt        ; load Commmands.txt (in the same directory as this script) as a string called `commands`

loop, parse, commands, `n               ; parse the `commands` string line by line (`n means line break)
{
    Send /                              ; open chat box with command key   
    sleep 100                           ; wait for chat box to open    
    SendInput % a_loopfield             ; type the next line/command
    sleep 100
    send {enter}                        ; enter the line/command
    sleep 100
}