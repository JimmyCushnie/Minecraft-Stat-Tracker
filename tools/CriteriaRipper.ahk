; This script is what I used to rip all the possible scoreboard objective criteria.
; If you go into Minecraft and type "/scoreboard objectives add test " and then hit tab, you'll see a list of all the possible objective criteria.
; This script will tab through each of those possibilities, copy them, and then paste them into a text document.

; HOW TO USE
; 1. make sure you have AutoHotKey installed: https://www.autohotkey.com/
; 2. make sure this file uses the extension ".ahk"
; 3. open a text editor (such as notepad) to a blank document
; 4. open minecraft to a world where you have OP priveleges
; 5. double click this file, running it with autohotkey
; 6. within 3 seconds, switch your focus to the notepad window, and then switch your focus to minecraft. Make sure there are no menus open in minecraft.
; 7. don't touch your computer for a couple hours




Sleep 3000                                      ; give me time to switch to notepad and then to minecraft

Loop 5400                                       ; in 1.14 there are 5377 objective criteria. This number may need to be increased in future updates.
{
    clipboard =                                 ; Empty the clipboard

    Send /                                      ; open chat box with command key
    sleep 5                                     ; wait for chat box to open
    SendInput scoreboard objectives add test
    Send {Space}                                ; I can't be assed to figure out how to send trailing spaces with SendInput        

    Loop %A_Index%                              ; Tab down the list of objective criteria
    {
        SendInput {TAB}    
    }

    Send ^a                                     ; select all
    copystart:
    Send ^x                                     ; copy the highlighted text

    ClipWait 0.5                                ; wait for the clipboard to contain data
    if ErrorLevel
    {
        MsgBox The attempt to copy text onto the clipboard failed.
        goto copystart
    }

    TabBack()                                   ; alt tab to the notepad window

    Send ^v                                     ; paste the URL
    Send {Enter}                                ; new line

    TabBack()                                   ; alt tab back to minecraft

    Send {Escape}                               ; close chat box
}


TabBack() ; hits alt-tab, the Windows keyboard shortcut to switch between the two most recently selected windows
{
    SetKeyDelay 20,30 ; Make sure we don't hit the keys too fast
    Send {ALT DOWN}{TAB}{ALT UP}
}