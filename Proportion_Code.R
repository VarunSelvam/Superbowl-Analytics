library(stringr)

tweets <- data.frame(text_column = c("This is a progressive movement",
                                     "We support progressive policies",
                                     "No mention of progressive ideas",
                                     "Marvel is a great company",
                                     "Marvel movies are popular"))

# List of keywords
keywords <- c("progressive", "policy", "movement", "marvel")  # Add all your keywords here

# Convert keywords to lowercase
keywords <- tolower(keywords)

# Convert text column to lowercase
tweets$text_column <- tolower(tweets$text_column)

# Function to calculate proportion of rows containing each keyword
calculate_row_proportion <- function(keyword) {
  keyword_count <- sum(str_detect(tweets$text_column, keyword))
  return(keyword_count / nrow(tweets))
}

# Calculate the row proportion for each keyword
row_proportions <- sapply(keywords, calculate_row_proportion)

# Convert proportions to dataframe
proportions_df <- data.frame(keyword = names(row_proportions),
                             row_proportion = row_proportions,
                             stringsAsFactors = FALSE)

# Print proportions dataframe
print(proportions_df)