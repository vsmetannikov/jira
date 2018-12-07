#Update user's password or reactivate through database 
 
#DB=127.0.0.1
PGSQL='psql -d jira -U jira -W -h localhost'


reset () {
echo -e "Enter your username to be updated and press Enter:"
read username 
$PGSQL -c "update cwd_user set credential='uQieO/1CGMUIXXftw3ynrsaYLShI+GTcPS4LdUGWbIusFvHPfUzD7CZvms6yMMvA8I7FViHVEqr6Mj4pCLKAFQ==' where user_name='$username';" && echo "Password was updated"
}

activate () {
echo -e "Enter your username to be reacivated and press Enter:"
read username
$PGSQL -c "update cwd_user set active = '1' where user_name='$username';" && echo "User has been reactivated"
}

case "$1" in
        reset)       
		reset
                ;;
        activate)           
		activate
		;;
	*)
		echo "Options: reset|activate"
esac
