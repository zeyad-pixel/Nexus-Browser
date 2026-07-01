; all paths are according to my system , do adjust all those accordingly while generating your installer

[Setup]
AppId={{B5BAF560-08C6-4A70-B7CE-F043325988D1}}
AppName=Nexus Browser
AppVersion=2.0
UninstallDisplayName=Nexus Browser
AppPublisher=Abhijit-71
AppPublisherURL=https://www.github.com/Abhijit-71/Nexus Browser
AppSupportURL=https://www.github.com/Abhijit-71/Nexus Browser
AppUpdatesURL=https://www.github.com/Abhijit-71/Nexus Browser

; Install to Program Files
DefaultDirName={pf}\Nexus Browser

; Needs admin to write associations & Program Files
PrivilegesRequired=admin

UninstallDisplayIcon={app}\Nexus Browser.exe

ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

DefaultGroupName=Nexus Browser

LicenseFile=LICENSE.txt

OutputBaseFilename=Nexus Browser_setup

; Soft-coded icon, must exist inside overall project
SetupIconFile=dbrowser_logo.ico

SolidCompression=yes
WizardStyle=modern


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; \
    GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce


[Files]
; Main EXE
Source: "C:\Users\Abhijit\Desktop\Nexus Browser\src\dist\Nexus Browser\Nexus Browser.exe"; \
    DestDir: "{app}"; Flags: ignoreversion

; All supporting files
Source: "C:\Users\Abhijit\Desktop\Nexus Browser\src\dist\Nexus Browser\*"; \
    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; Setup icon (soft coded)
Source: "C:\Users\Abhijit\Desktop\Nexus Browser\src\svg\dbrowser_logo.ico"; \
    DestDir: "{app}"


[Icons]
Name: "{group}\Nexus Browser"; Filename: "{app}\Nexus Browser.exe"
Name: "{autodesktop}\Nexus Browser"; Filename: "{app}\Nexus Browser.exe"; Tasks: desktopicon


[Run]
Filename: "{app}\Nexus Browser.exe"; Description: "{cm:LaunchProgram,Nexus Browser}"; \
    Flags: nowait postinstall skipifsilent


; ---------------------------
;     FILE ASSOCIATIONS
; ---------------------------
[Registry]

; ---------- PDF ----------
Root: HKCR; Subkey: ".pdf"; ValueType: string; ValueData: "Nexus Browser.pdf"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Nexus Browser.pdf"; ValueType: string; ValueData: "PDF File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Nexus Browser.pdf\DefaultIcon"; ValueType: string; ValueData: "{app}\_internal\svg\pdf.ico"
Root: HKCR; Subkey: "Nexus Browser.pdf\shell\open\command"; \
    ValueType: string; ValueData: """{app}\Nexus Browser.exe"" ""%1"""

    
; ---------- HTML ----------
Root: HKCR; Subkey: ".html"; ValueType: string; ValueData: "Nexus Browser.html"; Flags: uninsdeletevalue
Root: HKCR; Subkey: ".htm";  ValueType: string; ValueData: "Nexus Browser.html"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Nexus Browser.html"; ValueType: string; ValueData: "HTML File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Nexus Browser.html\DefaultIcon"; ValueType: string; ValueData: "{app}\_internal\svg\html.ico"
Root: HKCR; Subkey: "Nexus Browser.html\shell\open\command"; \
    ValueType: string; ValueData: """{app}\Nexus Browser.exe"" ""%1"""

; ---------- SVG ----------
Root: HKCR; Subkey: ".svg"; ValueType: string; ValueData: "Nexus Browser.svg"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "Nexus Browser.svg"; ValueType: string; ValueData: "SVG File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Nexus Browser.svg\DefaultIcon"; ValueType: string; ValueData: "{app}\_internal\svg\svg.ico"
Root: HKCR; Subkey: "Nexus Browser.svg\shell\open\command"; \
    ValueType: string; ValueData: """{app}\Nexus Browser.exe"" ""%1"""