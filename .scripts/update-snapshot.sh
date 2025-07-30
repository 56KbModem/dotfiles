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

delete_root_snapshot() {
    local EXISTING=("$@")

    if [ ${#EXISTING[@]} -ne 0 ]; then
        PS3="[?] Which snapshot to delete? [q to cancel]: "
        select option in "${EXISTING[@]}"; do
            case $option in
                'q' | '')
                    echo "[!] Operation cancelled."
                    break
                    ;;
                *)
                    read -r -p "[?] Do you want to delete this snapshot? [y/N] " response
                    response=${response,,}  # to lowercase
                    if [[ "$response" == "y" || "$response" == "yes" ]]; then
                        echo "[-] Deleting snapshot: $option"
                        sudo btrfs subvolume delete "$option"
                        break
                    else
                        echo "[!] Operation cancelled."
                        break
                    fi
                    ;;
            esac
        done
    else
        echo "[!] No snapshots currently, exiting"
        exit
    fi
}

# Main function:
echo "[!] --- Update Snapshots --- [!]"
echo "[!] Checking for existing snapshots...";
EXISTING=(/snapshots/*);
echo "[!] Existing snapshots: $EXISTING ";

# User menu:
read -r -p "[?] (C)reate snapshot, (D)elete snapshot, (E)xit [c/d/E] " response
response=${response,,} # to lowercase
if [[ "$response" == "c" ]]; then
	create_root_snapshot;
elif [[ "$response" == "d" ]]; then
    delete_root_snapshot "${EXISTING[@]}"
else
	echo "[!] Goodbye!";
	exit;
fi
