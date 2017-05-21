echo %date% %time%>PAExec.log
set path=C:\Program Files\WinRAR;%path%
cls

for /f  "tokens=1-3 delims=;;" %%i in (host.txt) do (
echo ¡¾%%i¡¿ ¡¾%%j¡¿ ¡¾%%k¡¿

echo LogFile=D:\zabbix_agents\zabbix_agents_3.0.4.win\log\zabbix_agentd.log >D:\zabbix_agents\zabbix_agents_3.0.4.win\conf\zabbix_agentd.win.conf
echo Server=172.17.230.52 >>D:\zabbix_agents\zabbix_agents_3.0.4.win\conf\zabbix_agentd.win.conf
echo ServerActive=172.17.230.52 >>D:\zabbix_agents\zabbix_agents_3.0.4.win\conf\zabbix_agentd.win.conf
echo Hostname=%%k >>D:\zabbix_agents\zabbix_agents_3.0.4.win\conf\zabbix_agentd.win.conf

rar a -r -sfx c:\temp\zabbix_agents.exe D:\zabbix_agents\*.*
rar c c:\temp\zabbix_agents.exe < comment.txt

paexec.exe \\%%i -u administrator -p %%j -i -c -f -cnodel -to 15 "c:\temp\zabbix_agents_stop.bat"            -lo PAExec.log
paexec.exe \\%%i -u administrator -p %%j -i -c -f -cnodel -to 15 "c:\temp\zabbix_agents.exe"                 -lo PAExec.log
paexec.exe \\%%i -u administrator -p %%j -i -c -f -cnodel -to 15 "c:\temp\zabbix_agents_install_run_32.bat"  -lo PAExec.log

)

echo %date% %time% >>PAExec.log
pause
