cran <- read.csv("charlotteJan31.csv", header = TRUE, row.names = 3)
tmpa <- cran["QCWL17", "leaf_w"]
tmpb <- cran["QCWL17", "w_non_revoluted_leaf"]

cran["QCWL17", "leaf_w"] <- tmpb
cran["QCWL17", "w_non_revoluted_leaf"] <- tmpa

cran.dat <- cran
cran.dat <- cran.dat[!is.na(cran.dat$petal_l), ]
cran.dat <- cran.dat[!is.na(cran.dat$stamen_l), ]

cran.dat$tubules <- cran.dat$anther_l_tubules - cran.dat$anther_l_no_tubules

cran.dat$stamen_no_tubules <- cran.dat$stamen_l - cran.dat$tubules

cran.dat$anther_prop <- cran.dat$anther_l_no_tubules / cran.dat$stamen_no_tubules

cran.dat$leaf_shape <- cran.dat$leaf_l / cran.dat$leaf_w
cran.dat$petal_shape <- cran.dat$petal_l / cran.dat$petal_w
cran.dat$sepal_shape <- cran.dat$sepal_w / cran.dat$sepal_tip_l
cran.dat$fruit_shape <- cran.dat$fruit_l / cran.dat$fruit_w
cran.dat$fruit_sym <- cran.dat$dist_from_widest_fruit / cran.dat$fruit_l

cran.dat$seed_shape <- cran.dat$seed_l / cran.dat$seed_w

cran.dat$anther_tub <- cran.dat$anther_l_no_tubules/cran.dat$tubules
cran.dat$leaf_sym <- cran.dat$dist_to_widest_leaf / cran.dat$leaf_l
cran.dat$upper_ped <- cran.dat$pedicel_l - cran.dat$dist_to_lower_bract
cran.dat$ped_prop <- cran.dat$dist_to_lower_bract / cran.dat$pedicel_l

cran.dat$rev_prop <- (cran.dat$leaf_w - cran.dat$w_non_revoluted_leaf) / cran.dat$leaf_w

## vars = c("leaf_apex_angle", "dist_to_widest_leaf", "leaf_l", "leaf_w", "petal_l",
##   "petal_w", "stamen_l", "tubules", "anther_prop", "leaf_shape", "leaf_sym",
##   "rev_prop", "anther_l_no_tubules", "style_l", "bract_l", "stem_d", "shoot_l",
##   "pedicel_l")   

cran.labels <- cran.dat[,1:2]
ploidy <- as.character(cran.labels$Location)
ploidy[ploidy == "QCWM"] <- "2"
ploidy[ploidy == "ONMB"] <- "3"
ploidy[! ploidy %in% c("2", "3")] <- "1"
ploidy <- as.numeric(ploidy)

suds <- read.csv("suda_lysak.csv", header = TRUE)
colnames(suds)[1] <- "pop"
colnames(suds)[colnames(suds) == "X2"] <- "leaf_l"
colnames(suds)[colnames(suds) == "X3"] <- "leaf_w"
colnames(suds)[colnames(suds) == "X4"] <- "dist_to_widest_leaf"
colnames(suds)[colnames(suds) == "X5"] <- "w_non_revoluted_leaf"
colnames(suds)[colnames(suds) == "X6"] <- "petal_l"
colnames(suds)[colnames(suds) == "X7"] <- "petal_w"
colnames(suds)[colnames(suds) == "X8"] <- "sepal_tip_l"
colnames(suds)[colnames(suds) == "X9"] <- "sepal_w"
colnames(suds)[colnames(suds) == "X10"] <- "stamen_l"
colnames(suds)[colnames(suds) == "X12"] <- "tubules"
colnames(suds)[colnames(suds) == "X13"] <- "style_l"
colnames(suds)[colnames(suds) == "X16"] <- "bract_l"
colnames(suds)[colnames(suds) == "X17"] <- "dist_to_lower_bract"
colnames(suds)[colnames(suds) == "X18"] <- "upper_ped"
#colnames(suds)[colnames(suds) == "X20"] <- "fruit_l" ## missing from data
colnames(suds)[colnames(suds) == "X21"] <- "fruit_w"
#colnames(suds)[colnames(suds) == "X22"] <- "dist_from_widest_fruit" ## missing from data
#colnames(suds)[colnames(suds) == "X23"] <- "seed_l" ## missing from data
colnames(suds)[colnames(suds) == "X24"] <- "seed_w"
colnames(suds)[colnames(suds) == "X30"] <- "leaf_shape"
colnames(suds)[colnames(suds) == "X31"] <- "rev_prop"
colnames(suds)[colnames(suds) == "X32"] <- "leaf_sym"
colnames(suds)[colnames(suds) == "X33"] <- "petal_shape"
colnames(suds)[colnames(suds) == "X34"] <- "sepal_shape"
colnames(suds)[colnames(suds) == "X35"] <- "anther_l_no_tubules"
colnames(suds)[colnames(suds) == "X36"] <- "anther_l_tubules"
colnames(suds)[colnames(suds) == "X39"] <- "anther_tub"
colnames(suds)[colnames(suds) == "X40"] <- "pedicel_l"
colnames(suds)[colnames(suds) == "X41"] <- "ped_prop"
colnames(suds)[colnames(suds) == "X43"] <- "fruit_shape"

colnames(suds)[colnames(suds) == "X45"] <- "seed_shape"

#suds$fruit_sym <- suds$dist_from_widest_fruit / suds$fruit_l ## not available

suds$rev_prop <- suds$rev_prop/100
suds$leaf_sym <- suds$leaf_sym/100
suds$ped_prop <- suds$ped_prop/100

sudscols <- colnames(suds)
charcols <- colnames(cran.dat)
combocols <- intersect(sudscols, charcols)

combocols <- combocols[! combocols %in% c("sepal_tip_l", "sepal_w", "fruit_shape",
                                          "dist_to_lower_bract", "upper_ped", "ped_prop",
                                          "fruit_sym")]  

cran.combo <- cran.dat[,combocols]
suds.combo <- suds[,combocols]

suds.oxy <- subset(suds.combo, suds$pop != 1)
suds.oxy.code <- subset(suds$pop, suds$pop != 1)
