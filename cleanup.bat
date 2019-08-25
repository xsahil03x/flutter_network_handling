echo "Started Cleaning"
for /r %F in (*) do if %~zF==0 del "%F"
for /r %F in (*.summary) do del "%F"
echo "Finished Cleaning"