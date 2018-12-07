#json with plugins info . Replace with your json file
FILE=~/jira-plugins.json

#Current date +1 week to get notified before the expiration 
DATE=`date -d '+1 week' +%Y%m%d`

#json reformatting  
JQO=`jq '.[] | select (.licenseDetails.expiryDateString != null ) | .licenseDetails.expiryDateString' $FILE | sed --expression='s=/=-=g' | sed --expression 's/"//g' | date +"%Y%m%d" -f -`


#In this example script checks saved json output if there are licenses with expire date during current week. script will warn and stop after first match 

for i in $JQO;
	do
if [ $i -le $DATE ]; 
	then
		echo    "Check Jira Licenses" && exit 1
fi
	done


#For displaying message only once according to the exit code

if [ $? -ne 1 ]; then
	echo	"All Jira Licenses are ok!"
fi
