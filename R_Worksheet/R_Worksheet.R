###################LAB 1## PART I##########################################################
#Introduction to Rstudio

## PROBLEM 1 What's the difference between rstudio and R? ###
#Familiarize yourselves with the four panes in Rstudio. 
#Top left is where we write our scripts
#Bottom left is the console- where the code gets sent (this is the R platform) 
#and where our outputs appear. 
#Top right global environment where we can see all our variables
#Bottom right is a viewer pane where we see things like plots and function explanations
?read.csv()


#Commenting and running code

#click run or ctrl+enter [windows] OR command+enter [mac] to run a line or section of code
#Putting a "#" before a line will result in the code not running
#Shortcut is highlight line(s) of code and type ctrl+Shift+C [windows] 
#OR 
#Shortcut is highlight line(s) of code and type command+enter [mac]
#I recommend annotating every time you do something new, explaining what the code does. 
#I also recommend copying outputs of tests that appear in the console window and pasting them 
#in your R script so it is saved. 

#for example 
2+2+2
#[1] 6

#You can assign an output to a variable, for example
answer=2+2+2
## PROBLEM 2 what is the output if you run the following code?
answer

#Its not just numbers/equations, you can assign anything for a variable for example
name="James Fifer"
famous_names=c("Barrack Obama","Ali Wong", "James Fifer")
famous_names
famous_names2=c("Barrack Obama","Ali Wong", name)
famous_names2
#^Not I used an underscore here instead of a space in famous_names. In coding languages, spaces are your enemy
#and underscores are your friend. Try running the code above with a space instead of an underscore and see what happens. 

#PROBLEM 3: How are famous_names and famous_names2 different?
#answer here:

#Basic data types in R can be divided into the following types:
  
#numeric (10.5, 55, 787)
#integer (1L, 55L, 100L, where the letter "L" declares this as an integer)
#complex (9 + 3i, where "i" is the imaginary part)
#character/string ("k", "R is exciting", "FALSE", "11.5")
#logical/booleans (TRUE or FALSE)

#You can use the class() function to check the data type of a variable. 
## PROBLEM 4 what data type is the variable named "answer?" What data type is the variable named "famous_names"?

#If you restart R your global environment will clear, another way to clear your global environment is
#to use the broom icon above the global environment pane 

## PROBLEM 5 Go ahead and use the broom icon now and then try to run the same code you used for PROBLEM 4
## What happened? What do you need to do to be able to succesfully run the code from PROBLEM 4? 



#Reading in files, saving scripts and saving r objects

#Set your working directory. This is setting the directory where R will look for files & save files 
#You should always have your working directory at the top of script
#You can go to Session-->Set working directory--> Choose directory 
#to see your current working directory run the following:
getwd()


## PROBLEM 6 Set your working directory to your BI586 folder on your computer ##
setwd("~/your/path/here")



#installing and loading packages 
#use library(packagename) to load a package you've already downloaded 

install.packages("dplyr")
#NOTE if you restart R you will need to reload the package you want using library(packagename)
#You will NOT need to reinstall them using install.packages
library(dplyr)

#If you are sharing scripts it is important for people to know what version of the packages you used
#To see package versions use
sessionInfo()
#PROBLEM 7: paste session info here:


#Reading in files
#You can either go to import Dataset in the environment panel or you can use this function:
read.csv()
#For any function, stick a question mark before the function to get more information
#This info will pop up in the bottom right hand panel under the help tab
?read.csv
#Lets take a second and break down what this function can do. 
#TIP: With any function if you
#put your cursor within the "()" and hit TAB on your keyboard you will see a dropdown
#of the options for this function. One option is "file". 
read.csv(file = "Wasting_Data.csv")

#instead of just having the output sent to the console below, lets save our file as a variable in R

Data=read.csv(file = "Wasting_Data.csv",skip = 1)

##PROBLEM 8 Notice the code "skip=1" what happens if you remove this? 

#You can view this "Data" variable in your global environment by clicking on it or by running:
View(Data)

#R can store data in lots of different classes, to see what type of class we have simply do:
class(Data)

#We see that we have a dataframe. Thats important to know, some functions only work on dataframes
#Others might only work on another datatype (e.g. matrices, lists etc)
#if we just want to see the top of the dataframe
head(Data)

#Basic data manipulation (renaming, deleting, converting)
#I don't like the name of the column "Average.WD...." lets change it 
#Average WD is the 21st column
colnames(Data)[21] = "Average.WD"
head(Data)

#now you can see that we successfully changed the name of the column

##PROBLEM 9 Write code that will print the column name for column 3 and the rowname for row 4 

#Sometimes you will want to subset a dataframe to include only specific columns or only certain values 
#In our wasting data file we have a column called Transect. 
#We can view the values of this column by simpling clicking on the variable "Data" in our global environment OR
#we can have R print out all the values of this column 
Data$Transect
#If you don't want R to barf up all the values but you are interested in how many unique values there are for this column 
#you can look at this column's levels
levels(Data$Transect)

##PROBLEM 10 How many levels does the column "Transect" have?

#Lets say we want to create a dataframe that only has data for transect A, we can do this a few different ways
#one way is to use the filter function from the package dplyr
TransectA=filter(Data, Transect == "A")
head(TransectA)
nrow(TransectA)

#PROBLEM 11: How many rows are in your new dataframe TransectA?

##PROBLEM 12 Create a dataframe that consistes of only data from Transect A AND Transect B
##How many rows are in this new dataframe? (Show your code)

#Maybe we don't care about most of these columns and want to just work with the first three
InfoTransectA=TransectA[,1:3]
head(InfoTransectA)
##How do we save stuff that we can create in R?
#Even though you can save your script with a simple ctrl+S, this is just saving the instructions
#sometimes we want to save an output so we don't have to run through our whole code again to look at it. 
#One way of doing this is saving EVERYTHING in your global environment 
save.image(file="filename.RData")

#You have now saved your global environment, go ahead and click the broom icon above your global environment pane 
#to clear the global environment
#now to re-load your saved global environment
load(file="filename.RData")
#You can also save files as .csv or a space separated file
write.csv(InfoTransectA, file="InfoTranectA.csv") #csv
write.table(InfoTransectA, file="InfoTransectA.txt",sep=" ")# space separated file
write.table(InfoTransectA, file="InfoTransectA.tab", sep="\t")#tab separated file

######You can feel free to end the assignment here as we will spend a lot of time
##on data visualization in this course. 

##########BONUS Plotting!!!!!!##################
#Go through this plotting tutorial, entering the code into your own R environment
#http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html


#BONUS PROBLEM make a PDF of a barplot titled "Awesome_barplot.pdf" where all factors are of some shade of red. 
#No x axis label 

