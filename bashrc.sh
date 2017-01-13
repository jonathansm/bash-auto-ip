
command_not_found_handle()
{
	if valid_ip $1; then 
	   PS3='Please enter your choice: '
options=("ssh" "ping" "telnet" "host" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "ssh")
            ssh $1
            break
            ;;
        "ping")
            ping $1
            break
            ;;
        "telnet")
            telnet $1
            break
            ;;
        "host")
            host $1
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
	else 
	 echo "$0: $1: command not found" 
	fi

       
}

# Thanks http://www.linuxjournal.com/content/validating-ip-address-bash-script 
function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}
