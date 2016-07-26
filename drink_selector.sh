#! /usr/bin/env bash

function display_collection_of() {
  drinks=$1
  drink_list=''

  for drink in $(echo $drinks | sed 's/,/ /g'); do
    case $drink in
      'beer' ) drink_list+='Stella,Blue Moon,Guinness,' ;;
      'wine' ) drink_list+='Cabernet,Merlot,White Zin,' ;;
      'juice' ) drink_list+='orange juice,lemonade,coconut water,' ;;
      'water' ) drink_list+='water,' ;;
      'soda' ) drink_list+='coke,pepsi,Mr. Pibb,' ;;
    esac
  done

  echo 'Drinks chosen: ' $drink_list
  if [[ -z $drink_list ]] ; then
    echo "none!  I guess you're not thirsty."
  fi
}

function select_drink() {
  drink_choice=$(echo $1 | sed 's/ //g')

  case $drink_choice in
    "all" ) drinks="beer,wine,juice,water,soda" ;;
    "none" ) drinks="" ;;
    * ) drinks=$drink_choice ;;
  esac

  display_collection_of $drinks
}

function usage() {
  echo 'This allows you to select types of beverages'
  echo 'Flags:'
  echo '  c | choice         specify choice of drink.  Options: [all, none] and a list made of [beer, wine, juice, water, soda].  Default is all drinks.'
  echo '  d | debug          debug'
  echo '  f | format         choose format to display.  Options: [hash, csv, array]'
  echo '  h | help | usage   print usage'
  echo '  n | dryrun         dry-run'
}

while getopts :c:hdfn opt; do
  case $opt in
    c ) drink_choice=$OPTARG ;;
    d ) echo 'debug is a wip' ; exit 0 ; ;;
    f ) echo 'format is a wip' ; exit 0 ; ;;
    h ) usage ; exit 0; ;;
    n ) echo 'dry-run is a wip' ; exit 0 ; ;;
    * ) "Invalid option: ${OPTARG}." ; exit 2 ; ;;
  esac
done

select_drink ${drink_choice:-'all'}
