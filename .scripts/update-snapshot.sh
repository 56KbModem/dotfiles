#!/bin/bash

create_root_snapshot(){
	TARGET=/snapshots/root_$(date "+%d-%m-%Y");
	read -r -p "[?] Do you wish to create a snapshot at $TARGET ? [y/N] " response
	if [[ "$response" == "y" || "$response" == "yes" ]]; then
		echo "[+] Creating root snapshot in $TARGET";
		sudo btrfs subvolume snapshot / $TARGET;
	else
		echo "[!] Operation cancelled.";
		exit;
	fi
}

delete_root_snapshot(){
	echo "[!] Checking for existing snapshots...";
	EXISTING=$(ls /snapshots/);
	if [ ! -z $EXISTING ]; then
		echo "[!] Existing snapshots: $EXISTING ";

		# Prompt for deletion of snapshot
		read -r -p "[?] Do you want to delete this snapshot? [y/N] " response
		response=${response,,}  # to lowercase
		if [[ "$response" == "y" || "$response" == "yes" ]]; then
    		echo "[-] Deleting snapshot: $EXISTING";
			sudo btrfs subvolume delete /snapshots/$EXISTING;
			exit;
		else
			echo "[!] Operation cancelled.";
			exit;
		fi
	else
		echo "[!] No snapshots currently, exiting";
		exit;
	fi
}

read -r -p "[!] (C)reate snapshot, (D)elete snapshot, (E)xit [c/d/E] " response
response=${response,,} # to lowercase
if [[ "$response" == "c" ]]; then
	create_root_snapshot;
elif [[ "$response" == "d" ]]; then
	delete_root_snapshot;
else
	echo "[!] Goodbye!";
	exit;
fi
