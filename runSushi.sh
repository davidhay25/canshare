
sushi  -s -o .

if [[ $? -eq 0 ]]
then


echo "Create the mapping file for ActNowReview"
localscripts/makeLMMapping.js ActNowReview

echo




else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

