#!/bin/bash

create_root_snapshot(){
    TARGET=/snapshots/root_$(date "+%Y-%m-%d")
	read -r -p "[?] Do you wish to create a snapshot at $TARGET ? [y/N] " response
    response=${response,,}  # to lowercase
	if [[ "$response" == "y" || "$response" == "yes" ]]; then
		echo "[+] Creating root snapshot in $TARGET";
		sudo btrfs subvolume snapshot -r / "$TARGET";
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

echo "[!] --- Update Snapshots --- [!]"

# Function to refresh snapshot array
refresh_snapshots() {
    EXISTING=(/snapshots/*)
    # Handle empty directory
    if [ "${EXISTING[0]}" = "/snapshots/*" ]; then
        EXISTING=()
    fi
}

# Initial snapshot check
refresh_snapshots
if [ ${#EXISTING[@]} -eq 0 ]; then
    echo "[!] No snapshots found."
else
    echo "[!] Existing snapshots:"
    for idx in "${!EXISTING[@]}"; do
        echo "$((idx + 1))) $(basename "${EXISTING[$idx]}")"
    done
fi

# User menu loop
while true; do
    refresh_snapshots  # Always refresh before showing menu

    read -r -p "[?] (C)reate snapshot, (D)elete snapshot, (E)xit [c/d/e] " response
    response=${response,,} # lowercase

    case "$response" in
        c)
            create_root_snapshot
            ;;
        d)
            if [ ${#EXISTING[@]} -eq 0 ]; then
                echo "[!] No snapshots to delete."
            else
                delete_root_snapshot "${EXISTING[@]}"
            fi
            ;;
        e)
            read -r -p "[?] Are you sure you want to exit? [y/N] " confirm
            confirm=${confirm,,}
            if [[ "$confirm" == "y" || "$confirm" == "yes" ]]; then
                echo "[!] Goodbye!"
                exit 0
            else
                continue
            fi
            ;;
        *)
            echo "[!] Invalid choice. Please enter C, D, or E."
            ;;
    esac
done
