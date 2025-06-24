@echo off
setlocal enabledelayedexpansion

:: -----------------------------------------------------------------------------
:: Bloco de elevação de privilégios.
:: -----------------------------------------------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting Administrator privileges...
    echo Solicitando privilegios de Administrador...
    echo Demande des privileges Administrateur...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: =============================================================================
:: TELA DE SELECAO DE IDIOMA
:: =============================================================================
:select_lang
chcp 65001 >nul
color 0B
mode con:cols=100 lines=40
cls
echo.
echo     ╦  ╦┌─┐┌┐┌┬┌─┐┬ ┬  ╔═╗┬─┐┌─┐┌─┐┌─┐┬─┐
echo     ╚╗╔╝├─┤││││└─┐├─┤  ║╣ ├┬┘├─┤└─┐├┤ ├┬┘
echo      ╚╝ ┴ ┴┘└┘┴└─┘┴ ┴  ╚═╝┴└─┴ ┴└─┘└─┘┴└─
echo.
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                 Please select your language / Por favor selecione o seu idioma   ║
echo    ║                            Veuillez selectionner votre langue                    ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo      [1] English
echo      [2] Portugues (Brasil)
echo      [3] Francais
echo.
echo.
set /p "lang_choice=[Language]:> "
if /i "%lang_choice%"=="1" set "lang=en" & goto define_lang
if /i "%lang_choice%"=="2" set "lang=pt" & goto define_lang
if /i "%lang_choice%"=="3" set "lang=fr" & goto define_lang
goto select_lang

:: =============================================================================
:: DEFINICAO DAS VARIAVEIS DE IDIOMA
:: =============================================================================
:define_lang
:: --- English ---
set "title_en=VanishEraser 5.1 - Multilingual"
set "welcome1_en=Welcome to the VanishEraser Control Panel"
set "welcome2_en=Type [help] to see the commands below"
set "welcome3_en=Developed by ve(tm) - github.com/seu-usuario"
set "menu1_en=Start Removal"
set "menu2_en=Credits"
set "menu3_en=Exit"
set "prompt_en=[VanishEraser]:> "
set "invalid_op_en=Invalid Option. Press any key to try again."
set "rem_title_en=[ REMOVAL MODE ]"
set "rem_warn1_en=WARNING: This tool performs deep system operations."
set "rem_warn2_en=Use with caution. The developer is not responsible for any damage."
set "rem_prompt_en=[App Name]:> "
set "rem_invalid_name_en=Invalid name. Press any key to go back."
set "rem_starting_en=STARTING REMOVAL PROCESS"
set "rem_complete_en=Operation complete. Press any key to return to the menu."
set "cred_title_en=[ CREDITS ]"
set "cred_tool_en=Tool"
set "cred_version_en=Version"
set "cred_dev_en=Developer"
set "cred_desc_en=Utility for forced removal and cleanup of software residues."
set "cred_back_en=Press any key to return to the main menu..."
set "help_title_en=[ COMMAND HELP ]"
set "help_desc_en=Below is a list of available commands:"
set "help_cmd1_en=1 - Starts the application removal process."
set "help_cmd2_en=2 - Displays credits and tool information."
set "help_cmd3_en=3 - Closes the VanishEraser."
set "help_cmd_help_en=help - Displays this help screen."
:: --- Portugues ---
set "title_pt=VanishEraser 5.1 - Multilingue"
set "welcome1_pt=Bem-vindo ao Painel de Controle VanishEraser"
set "welcome2_pt=Digite [help] para ver os comandos abaixo"
set "welcome3_pt=Desenvolvido por ve(tm) - github.com/seu-usuario"
set "menu1_pt=Iniciar Remocao"
set "menu2_pt=Creditos"
set "menu3_pt=Sair"
set "prompt_pt=[VanishEraser]:> "
set "invalid_op_pt=Opcao Invalida. Pressione qualquer tecla para tentar novamente."
set "rem_title_pt=[ MODO DE REMOCAO ]"
set "rem_warn1_pt=ATENCAO: Esta ferramenta realiza operacoes profundas no sistema."
set "rem_warn2_pt=Use com cuidado. O desenvolvedor nao se responsabiliza por danos."
set "rem_prompt_pt=[Nome do App]:> "
set "rem_invalid_name_pt=Nome invalido. Pressione qualquer tecla para voltar."
set "rem_starting_pt=INICIANDO PROCESSO DE REMOCAO"
set "rem_complete_pt=Operacao concluida. Pressione qualquer tecla para voltar ao menu."
set "cred_title_pt=[ CREDITOS ]"
set "cred_tool_pt=Ferramenta"
set "cred_version_pt=Versao"
set "cred_dev_pt=Desenvolvedor"
set "cred_desc_pt=Utilitario para remocao forcada e limpeza de residuos de software."
set "cred_back_pt=Pressione qualquer tecla para voltar ao menu principal..."
set "help_title_pt=[ AJUDA DE COMANDOS ]"
set "help_desc_pt=Abaixo esta uma lista de comandos disponiveis:"
set "help_cmd1_pt=1 - Inicia o processo de remocao de aplicativos."
set "help_cmd2_pt=2 - Exibe os creditos e informacoes da ferramenta."
set "help_cmd3_pt=3 - Fecha o VanishEraser."
set "help_cmd_help_pt=help - Exibe esta tela de ajuda."
:: --- Francais ---
set "title_fr=VanishEraser 5.1 - Multilingue"
set "welcome1_fr=Bienvenue dans le Panneau de Controle VanishEraser"
set "welcome2_fr=Tapez [help] pour voir les commandes ci-dessous"
set "welcome3_fr=Developpe par ve(tm) - github.com/seu-usuario"
set "menu1_fr=Demarrer Suppression"
set "menu2_fr=Credits"
set "menu3_fr=Quitter"
set "prompt_fr=[VanishEraser]:> "
set "invalid_op_fr=Option Invalide. Appuyez sur une touche pour reessayer."
set "rem_title_fr=[ MODE SUPPRESSION ]"
set "rem_warn1_fr=ATTENTION: Cet outil effectue des operations systeme profondes."
set "rem_warn2_fr=Utilisez avec prudence. Le developpeur n'est pas responsable des dommages."
set "rem_prompt_fr=[Nom de l'App]:> "
set "rem_invalid_name_fr=Nom invalide. Appuyez sur une touche pour revenir."
set "rem_starting_fr=LANCEMENT DU PROCESSUS DE SUPPRESSION"
set "rem_complete_fr=Operation terminee. Appuyez sur une touche pour revenir au menu."
set "cred_title_fr=[ CREDITS ]"
set "cred_tool_fr=Outil"
set "cred_version_fr=Version"
set "cred_dev_fr=Developpeur"
set "cred_desc_fr=Utilitaire pour la suppression forcee et le nettoyage des residus logiciels."
set "cred_back_fr=Appuyez sur une touche pour revenir au menu principal..."
set "help_title_fr=[ AIDE DES COMMANDES ]"
set "help_desc_fr=Voici une liste des commandes disponibles :"
set "help_cmd1_fr=1 - Demarre le processus de suppression d'application."
set "help_cmd2_fr=2 - Affiche les credits et les informations sur l'outil."
set "help_cmd3_fr=3 - Ferme le VanishEraser."
set "help_cmd_help_fr=help - Affiche cet ecran d'aide."

:: PowerShell Language Strings
set "ps_init_en=VanishEraser Engine (PowerShell) started." & set "ps_init_pt=Motor VanishEraser (PowerShell) iniciado." & set "ps_init_fr=Moteur VanishEraser (PowerShell) demarre."
set "ps_phase1_en=PHASE 1: Uninstall via Winget" & set "ps_phase1_pt=FASE 1: Desinstalacao via Winget" & set "ps_phase1_fr=PHASE 1: Desinstallation via Winget"
set "ps_p1_fail_en=No compatible app found in Winget." & set "ps_p1_fail_pt=Nenhum app compativel encontrado no Winget." & set "ps_p1_fail_fr=Aucune application compatible trouvee dans Winget."
set "ps_phase2_en=PHASE 2: Uninstall via Windows Registry" & set "ps_phase2_pt=FASE 2: Desinstalacao via Registro do Windows" & set "ps_phase2_fr=PHASE 2: Desinstallation via le Registre Windows"
set "ps_p2_found_en=Found" & set "ps_p2_found_pt=Encontrado" & set "ps_p2_found_fr=Trouve"
set "ps_p2_exec_en=Executing uninstaller" & set "ps_p2_exec_pt=Executando desinstalador" & set "ps_p2_exec_fr=Execution du desinstallateur"
set "ps_p2_fail_en=No standard uninstaller found in Registry." & set "ps_p2_fail_pt=Nenhum desinstalador padrao encontrado no Registro." & set "ps_p2_fail_fr=Aucun desinstallateur standard trouve dans le Registre."
set "ps_phase3_en=PHASE 3: Cleaning residual directories" & set "ps_phase3_pt=FASE 3: Limpando diretorios residuais" & set "ps_phase3_fr=PHASE 3: Nettoyage des repertoires residuels"
set "ps_phase4_en=PHASE 4: Cleaning residual registry keys" & set "ps_phase4_pt=FASE 4: Limpando chaves de registro residuais" & set "ps_phase4_fr=PHASE 4: Nettoyage des cles de registre residuelles"
set "ps_final_en=Operation finished successfully." & set "ps_final_pt=Operacao finalizada com sucesso." & set "ps_final_fr=Operation terminee avec succes."
set "ps_uninst_en=Uninstalling" & set "ps_uninst_pt=Desinstalando" & set "ps_uninst_fr=Desinstallation de"
set "ps_uninst_ps_en=uninstaller for" & set "ps_uninst_ps_pt=desinstalador para" & set "ps_uninst_ps_fr=desinstallateur pour"
set "ps_uninst_done_en=executed" & set "ps_uninst_done_pt=executado" & set "ps_uninst_done_fr=execute"
set "ps_uninst_fail_en=Failed to run" & set "ps_uninst_fail_pt=Falha ao executar" & set "ps_uninst_fail_fr=Echec de l'execution"
set "ps_rem_dir_en=Removing directory" & set "ps_rem_dir_pt=Removendo diretorio" & set "ps_rem_dir_fr=Suppression du repertoire"
set "ps_rem_key_en=Removing registry key" & set "ps_rem_key_pt=Removendo chave de registro" & set "ps_rem_key_fr=Suppression de la cle de registre"
goto main_menu

:: =============================================================================
:: MENU PRINCIPAL
:: =============================================================================
:main_menu
title !title_%lang%!
cls
echo.
echo     ╦  ╦┌─┐┌┐┌┬┌─┐┬ ┬  ╔═╗┬─┐┌─┐┌─┐┌─┐┬─┐
echo     ╚╗╔╝├─┤││││└─┐├─┤  ║╣ ├┬┘├─┤└─┐├┤ ├┬┘
echo      ╚╝ ┴ ┴┘└┘┴└─┘┴ ┴  ╚═╝┴└─┴ ┴└─┘└─┘┴└─
echo.
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                 !welcome1_%lang%!                        ║
echo    ║                 !welcome2_%lang%!                            ║
echo    ║                 !welcome3_%lang%!                     ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo      [1] !menu1_%lang%!            [2] !menu2_%lang%!            [3] !menu3_%lang%!
echo.
echo.
set /p "choice=!prompt_%lang%!"
if /i "%choice%"=="1" goto remove_app_section
if /i "%choice%"=="2" goto credits_section
if /i "%choice%"=="3" exit /b
if /i "%choice%"=="help" goto help_section
echo.
echo   !invalid_op_%lang%!
pause >nul
goto main_menu

:: =============================================================================
:: SESSÃO DE AJUDA
:: =============================================================================
:help_section
cls
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                                !help_title_%lang%!                                   ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo      !help_desc_%lang%!
echo.
echo        !help_cmd1_%lang%!
echo        !help_cmd2_%lang%!
echo        !help_cmd3_%lang%!
echo        !help_cmd_help_%lang%!
echo.
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║ !cred_back_%lang%!                        ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
pause >nul
goto main_menu


:: =============================================================================
:: SESSÃO DE REMOÇÃO DE APLICATIVO
:: =============================================================================
:remove_app_section
cls
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                            !rem_title_%lang%!                                   ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo       !rem_warn1_%lang%!
echo       !rem_warn2_%lang%!
echo.
set /p "appname=!rem_prompt_%lang%!"
if "%appname%"=="" (
    echo.
    echo   !rem_invalid_name_%lang%!
    pause >nul
    goto remove_app_section
)
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                        !rem_starting_%lang%!                             ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.

powershell -ExecutionPolicy Bypass -NoProfile -Command ^
    "param($AppName, $ps_init, $ps_phase1, $ps_p1_fail, $ps_phase2, $ps_p2_found, $ps_p2_exec, $ps_p2_fail, $ps_phase3, $ps_phase4, $ps_final, $ps_uninst, $ps_uninst_ps, $ps_uninst_done, $ps_uninst_fail, $ps_rem_dir, $ps_rem_key);" ^
    "" ^
    "function Write-Log { param([string]$Message, [string]$Type = 'INFO'); Write-Host ('  [*] [{0}] {1}' -f $Type.ToUpper(), $Message) };" ^
    "" ^
    "Write-Log $ps_init -Type 'SYSTEM';" ^
    "Write-Log $ps_phase1;" ^
    "try { $wingetApps = winget list --name $AppName --accept-source-agreements | Select-Object -Skip 2; } catch { $wingetApps = $null; };" ^
    "if ($wingetApps) { foreach ($app in $wingetApps) { $appId = ($app -split ' ')[0]; if ($appId) { Write-Log ('{0} `'{1}`' com Winget...' -f $ps_uninst, $appId) -Type 'ACTION'; winget uninstall --id $appId --silent --accept-source-agreements --force; } } } else { Write-Log $ps_p1_fail; };" ^
    "" ^
    "Write-Log $ps_phase2;" ^
    "$uninstallKeys = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*');" ^
    "$appsFound = Get-ItemProperty $uninstallKeys -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like ""*$AppName*"" -and $_.UninstallString };" ^
    "if ($appsFound) { foreach ($app in $appsFound) { Write-Log ('{0}: {1}' -f $ps_p2_found, $app.DisplayName); Write-Log ('{0}: {1}' -f $ps_p2_exec, $app.UninstallString) -Type 'ACTION'; $uninst = $app.UninstallString; if ($uninst -match 'msiexec') { $args = $uninst.Replace('/I', '/X') + ' /qn /norestart'; } else { $args = $uninst + ' /S /silent /verysilent /quiet /qn'; }; try { Start-Process cmd.exe -ArgumentList ""/c $args"" -Wait -ErrorAction Stop; Write-Log ('{0} `'{1}`' {2}' -f $ps_uninst_ps, $app.DisplayName, $ps_uninst_done); } catch { Write-Log ('{0} {1} `'{2}`'.' -f $ps_uninst_fail, $ps_uninst_ps, $app.DisplayName) -Type 'ERROR'; } } } else { Write-Log $ps_p2_fail; };" ^
    "" ^
    "Write-Log $ps_phase3;" ^
    "$searchPaths = @($env:ProgramFiles, $env:ProgramFilesX86, $env:ProgramData, $env:APPDATA, $env:LOCALAPPDATA);" ^
    "foreach ($path in $searchPaths) { Get-ChildItem -Path $path -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Name -like ""*$AppName*"" } | ForEach-Object { Write-Log ('{0}: {1}' -f $ps_rem_dir, $_.FullName) -Type 'ACTION'; Remove-Item -Path $_.FullName -Recurse -Force; } };" ^
    "" ^
    "Write-Log $ps_phase4;" ^
    "$regPaths = @('HKCU:\Software', 'HKLM:\SOFTWARE', 'HKLM:\SOFTWARE\WOW6432Node');" ^
    "foreach($path in $regPaths){ Get-ChildItem -Path $path -Force -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -like ""*$AppName*"" } | ForEach-Object { Write-Log ('{0}: {1}' -f $ps_rem_key, $_.Name) -Type 'ACTION'; Remove-Item -Path $_.PSPath -Recurse -Force; } };" ^
    "" ^
    "Write-Log $ps_final -Type 'SUCCESS';" ^
    "" -AppName "%appname%" -ps_init "!ps_init_%lang%!" -ps_phase1 "!ps_phase1_%lang%!" -ps_p1_fail "!ps_p1_fail_%lang%!" -ps_phase2 "!ps_phase2_%lang%!" -ps_p2_found "!ps_p2_found_%lang%!" -ps_p2_exec "!ps_p2_exec_%lang%!" -ps_p2_fail "!ps_p2_fail_%lang%!" -ps_phase3 "!ps_phase3_%lang%!" -ps_phase4 "!ps_phase4_%lang%!" -ps_final "!ps_final_%lang%!" -ps_uninst "!ps_uninst_%lang%!" -ps_uninst_ps "!ps_uninst_ps_%lang%!" -ps_uninst_done "!ps_uninst_done_%lang%!" -ps_uninst_fail "!ps_uninst_fail_%lang%!" -ps_rem_dir "!ps_rem_dir_%lang%!" -ps_rem_key "!ps_rem_key_%lang%!"

echo.
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║ !rem_complete_%lang%!                ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
pause >nul
goto main_menu

:: =============================================================================
:: SESSÃO DE CRÉDITOS
:: =============================================================================
:credits_section
cls
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║                                !cred_title_%lang%!                                      ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo      !cred_tool_%lang%! ..... VanishEraser 5.1
echo      !cred_version_%lang%! ......... Multilingual UI
echo      !cred_dev_%lang%! .. ve(tm)
echo      GitHub ......... github.com/seu-usuario
echo.
echo      !cred_desc_%lang%!
echo.
echo.
echo    ╔══════════════════════════════════════════════════════════════════════════════════╗
echo    ║ !cred_back_%lang%!                        ║
echo    ╚══════════════════════════════════════════════════════════════════════════════════╝
pause >nul
goto main_menu
