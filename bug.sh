#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file and initialize a counter to 0.
touch counter.txt
echo 0 > counter.txt

# Function to increment the counter.
increment_counter() {
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
  echo $new_value > counter.txt
}

# Run the increment_counter function in two separate processes simultaneously.
increment_counter &
increment_counter &

# Wait for both processes to finish.
wait

# Print the final counter value.
echo "Final counter value: $(cat counter.txt)"