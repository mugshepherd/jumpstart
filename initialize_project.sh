#!/bin/bash

REPO_NAME="$1"
TEMPLATE_REPO="JulianOstmo/node-starter"
SONARCLOUD_TOKEN="$2"

# Check input parameters
function checkInputParameters() {
    while [ -z "$REPO_NAME" ]; do
        if [ -z "$REPO_NAME" ]; then
            echo "Please enter a name for the new repository:"
            read REPO_NAME
        fi
        if [ -z "$REPO_NAME" ]; then
            echo "ERROR: Repository name cannot be blank"
        fi
    done
}

# Check system requirements
function checkSystemRequirements() {
    # Must be run on a mac
    if [[ $(uname) != "Darwin" ]]; then
        echo "ERROR: Currently only mac is supported by this script"
        exit 1
    fi

    # Ensure curl is installed
    if ! [ -x "$(command -v curl)" ]; then
        echo "ERROR: curl is required to run this script. Please install it and run again"
        exit 1
    fi

    # Check for Homebrew and install if it is missing
    if ! [ -x "$(command -v brew)" ]; then
        echo "WARN: Homebrew not installed and it is required by this script."
        echo "Install Homebrew now? [Y/n]"
        read installHomebrewResponse

        if [ "$installHomebrewResponse" != "n" ]; then
            echo "INFO: Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            echo " ERROR: Homebrew install failed. Unable to proceed."
            exit 1
        fi

    fi
}

# Use Github CLI to clone template repo
function cloneGithubTemplate() {
    set +e
    if ! [ -x "$(command -v gh)" ]; then
        echo "WARN: Github CLI not found. Installing now..."
        brew install gh
    fi

    gh repo create $REPO_NAME --public --confirm --template="$TEMPLATE_REPO"
}

# Check for NVM and install if it is missing
function checkForNVM() {
    if ! [ -f "$NVM_DIR/nvm.sh" ]; then
        echo "WARN: NVM not detected. Installing now..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    fi
}

# Change directory (cd) into local project folder
function initializeLocalProject() {
    cd $REPO_NAME
    git fetch
    git checkout main
    nvm install
    npm i
}

# run tests
function runTests() {
    npm test
}

# Setup Sonarcloud
function setupSonarCloud() {
    echo "Setting up project in SonarCloud..."
    if [ -z "$SONARCLOUD_TOKEN" ]; then
        echo "Please enter your SonarCloud token:"
        read SONARCLOUD_TOKEN
    fi

    SONAR_PROJECT=JulianOstmo_XPFarm_OrangeBelt
    GIT_ORGANIZATION=julianostmo

    curl --include \
        --request POST \
        -u $SONARCLOUD_TOKEN: \
        'https://sonarcloud.io/api/projects/create?project=OurGithubOrg_repo-name-in-github&organization=some-org&name=some-project'

}

# Setup Github Actions (?)

# delete initialize_project.sh from project

# do initial commit to git

# project ready

# ******* Start of script *******

checkSystemRequirements
checkInputParameters
cloneGithubTemplate
checkForNVM
initializeLocalProject
runTests
