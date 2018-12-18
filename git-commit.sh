git add .
echo "Enter comment for commit"
read comment
git commit -m "$comment"
git push origin master

