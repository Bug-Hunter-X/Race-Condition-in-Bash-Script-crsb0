# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a simple Bash script.  Two processes attempt to concurrently update a counter stored in a file.  Due to the lack of synchronization, the final counter value may not be the expected 2.  The solution demonstrates a proper approach using file locking to prevent this issue.

## How to Reproduce
1. Clone this repository.
2. Run the `bug.sh` script.
3. Observe that the final counter value is not always 2, due to the race condition.
4. Run the `bugSolution.sh` script to see the corrected version.