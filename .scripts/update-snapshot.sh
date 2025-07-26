#!/bin/bash

create_root_snapshot(){
	TARGET=/snapshots/root_$(date "+%d-%m-%Y");
	echo "[+] Creating root snapshot in $TARGET";
	sudo btrfs snapshot / $TARGET;
}

delete_root_snapshot(){
	echo "[!] Checking for existing snapshots...";
	EXISTING=$(ls /snapshots/);
	if [ ! -z $EXISTING ]; then
		echo "[!] Existing snapshots:";
		echo "$EXISTING";

		# Prompt for deletion of snapshot
		read -r -p "[?] Do you want to delete this snapshot? [y/N] " response
		response=${response,,}  # to lowercase
		if [[ "$response" == "y" || "$response" == "yes" ]]; then
    		echo "[!] Deleting snapshot: $EXISTING";
			exit;
		else
			echo "Operation cancelled.";
		fi
	else
		echo "[!] No snapshots currently, exiting"
	exit
	fi
}

delete_root_snapshot;
