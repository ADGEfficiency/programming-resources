# Working with data

## CSVs

Select second column from a csv

`cat myfile.txt | cut -f 2 -d ,`

`-f` fields (aka columns)
`-d` delimiter


## Unique values & counts

Get unique values (`uniq` will only consolidate entries right after each other to save memory)

`cat my_file.txt | cut -f 2 | sort | uniq -c`

Sort by counts

`cat my_file.txt | cut -f 2 | sort | uniq -c | sort -k1,1nr`

`-k1,1` sort using column 1
`-n` numerically
`-r` reverse

# [How to Clean Text Data at the Command Line | Ezz | Technical Content Writer for Software Companies](https://ezzeddinabdullah.com/post/how-to-clean-text-data-at-the-command-line/)
