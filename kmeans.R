library(data.table)
Wine <- fread('https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data')
names(Wine) <- c("Type", "Alcohol", "Malic_Acid", "Ash", "Ash_Alcalinity", "Magnesium", "Total_Phenols", "Flavanoids", "Nonflavanoid phenols", "Proanthocyanins", "Color_intensity", "Hue", "Od_diluted_wines", "Proline")

# Remove the Type attribute
Wine.f = Wine
Wine.f$Type <- NULL
View(Wine.f)

# All columns are on different scales
# We need to normalize the attributes so they
# are easy to compare across columns
Wine.standard <- scale(Wine)
View(Wine.standard)
results <- kmeans(Wine.standard, 3)
results

# Set to a data frame
setDF(Wine)
plot(Wine[c("Alcohol", "Malic_Acid", "Ash")], col = results$cluster)
plot(Wine[c("Alcohol", "Malic_Acid", "Ash")], col = Wine$Type)
table(Wine$Type, results$cluster)