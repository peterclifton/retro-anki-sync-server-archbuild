#!/usr/bin/sh
# This script serves as a wrapper for retro-anki-sync-server


# Check to see if the script has been run as root, and if so exit
if [ "$USER" == "root" ]; then
	echo "This program should be run as a non-root user, exiting..."
	exit 1
fi



# Functions
# ---------

help () {
	echo    ":: retro-anki-sync-server"
	echo -e "   To launch the server:\t$ retro-anki-sync-sever"
	echo -e "   To see help info    :\t$ retro-anki-sync-server --help"
	exit 0
}

prep ()
{
        SESSION_DB_OWNER=$(stat -c '%U' ${HOME}/.retro-anki-sync-server/session.db)
        #echo $SESSION_DB_OWNER

        if [ "$SESSION_DB_OWNER" == "$USER" ]; then 
		#echo "session.db owner ${SESSION_DB_OWNER} is same as user (${USER})" 
		:
	else 
		echo "session.db owner ${SESSION_DB_OWNER} is NOT same as user (${USER})"
		echo "Changing ownership of ${HOME}/.retro-anki-sync-server/ to $USER"
	        sudo chown -R ${USER}:${USER} ${HOME}/.retro-anki-sync-server/
        fi
}

setpath ()
{
	cd "${HOME}/.retro-anki-sync-server/"
       
        #echo $PWD
        #echo "PYTHONPATH: ${PYTHONPATH}"
        
	PYTHONPATH="$PYTHONPATH:$PWD:$PWD/anki-bundled"
        export PYTHONPATH
}

adduser ()
{
	echo "Adding user: $1"
	prep
	setpath
	python ankisyncctl.py adduser $1

}


deluser ()
{

	echo "Deleting user: $1"
	prep
	setpath
	python ankisyncctl.py deluser $1

}

run_server ()
{ 
	setpath
        python ankisyncd/sync_app.py ankisyncd.conf
}

main ()
{
	prep
	run_server
}



# Main logic
# -----------

if   [ -z "$1" ]; then
	main
elif [ "$1" == "--help" ]; then
	help
elif [ "$1" == "--adduser" ]; then
	if [ -z "$2" ]; then
		echo "missing user name argument"
		echo "try something like 'testx1 --adduser some_user_name"
		echo "exiting ..."
		exit 1
	else 
		adduser $2
	fi

elif [ "$1" == "--deluser" ]; then
	deluser $2
else
	echo "Unrecognised command line argument, exiting..."
	exit 1
fi

