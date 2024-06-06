#!/bin/sh
# Address Book


trap 'do_menu' 2

. ./addr_libs.sh

show_menu()
{
  # Called by do_menu
  
  echo
  echo
  echo
  echo
  echo "-- Address Book --"
  echo "1. List all Entry or Search Someone"
  echo "2. Add Entry"
  echo "3. Edit a person"
  echo "4. Remove a person"
  echo "q. Quit"
  echo -en "Enter an Option: "
}

do_menu()
{
  i=-1

  while [ "$i" != "q" ]; do
    show_menu
    read i
    i=`echo $i | tr '[A-Z]' '[a-z]'`
    case "$i" in 
	"1")
	list_items
	;;
	"2")
	add_item
	;;
	"3")
	edit_item
	;;
	"4")
	remove_item
	;;
	"q")
	# confirm before quitting!
	echo "Thank you ! Come back again "
	exit 0
	;;
	*)
	echo "Unrecognised input."
	;;
    esac
  done
}

##########################################################
############ Main script starts here #####################
##########################################################

if [ ! -f $BOOK ]; then
  echo "Creating $BOOK ..."
  touch $BOOK
fi

if [ ! -r $BOOK ]; then
  echo "Error: $BOOK not readable"
  exit 1
fi

if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  exit 2
fi

do_menu

