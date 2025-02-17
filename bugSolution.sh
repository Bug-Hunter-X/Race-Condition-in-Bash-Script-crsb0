#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create a file and initialize a counter to 0.
touch counter.txt
echo 0 > counter.txt

# Function to increment the counter using flock for atomic operations.
increment_counter() {
  flock -n 200  counter.txt || exit 1
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
  echo $new_value > counter.txt
  flock -u 200 counter.txt
}

# Run the increment_counter function in two separate processes simultaneously.
increment_counter &
increment_counter &

# Wait for both processes to finish.
wait

# Print the final counter value.
echo "Final counter value: $(cat counter.txt)"