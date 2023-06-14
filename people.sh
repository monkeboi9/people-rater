#!/bin/bash
ass_v=0.22
perso_v=0.35
face_v=0.25
tits_v=0.18

clear
echo Welcome to bitch rater!
read -p "insert name of bitch: " bitch
clear


echo "${bitch}'s ass out of 10?"
read -p "> " ass
if [ $ass -gt "10" ]
then
echo "number too high"
exit

elif [[ $ass =~ [^0-9] ]]
then
	echo "not a number"
	exit

fi
ass_w=`echo "$ass * $ass_v" | bc`

clear
echo "${bitch}'s personality out of 10?"
read -p "> " perso
if [ $perso -gt "10" ]
then
echo "number too high"
exit

elif [[ $perso =~ [^0-9] ]]
then
        echo "not a number"
        exit

fi
perso_w=`echo "$perso * $perso_v" | bc`

clear
echo "${bitch}'s tits out of 10?"
read -p "> " tits
if [ $tits -gt "10" ]
then
echo "number too high"
exit

elif [[ $tits =~ [^0-9] ]]
then
        echo "not a number"
        exit

fi
tits_w=`echo "$tits * $tits_v" | bc`

clear
echo "${bitch}'s face out of 10?"
read -p "> " face
if [ $face -gt "10" ]
then
echo "number too high"
exit

elif [[ $face =~ [^0-9] ]]
then
        echo "not a number"
        exit

fi
face_w=`echo "$face * $face_v" | bc`

clear
w_added=`echo "$face_w + $tits_w + $ass_w + $perso_w" | bc`
echo "${bitch} is a ${w_added} out of 10"
read -p "log this output in people.txt? [y/n]: " log

if [ $log == y ]
then
	if [[ ! -e people.txt ]]; then
    touch people.txt
        fi

echo "${bitch} is a ${w_added} out of 10" >> people.txt

sorted_file=`sort -n people.txt`
echo  "${sorted_file}" > people.txt

echo "current ranking:"
cat people.txt

else
	echo bye!
fi
