setwd("~/Documents/Clark Atlanta University/Introduction to Data Science")
refine_original <- read.csv("refine_original.csv")
refine_clean <- refine_original 
refine_clean$company[grepl("p", refine_clean$company, ignore.case = TRUE)] <- "phillips"
refine_clean$company[grepl("k", refine_clean$company, ignore.case = TRUE)] <- "akzo"
refine_clean$company[grepl("t", refine_clean$company, ignore.case = TRUE)] <- "van houten"
refine_clean$company[grepl("r", refine_clean$company, ignore.case = TRUE)] <- "unilever"
head(refine_clean)
refine_clean$product_code <- substr(refine_clean$Product.code...number, 1,1)
refine_clean$product_number <- substr(refine_clean$Product.code...number, 3,4)
head(refine_clean)

refine_clean$product_category <- ifelse(refine_clean$product_code == "p", "Smartphone", 
                                        ifelse(refine_clean$product_code == "v", "TV",
                                               ifelse(refine_clean$product_code == "x", "Laptop", "Tablet")))
head(refine_clean)

refine_clean$full_address <- paste(refine_clean$address, refine_clean$city, refine_clean$country, sep = ", ")
head(refine_clean)

refine_clean$company_phillips <- ifelse(refine_clean$company == "phillips", 1, 0)
refine_clean$company_akzo <- ifelse(refine_clean$company == "akzo", 1, 0)
refine_clean$company_van_houten <- ifelse(refine_clean$company == "van houten", 1, 0)
refine_clean$company_unilever <- ifelse(refine_clean$company == "unilever", 1, 0)

refine_clean$product_smartphone <- ifelse(refine_clean$product_category == "Smartphone", 1, 0)
refine_clean$product_tv <- ifelse(refine_clean$product_category == "TV", 1, 0)
refine_clean$product_laptop <- ifelse(refine_clean$product_category == "Laptop", 1, 0)
refine_clean$product_tablet <- ifelse(refine_clean$product_category == "Tablet", 1, 0)
head(refine_clean)
refine_clean
write.csv(refine_clean, file = "refine_clean.csv")
