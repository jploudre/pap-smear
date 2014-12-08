#InstallKeybdHook
return
 
F12::
; Start on Desktop. papsmear.csv in same folder.
; Read CSV by line and parse for Patient Name and Pap Date
Loop, read, papsmear.csv
{
    Loop, parse, A_LoopReadLine, CSV
    {
               
        ; Column 1, Date; Column 3, Name
        if (A_Index = 1)
        PapSmearDate = %A_LoopField%
        if (A_Index = 3)
        PatientName = %A_LoopField%
    }
    FindPatient(PatientName)
    ReviewPap(PatientName, PapSmearDate)
    OpenPreventiveUpdate()
    AddPapInfo(PatientName, PapSmearDate)
    SignAndContinue()
}
return
 
FindPatient(PatientName){
Send ^f
WinWaitActive, Find Patient
WaitforCitrix()
Send %PatientName%{Enter}
WaitforCitrix()
    ; Check for duplicate names (nearly black pixels on second line).
    PixelSearch, , , 22, 204, 259, 215, 0x000000, 3, Fast
    ; No Match Error means single name, so hit enter to open
    if Errorlevel {
    Send {Enter}
    } else {
    ; Wait for someone to select a name
    WinWaitNotActive, Find Patient
    }
WaitforCitrix()
}
 
ReviewPap(PatientName, PapSmearDate){
 
Progress, zh0 fs18, %PapSmearDate% `nThen 'F5'
; Could be more assisted. Use 'Labs' Custom View
 
Pause, On
}
 
OpenPreventiveUpdate(){
; Assumes Pap Document is selected
; Opens Update using keyboard shortcuts.
Send ^j
WinWaitActive, Append to
WaitforCitrix()
Send !F
WinWaitActive, Append Document
WaitforCitrix()
Send Clin{Down 4}{Enter}
WinWaitActive, Update
WaitforCitrix()
Send +{F8}
WaitforCitrix()
Send ^{PgDn}
WaitforCitrix()
}
 
AddPapInfo(PatientName, PapSmearDate){
Progress, zh0 fs18, %PapSmearDate% `nThen 'F5'
clipboard = %PapSmearDate%
Pause, On
}
 
SignAndContinue(){
; End/Sign
Click, 613, 112 ; Commit to Flowsheet Button
Send, ^e
WinWaitActive, End Update
WaitforCitrix()
Send, !s
WinWaitNotActive, End Update
WaitforCitrix()
; Switch to Desktop.
WinGetPos,,,,winheight,A
ypos := winheight - 161
Click, 13, %ypos%
}
 
WaitforCitrix(){
; Additional Pauses to account for Interface Lag
Sleep, 200
}
 
F5::
Pause, off
Progress, Off
return