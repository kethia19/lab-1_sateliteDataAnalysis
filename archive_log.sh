#!/bin/bash
# Log file name
LOG_FILE="heart_rate_log.txt"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file '$LOG_FILE' not found."
  exit 1
fi

# Create timestamp in YYYYMMDD_HHMMSS format
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create the archive file name
ARCHIVED_LOG_FILE="${LOG_FILE}_${TIMESTAMP}"

# Rename the log file to the archive file name
mv "$LOG_FILE" "$ARCHIVED_LOG_FILE"

# Check if the renaming was successful
if [ $? -eq 0 ]; then
  echo "Log file '$LOG_FILE' archived to '$ARCHIVED_LOG_FILE'."
else
  echo "Error: Failed to archive log file '$LOG_FILE'."
  exit 1
fi

# OPTIONAL: Move the archived log file to a directory (Task 3 prep)
# Replace with my actual group number
MY_GROUP_NUMBER="GROUP_3"
ARCHIVED_LOGS_DIR="archived_logs_group${GROUP_3}"

# Create the directory if it doesn't exist
mkdir -p "$ARCHIVED_LOGS_DIR"

# Move the archived log file
mv "$ARCHIVED_LOG_FILE" "$ARCHIVED_LOGS_DIR/"

if [ $? -eq 0 ]; then
  echo "Archived log moved to $ARCHIVED_LOGS_DIR"
else
  echo "Error: Failed to move archived log file"
  exit 1
fi

exit 0
