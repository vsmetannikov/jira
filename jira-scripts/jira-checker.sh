#/bin/bash
#Jira localhost checker
 
URL="http://localhost:8080/secure/Dashboard.jspa"
RSP=`curl --write-out "%{http_code}\n" --silent --output /dev/null $URL` 
JIRA_HOME=/opt/atlassian/jira
CATALINA_PID="/opt/atlassian/jira/work/catalina.pid"
LOG="/opt/atlassian/checker.log"

restartjira() {
if [ ! -f $CATALINA_PID  ]; then
	$JIRA_HOME/bin/start-jira.sh
	else
	$JIRA_HOME/bin/stop-jira.sh && $JIRA_HOME/bin/start-jira.sh
fi
}

if [ $RSP != 200 ]; then
	echo "Jira is respawning now,check the log @ `date`" | tee -a $LOG
	restartjira
	else 
	echo "Relax Jira is okay @ `date`" | tee -a $LOG 
fi
