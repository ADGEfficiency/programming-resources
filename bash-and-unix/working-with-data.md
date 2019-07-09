## Working with data

Select second column from a csv

`cat myfile.txt | cut -f 2 -d ,`

`-f` fields (aka columns)
`-d` delimiter

Get unique values (`uniq` will only consolidate entries right after each other to save memory)

`cat my_file.txt | cut -f 2 | sort | uniq -c`

Sort by counts

`cat my_file.txt | cut -f 2 | sort | uniq -c | sort -k1,1nr`

`-k1,1` sort using column 1
`-n` numerically
`-r` reverse

