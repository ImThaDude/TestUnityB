if [ -z "$1" ]; then
	echo "Comment needed for push compilation into module."
	exit 0
fi
echo "Creating module push with comment: $1"
git checkout module
git rebase master
git reset origin/module
git add .
git commit -m $1
git push origin module
git checkout master

git checkout plugins
git checkout master Assets/Plugins
git add .
git commit -m $1 
git push pluginsref plugins
git checkout master