if pidof ags
then
    pkill ags
else
    ags & disown
fi
