##Question 1: The data in FISH.DAT comes from an experiment on judge's scores 
#on fish prepared by 3 methods. Twelve fish were cooked by each method and judges 
#rated each on 4 variables: aroma, flavor, texture and moisture


fish <- read.table("C:/Users/awong/Downloads/FISH.dat")
fish
names(fish) <- c("Prep", "Aroma", "Flv", "Text", "Moist")
fish

#Want to know if there is any sig differences in Aroma, Flv, Text, and Moist because of prep method
#Create MANOVA
res.man <- manova(cbind(Aroma, Flv, Text, Moist) ~ Prep, data = fish)
summary(res.man)
#Reject H0. Accept Ha that at least one of species Aroma, Fl, Text, Moist was different because of Prep

#Now need to check which response variable has different means
summary.aov(res.man)
#Only Flv differ because of prep method

#Now let's see which pair of prep methods have different Flv
pairwise.t.test(fish$Flv, fish$Prep)
#This tells me that prep method 1 and method 3 have different Flv, 
#prep method 1 and method 2 have different Flv, 
#and maybe method 2 and method 3 have diff Flv because its pvalue is close to .05
#It depends on what the alpha was set to. 
