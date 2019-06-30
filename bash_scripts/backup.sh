#!/bin/bash

# Todo: Make this uncompress, update, and recompress tars.

# Check if the backup directories exist
backupDir="/mnt/passport/backups"
if [ ! -d "$backupDir" ]; then
	(>&2 echo "Backup directory \"$backupDir\" does not exist")
	exit 1
fi

rootSnapshotDir="/mnt/snap-root"
if [ ! -d "$rootSnapshotDir" ]; then
	(>&2 echo "Root snapshot directory \"$rootSnapshotDir\" does not exist")
	exit 1
fi

homeSnapshotDir="/mnt/snap-home"
if [ ! -d "$homeSnapshotDir" ]; then
	(>&2 echo "Home snapshot directory \"$homeSnapshotDir\" does not exist")
	exit 1
fi

excludeFile=$backupDir/.tarexclude
# Create the excludeFile
cat > $excludeFile << EOF
# Not the tmp folder
*/tmp/*
# Not the cache folder in var
*/cache/*
# Not the cache folder in home
*/.cache/*
# Not efi
*/efi/*
# Not lost+found
lost+found
EOF
tarOptions="--exclude-from $excludeFile --xattrs -pvf"

backupFunction () {
	if [ ! -f "$1" ]; then
		tar -c $tarOptions $1.tar $2
	else
		tar -u $tarOptions $1.tar $2
	fi
}

# Backup root
mkdir -p $backupDir/root
echo "Backing up: Root"
backupFunction $backupDir/root/$HOSTNAME-root $rootSnapshotDir

# Backup home
mkdir -p $backupDir/home
for user in $(ls $homeSnapshotDir | grep --invert lost+found); do
	echo "Backing up user: $user"
	mkdir -p $backupDir/home/$user
	## Individual hidden files
	backupFunction $backupDir/home/$user/$HOSTNAME-hidden-files $(find $homeSnapshotDir/$user -maxdepth 1 -type f -name '.*')
	## Individual non-hidden files
	backupFunction $backupDir/home/$user/non-hidden-files $(find $homeSnapshotDir/$user -maxdepth 1 -type f -not -name '.*')
	## Hidden directories
	for hiddenDir in $(find $homeSnapshotDir/$user -maxdepth 1 -type d -name '.*'); do
		backupFunction $backupDir/home/$user/$HOSTNAME-$(basename $hiddenDir) $hiddenDir
	done
	## Non-hidden directories
	for nonHiddenDir in $(find $homeSnapshotDir/$user -maxdepth 1 -type d -not -name '.*' -not -path $homeSnapshotDir/$user); do
		backupFunction $backupDir/home/$user/$(basename $nonHiddenDir) $nonHiddenDir
	done
done
