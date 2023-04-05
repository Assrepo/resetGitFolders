#!/bin/bash

# Iterate over all folders in the current directory
for folder in */; do
    # Check if the folder contains a .git directory
    if [ -d "${folder}/.git" ]; then
        # Go into the folder
        echo "Processing ${folder}..."
        cd "${folder}" || continue

        # Run git reset --hard
        echo "Running git reset --hard"
        git reset --hard

        # Check if package.json exists
        if [ -f "package.json" ]; then
            # Delete package-lock.json if it exists
            if [ -f "package-lock.json" ]; then
                echo "Deleting package-lock.json"
                rm package-lock.json
            fi

            # Run npm install and npm run build
            echo "Running npm install and npm run build"
            npm install
            npm run build
        fi

        # Run composer install if composer.json exists
        if [ -f "composer.json" ]; then
            echo "Running composer install"
            composer install
        fi

        # Go back to the parent directory
        cd ..
    fi
done

echo "Done."

