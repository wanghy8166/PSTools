cd /d D:\zabbix_agents\zabbix_agents_3.0.4.win\
rem bin\win32\zabbix_agentd.exe --config conf\zabbix_agentd.win.conf --install 

if /i "%PROCESSOR_ARCHITECTURE%"=="AMD64" (bin\win64\zabbix_agentd.exe --config conf\zabbix_agentd.win.conf --install) else (bin\win32\zabbix_agentd.exe --config conf\zabbix_agentd.win.conf --install)

net start "Zabbix Agent"