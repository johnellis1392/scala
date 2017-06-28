#!/usr/bin/env bash

# Constants
CBT_PATH=$HOME/Projects/github/cbt;
TEST_DIR=test;
PROJECT_DIR=hello;


# Note: CBT recommends using these:
if [[ "$(uname -s)" == "Darwin" ]]; then
    # brew install nailgun;
    # brew install gpg;
    # brew install fswatch;
fi

# Generic startup for CBT project.
# First, make sure CBT is on path:
export PATH=$PATH:$CBT_PATH;

# Now make new project directory, and create main and build files
mkdir -p ./$PROJECT_DIR && cd ./$PROJECT_DIR;
cbt tools createMain;
cbt tools createBuild;

# Run project
cbt run;

# Run example task in build.scala
cbt exampleTask;

# Run and listen for file changes
cbt loop run;
# cbt loop clear run; # Clears screen on re-run
# cbt direct loop restart; # Restart main on each run

# Create a testing project
mkdir -p ./$TEST_DIR && cd ./$TEST_DIR;
cbt tools createMain;
cbt tools createBuild;
# Now add the project as a dependency, add tasks for testing,
# and this testing sub-project should be good to go
