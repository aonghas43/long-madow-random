rem
rem
rem

SET SLPATH=D:\opt\spatialite-tools-5.0.0-win-amd64\
SET DBPATH=C:\Users\angus\
SET SPATH=d:\RETIRE\long-meadow-random\scripts\

SETLOCAL ENABLEDELAYEDEXPANSION
FOR %%S in (sites-set-1 sites-set-2 sites-set-3) DO (

    COPY %SPATH%\..\w3w-!S!.csv   %SPATH%\..\w3w.csv
    %SLPATH%\spatialite %DBPATH%\%S < %SPATH%\sites.spatialite.sql >> %SPATH%\!S!-mergew3w.log
    
)



