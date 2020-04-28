#Downloading the file and saving it as "gene_expression.tsv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",destfile = "gene_expression.tsv") 

#reading in the file
read.table("gene_expression.tsv") 

#saving the file as an object x
x <- read.table("gene_expression.tsv") 

#cheking the data structure
head(x) 
str(x) 

#Reading into R making sure the 1st columns is set as the rownames, headers are recognized an only first 6 genes are shown
x <- read.table("gene_expression.tsv",header=TRUE,row.names= 1, stringsAsFactors = FALSE)

#cheking if the data has been imported properly
head(x)
str(x)

# Making a new column ("ColumnMeans") which is the mean of the other columns
x$ColumnMeans <- rowMeans(x)

# checking if the column has been added properly
head(x)
str(x)

# Listing the 10 genes with the highest mean expression
x_ordered <- x[order(-x$ColumnMeans),]
x_ordered [1:10,]
# Subseting the number of genes with a mean less than 10
no_genes <- subset(x, ColumnMeans <10)
nrow(no_genes) # provides the number of genes as 43124

# creating a histogram plot of the mean values
hist(x$ColumnMeans)
