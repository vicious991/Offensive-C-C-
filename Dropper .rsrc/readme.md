This Dropper stores the Payload in .rsrc section of PE

- Shellcode == message box
- extract shellcode from .rsrc section
- decrypt shellcode (XOR encryption method)
- inject shellcode into notepad.exe (shellcode injection into process)
- get rid of console window ( Hiding console)

// change the payload .bin file as you wish

Encrypt our payload
1. python.exe .\xoreccrypt.py msgbox64.bin (payload)
2. favicon.ico will be created 
3. run compile.bat // modify compile.bat accoring to wish if its a gui program(WINDOWS) or command line (CONSOLE)
4. implant.exe will be created 
