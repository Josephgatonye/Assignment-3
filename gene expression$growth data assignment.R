#GENE EXPRESSION 
#procedure required
#Downloading the file and saving it as "gene_expression.tsv"
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv",destfile = "gene_expression.tsv") 

#reading in the file
read.table("gene_expression.tsv") 

#saving the file as an object x")
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
list(x_ordered [1:10,])
is.list(x_ordered)

# Subseting the number of genes with a mean less than 10
no_genes <- subset(x, ColumnMeans <10)
nrow(no_genes) # provides the number of genes as 43124

# creating a histogram plot of the mean values
hist(x$ColumnMeans,main = "histogram of the mean values",xlab="mean values")

#saving histogram as png file

png("gene_expressionhist.png") #creating a PNG file on the system
hist(x$ColumnMeans) #adding chart
dev.off()# closing PNG(Not imported yet)

#GROWTH DATA

# Question 6 
# Importing the csv file into an R object
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv",destfile = "growth_data.csv")
# Reading csv file into R 
g<- read.csv("growth_data.csv")
head(g)
str(x)
# Finding the column names of 'g'
colnames(g)

# Question 7
ne <- subset(g,Site== "northeast") #subsetting site upto northeast and saving as ne
head(ne)#checking structure
str(ne)
mean(ne$Circumf_2004_cm)# getting the mean of circumfrence at the start
mean(ne$Circumf_2019_cm)# getting the mean of circumfrence at the end
sd(ne$Circumf_2004_cm) #getting standard deviation of  circumfrence at the start
sd(ne$Circumf_2019_cm)#getting standard deviation of  circumfrence at the end

sw <- subset(g,Site== "southwest")#subsetting site upto southwest and saving as sw
head(sw)
str(sw)
mean(sw$Circumf_2004_cm)# getting the mean of circumfrence at the start
mean(sw$Circumf_2019_cm)# getting the mean of circumfrence at the end
sd(sw$Circumf_2004_cm) #getting standard deviation of  circumfrence at the start
sd(sw$Circumf_2019_cm)#getting standard deviation of  circumfrence at the end

# Question 8
boxplot(ne$Circumf_2004_cm,ne$Circumf_2019_cm)# box plot of tree circumference at the start and end of the study at north west 
boxplot(sw$Circumf_2004_cm,sw$Circumf_2019_cm) # box plot of tree circumference at the start and end of the study at south east

#Question 9
growthdif1<- (ne$Circumf_2019_cm - ne$Circumf_2009_cm) #getting the growth difference over 10 years(2009$2019) @ North east
mean(growthdif1)# getting the mean of growth difference

growthdif2<- (sw$Circumf_2019_cm - sw$Circumf_2009_cm) #getting the growth difference over 10 years(2009$2019) @ south west
mean(growthdif2)# getting the mean of growth difference

# Question 10
# Ho: mean ne$Circumf_2019_cm = mean ne$Circumf_2009_cm 
# Ha:Two-sided test
# non-equal variances from boxplot
t.test(growthdif1,growthdif2)# There is a huge difference because of p-value < 1
wilcox.test(growthdif1,growthdif2)
Ranks differ 


