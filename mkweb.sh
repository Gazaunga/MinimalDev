# Create new web project folder and grab html5 boilerplate
website() {
mkdir $@
cd @1
git init
wget https://raw.githubusercontent.com/Gazaunga/website/master/index.html
git pull origin master
ls -a
$EDITOR index.html
}

website
