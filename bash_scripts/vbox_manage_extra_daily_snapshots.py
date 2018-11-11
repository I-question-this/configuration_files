#!/usr/bin/env python3

# Author -- Tyler Westland

########################################################################
# Begin -- Imports
########################################################################
import argparse
import subprocess
import sys
########################################################################
# End -- Imports
########################################################################

########################################################################
# Begin -- Main Program
########################################################################
def main():
    # Begin -- Arguments
    # Set up the parser
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("vm_name", help="The name of the vm to collect information about")
    parser.add_argument("--number_of_dailies_allowed", type=int,
     default=7, help="The default is %(default)s")
    
    # Parse the arguments
    args = parser.parse_args()
    # End -- Arguments
    
    # Begin -- Collect information for VBoxManage
    p = subprocess.run(["VBoxManage", "snapshot", args.vm_name, "list",
     "--machinereadable"], stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    # End -- Collect information for VBoxManage

    # Begin -- Check for errors
    if p.returncode != 0:
        print("VBoxManage failed with return code: " + str(p.returncode) + "\n", file=sys.stderr)
        print("VBoxManage had the following error information:\n" + str(p.stderr), file=sys.stderr)
    # End -- Chexk for errors

    # Begin -- Parse Information
    daily_snapshots = list()
    snapshot_information = p.stdout.decode().splitlines()
    date = None
    for line in snapshot_information:
        if date is None:
            if "DailySnapShot" in line and "CurrentSnapshotName=" not in line:
                date = line.split("--")[1].split()[0].split('"')[0]
        else:
            uuid = line.split("=")[1].split('"')[1]
            daily_snapshots.append((date, uuid))
            date = None
    # End -- Parse Information
    
    # Begin -- Print extra snapshot uuids
    if len(daily_snapshots) > args.number_of_dailies_allowed:
        num_extra = len(daily_snapshots) - args.number_of_dailies_allowed
        for date, uuid in daily_snapshots[:num_extra]:
            print(uuid)
    # End -- Print extra snapshot uuids)

    # Begin -- Return exitcode
    return 0
    # End -- Return exitcode
########################################################################
# End -- Main Program
########################################################################

if __name__ == '__main__':
    main()
