if [ -z "$1" ]; then
	echo "Expected input ./pm [VersionPushWord]"
	exit 0
fi
echo "Creating module push with comment: $comment"
git checkout module
git rebase master
mv Assets/* ./
git reset origin/module
git add .
git commit -m $comment
git push origin module
git checkout master
git add .
git reset --hard

#Plugins tries to put everything in the lower level to easily merge plugins.
git checkout plugins
git checkout master Assets/Plugins
mv Assets/Plugins/* ./
git add .
git commit -m $comment
git push pluginsref plugins
git checkout master
git add .
git reset --hard