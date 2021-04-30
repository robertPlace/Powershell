Add-Type -AssemblyName System.speech
$Speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$Speak.Speak(“hello? hello? can you hear me? Is this thing working?”)
