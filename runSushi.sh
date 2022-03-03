
sushi  -s -o .

if [[ $? -eq 0 ]]
then


echo "Create the mapping file for ActNowReview"
localscripts/makeLMMapping.js ActNowReview

echo "Add fullUrl to example bundles"
localscripts/addFullUrlToBundle.js

echo




else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

