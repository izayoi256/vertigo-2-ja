@echo off
cd /d %~dp0
powershell -NoProfile -ExecutionPolicy Unrestricted .\localize.ps1
