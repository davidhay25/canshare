
sushi  -s -o .

if [[ $? -eq 0 ]]
then

# create the 2 summary files extensions.xml & profiles.xml. Saves in both /input.. & /fsh/ig-data...

# echo "Updating the global summary of extensions and terminology"
# ../globalScripts/makeGlobalIGSummary.js
echo


echo "Not doing anything else right now"

else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

