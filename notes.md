# POMODORO 1

✅

- ✅ add '--dev' to snky npm tests
- ✅ Commit
- ✅ Log into SonarCloud and link it to GutHub Account
- ✅ Create a organsiation called 'IBM Repositries' (name TBC)
- ✅ Create a travis project
- ✅ set up Snyk with Travis
- ✅ Test that the travis project works
- ✅ Commit
- Add SonaCloud to Travis

## scratch

// command to connect travis with github
travis login -I -t your-travis-token -e https://travis.ibm.com/api --github-token=personal-access-token-from-githubenterprise &&
travis endpoint --set-default -e https://travis.ibm.com/api

// to have travis encrypt snyk token
travis encrypt "SNYK_TOKEN=\*\*\*"

// etc
SNYK_TOKEN=\*\*\*\*
