#Current date +1 week to get notified before the expiration date

DATE=`date -d '+1 week' +%Y%m%d`

#Jira URL and username replace set to the correct one
 
URL=http://mydemojira.loc/rest/plugins/1.0/installed-marketplace?updates=true
LOGIN=

#Get Jira json and expiration dates

JQO=`curl -s -u$LOGIN $URL | jq '.plugins[].licenseDetails | select ( .expiryDateString != null) | .expiryDateString' | sed --expression='s=/=-=g' | sed --expression 's/"//g' | date +"%Y%m%d" -f -`


for i in $JQO;
	do
if [ $i -le $DATE ]; 
	then
		echo "WARNING! Check Jira Licenses before $i!" && exit 1
fi
	done


#For displaying message only once according to the exit code

if [ $? -ne 1 ]; then
	echo	"All Jira Licenses are ok!"
fi
