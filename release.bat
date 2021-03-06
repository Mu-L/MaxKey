call setEnvVars.bat

set START_TIME="%date:~0,10% %time:~0,2%:%time:~3,5%"
echo start time %START_TIME%
call %JAVA_HOME%/bin/java -version

call %GRADLE_HOME%/bin/gradle -version

call %GRADLE_HOME%/bin/gradle -q projects

echo start clean . . .

call %GRADLE_HOME%/bin/gradle clean

echo start clean complete . 

call %GRADLE_HOME%/bin/gradle buildRelease --stacktrace  --warning-mode all

call %GRADLE_HOME%/bin/gradle copyDepJars --stacktrace  --warning-mode all

call %GRADLE_HOME%/bin/gradle buildReleaseCopy --stacktrace  --warning-mode all

cd build
rd /q /s libs

rd /q /s tmp

cd ..

set END_TIME="%date:~0,10% %time:~0,2%:%time:~3,5%"

echo Build Release start at %START_TIME%  complete at %END_TIME%.

pause