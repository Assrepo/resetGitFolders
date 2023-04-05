# resetGitFolders
Itarates over every folder and check if it's a GIT respository.

 - First the script runs a `GIT reset --hard`
 - Check if there is a `package.json`
	 - If yes, delete the `package-log.json`
	 - run `npm install`and `npm run build`
- Check if there is a `composer.json`
	- run `composer install`
