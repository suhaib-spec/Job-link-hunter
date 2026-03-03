@echo off
echo ============================================
echo   Link Hunter - Job Posting Monitor
echo ============================================
echo.
echo IMPORTANT: Make sure Chrome is fully closed!
echo (Check Task Manager for any chrome.exe processes)
echo.
pause
python "%~dp0job_hunter.py"
pause
