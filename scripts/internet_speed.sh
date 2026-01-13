#!/bin/bash

# This script checks the internet speed and saves the results to a CSV file.

# Check if speedtest-cli is installed. If not, it provides installation instructions.
if ! command -v speedtest-cli &> /dev/null
then
    echo "speedtest-cli could not be found. Please install it to use this script."
    echo "On Debian/Ubuntu: sudo apt install speedtest-cli"
    echo "On CentOS/Fedora: sudo yum install speedtest-cli"
    echo "On Arch: sudo pacman -S speedtest-cli"
    echo "Using pip: pip install speedtest-cli"
    exit 1
fi

# Define the name of the CSV file where the results will be stored.
CSV_FILE="/home/hiti/Documents/speed_test_results.csv"

# If the CSV file does not exist, create it and add a header row.
if [ ! -f "$CSV_FILE" ]; then
    echo "date,time,download_mbps,upload_mbps" > "$CSV_FILE"
fi

# Inform the user that the speed test is starting.
echo "Running internet speed test..."

# Execute speedtest-cli with the --csv option to get the results in a parsable format.
speedtest_output=$(speedtest-cli --secure --json)

# Extract the download and upload speeds from the CSV output using awk.
# The download speed is the 7th field and upload speed is the 8th field.
download_speed_bits=$(echo "$speedtest_output" | jq -r '.download')
upload_speed_bits=$(echo "$speedtest_output" | jq -r '.upload')

# Convert the speeds from bits per second to megabits per second (Mbps) for readability.
# The 'bc' command is used for floating-point arithmetic.
download_speed_mbps=$(echo "scale=2; $download_speed_bits / 1000000" | bc)
upload_speed_mbps=$(echo "scale=2; $upload_speed_bits / 1000000" | bc)

# Get the current date and time in a standard format.
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

# Append the collected data as a new row to the CSV file.
echo "$current_date,$current_time,$download_speed_mbps,$upload_speed_mbps" >> "$CSV_FILE"

# Notify the user that the results have been successfully saved.
echo "Speed test results have been saved to $CSV_FILE"
