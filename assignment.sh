#!/bin/bash

#

create()
{
	echo "Enter address book Name "
	read bName
	#check address book is available or not in current working Directory

	res=`ls | grep $bName |wc -w`

	if [ $res -gt 0 ]
	then
		echo "Error: File is already Existing!"
	else
		touch $bName
		echo "Address Book Created!"
	fi
}

display()
{
        echo "Enter address book Name "
        read bName
        #check address book is available or not in current working Directory

        res=`ls | grep $bName | wc -w`

        if [ $res -gt 0 ]
        then
                cat $bName
        else
                echo "Error: File does not not Exist!"
                
        fi
}


insert()
{
        echo "Enter address book Name "
        read bName
        #check address book is available or not in current working Directory

        res=`ls | grep $bName | wc -w`

        if [ $res -gt 0 ]
        then
                echo "Enter email"
		read email

		#check Email is present in address book or not

		len=`cat $bName | grep $email | wc -w`
		if [ $len -gt 0 ]
		then
			echo "Error: Email already Existing!"
		else
			echo "Enter First Name, Last Name,  Mobile Number"
			read fname lname mobile
		
			record=`echo $fname $lname $email $mobile`
	       	       echo $record >> $bName	
		       echo Record inserted
		fi
        else
                echo "Error: File does not not Exist!"

        fi
}


delete()
{
        echo "Enter address book Name "
        read bName
        #check address book is available or not in current woking Directory
	res=`ls | grep $bName | wc -w`

        if [ $res -gt 0 ]
        then
                echo "Enter email"
                read email

                #check Email is present in address book or not

                len=`cat $bName | grep $email | wc -w`
                if [ $len -gt 0 ]
                then
		
			old=`cat $bName | grep $email`
		

			sed -i s/"$old"//g $bName
			 sed -i /^S/d $bName

			echo "Record Deleted"
                       
                else
                       echo "Error: Email not Existing!"
                fi
        else
                echo "Error: File does not not Exist!"

        fi      
}


modify()
{
        echo "Enter address book Name "
        read bName
        #check address book is available or not in current woking Directory
        res=`ls | grep $bName | wc -w`

        if [ $res -gt 0 ]
        then
                echo "Enter email"
                read email

                #check Email is present in address book or not

                len=`cat $bName | grep $email | wc -w`
                if [ $len -gt 0 ]
                then
                        echo "Enter modified firstName, LastName, Mobile Number"
                        read fname lname mobile
                        new=`echo $fname $lname $email $mobile`
                        old=`cat $bName | grep $email`

                        echo "Old Record: $old"
                        echo "New record: $new"

                        sed -i s/"$old"/"$new"/g $bName
                        
			echo "Record Modified"

                else
                       echo "Error: Email not Existing!"
                fi
        else
                echo "Error: File does not not Exist!"

        fi
}



while [ true ]
do

	echo "**********Menu***************"
	echo "1. Create"
	echo "2. Display"
	echo "3. Insert Record"
	echo "4. Modify Record"
	echo "5. Delete Record"
	echo "7. Exit"

	echo "Enter Choice"
	read choice

	case $choice in
		1) create ;;
		2) display ;;
		3) insert ;;
		4) modify ;;
		5) delete ;;
		6) exit ;;

		*) echo "wrong Choices!" ;;
	esac
done


