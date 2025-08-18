#!/bin/bash

create_root_snapshot(){
	TARGET=/snapshots/root_$(date "+%d-%m-%Y");
	read -r -p "[?] Do you wish to create a snapshot at $TARGET ? [y/N] " response
    response=${response,,}  # to lowercase
	if [[ "$response" == "y" || "$response" == "yes" ]]; then
		echo "[+] Creating root snapshot in $TARGET";
		sudo btrfs subvolume snapshot / $TARGET;
	else
		echo "[!] Operation cancelled.";
	fi
}

delete_root_snapshot() {
    local EXISTING=("$@")

    if [ ${#EXISTING[@]} -ne 0 ]; then
        PS3="[?] Which snapshot to delete? [q to cancel] "
        select option in "${EXISTING[@]}"; do
            case $option in
                'q' | '')
                    echo "[!] Operation cancelled."
                    break
                    ;;
                *)
                    read -r -p "[?] Do you wish to delete the snapshot at $option? [y/N] " response
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
        echo "[!] No snapshots currently."
    fi
}

# Main function:
echo "[!] --- Update Snapshots --- [!]"
echo "[!] Checking for existing snapshots...";
EXISTING=(/snapshots/*)

# Show snapshots as numbered list:
if [ ${#EXISTING[@]} -eq 0 ]; then
    echo "[!] No snapshots found."
else
    echo "[!] Existing snapshots:"
    i=1
    for snapshot in "${EXISTING[@]}"; do
        echo "$i) $snapshot"
        ((i++))
    done
fi

# User menu:
while true; do
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
done
