# Select drinks

#### An exercise in working with bash scripts, parsing options, and calling functions

This allows you to select types of beverages

## Usage:
Example input:

```
./drink_selector.sh -c water,juice
```

Output: 

```
Drinks chosen:  water,orange juice,lemonade,coconut water
```

### Flags:

- choice: specify choice of drink.  
	- Options: [all, none] and a list made of [beer, wine, juice, water, soda].  
	- Default is all drinks.
- debug: debug
- format: choose format to display.  
	- Options: [hash, csv, array]
- usage: print usage
- dryrun: dry-run
