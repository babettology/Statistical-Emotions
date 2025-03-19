# Statistical Emotions

# Load necessary libraries
library(jsonlite)
library(tidyverse)
library(gridExtra)
library(stringr)
library(tidytext)
library(lubridate)
library(RColorBrewer)
library(ggplot2)
library(quanteda.textstats)
library(quanteda)
library(dplyr)
library(devtools)
library(glmnet)
library(wordcloud)
library(tm)
library(syuzhet)
library(corrplot)
library(purrr)
library(SnowballC)

# Load JSON files
channel <- fromJSON("/Users/alicezanni/Documents/Perso/Lyrics_channelORANGE.json")
blonde <- fromJSON("/Users/alicezanni/Documents/Perso/Lyrics_Blonde.json")
nostalgia <- fromJSON("/Users/alicezanni/Documents/Perso/Lyrics_nostalgiaULTRA..json")

# Extract tracks and create data frames
channel.sub <- as.data.frame(channel$tracks)$song %>%
  select(title, id, title_with_featured, instrumental, lyrics) %>%
  mutate(album = "channel ORANGE", released_year = 2012)

blonde.sub <- as.data.frame(blonde$tracks)$song %>%
  select(title, id, title_with_featured, instrumental, lyrics) %>%
  mutate(album = "Blonde", released_year = 2016)

nostalgia.sub <- as.data.frame(nostalgia$tracks)$song %>%
  select(title, id, title_with_featured, instrumental, lyrics) %>%
  mutate(album = "Nostalgia Ultra", released_year = 2011)

# Combine data frames
Frank_Ocean <- rbind(nostalgia.sub, blonde.sub, channel.sub)

# Create tidy version of the words from the lyrics
tidy_all <- Frank_Ocean %>%
  unnest_tokens(word, lyrics) %>%
  anti_join(stop_words) %>%
  filter(!word %in% c("chorus", "outro", "intro", "verse", "frank", "ocean", "lyrics")) %>%
  filter(!grepl("^\\d+$", word))

# Top words by frequency
word_count <- tidy_all %>%
  group_by(title) %>%
  summarise(num_words = n()) %>%
  arrange(desc(num_words))

wf_all <- tidy_all %>%
  count(word, sort = TRUE) %>%
  top_n(15) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot() +
  geom_col(aes(word, n), fill = "#edc948", alpha = 0.75) +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5), panel.grid.major = element_blank()) +
  xlab("") +
  ylab("Song Count") +
  ggtitle("Most Frequently Used Words in all the Albums") +
  coord_flip() +
  theme_minimal()

# Create tidy versions for each album
tidy_channel <- channel.sub %>%
  unnest_tokens(word, lyrics) %>%
  anti_join(stop_words) %>%
  filter(!word %in% c("chorus", "outro", "intro", "verse", "frank", "ocean", "lyrics")) %>%
  filter(!grepl("^\\d+$", word))

tidy_blonde <- blonde.sub %>%
  unnest_tokens(word, lyrics) %>%
  anti_join(stop_words) %>%
  filter(!word %in% c("chorus", "outro", "intro", "verse", "frank", "ocean", "lyrics")) %>%
  filter(!grepl("^\\d+$", word))

tidy_nostalgia <- nostalgia.sub %>%
  unnest_tokens(word, lyrics) %>%
  anti_join(stop_words) %>%
  filter(!word %in% c("chorus", "outro", "intro", "verse", "frank", "ocean", "lyrics")) %>%
  filter(!grepl("^\\d+$", word))

# Word frequency plots for each album
wf_channel <- tidy_channel %>%
  count(word, sort = TRUE) %>%
  top_n(15) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot() +
  geom_col(aes(word, n), fill = "orange", alpha = 0.75) +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5), panel.grid.major = element_blank()) +
  ggtitle("Channel Orange") +
  coord_flip() +
  theme_minimal()

wf_blonde <- tidy_blonde %>%
  count(word, sort = TRUE) %>%
  top_n(15) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot() +
  geom_col(aes(word, n), fill = "purple", alpha = 0.75) +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5), panel.grid.major = element_blank()) +
  ggtitle("Blond") +
  coord_flip() +
  theme_minimal()

wf_nostalgia <- tidy_nostalgia %>%
  count(word, sort = TRUE) %>%
  top_n(15) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot() +
  geom_col(aes(word, n), fill = "blue", alpha = 0.75) +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5), panel.grid.major = element_blank()) +
  ggtitle("Nostalgia Ultra") +
  coord_flip() +
  theme_minimal()

# Arrange plots
grid.arrange(wf_all)
grid.arrange(wf_blonde, wf_nostalgia, wf_channel, ncol = 2, top = "Word Frequencies in the Three Albums", left = "Words", bottom = "Song Count")

# Define a function to preprocess text and create a dfm
mydfm <- function(corpus) {
  dfm <- corpus %>%
    tokens(remove_numbers = TRUE, remove_punct = TRUE, include_docvars = TRUE) %>%
    tokens_remove(stopwords("en")) %>%
    tokens_remove(pattern = "\\bcontributors\\w*\\b", case_insensitive = FALSE) %>%
    tokens_remove(pattern = "\\b\\w*\\d\\w*\\b") %>%
    tokens_remove(c("chorus", "outro", "intro", "verse", "frank", "ocean", "lyrics", "pre-chorus", "cassettes")) %>%
    dfm(tolower = TRUE) %>%
    dfm_trim(min_docfreq = 2) %>%
    dfm_wordstem()
  return(dfm)
}

# Load and preprocess the entire corpus
allcorpus <- corpus(Frank_Ocean$lyrics, docvars = Frank_Ocean)
dfm_all <- mydfm(allcorpus)

# Load and preprocess each album corpus
blonde_corpus <- corpus(blonde.sub$lyrics, docvars = blonde.sub)
dfm_blonde <- mydfm(blonde_corpus)

channel_corpus <- corpus(channel.sub$lyrics, docvars = channel.sub)
dfm_channel <- mydfm(channel_corpus)

nostalgia_corpus <- corpus(nostalgia.sub$lyrics, docvars = nostalgia.sub)
dfm_nostalgia <- mydfm(nostalgia_corpus)

# Top 100 words
top_all <- topfeatures(dfm_all, 100)
top_blonde <- topfeatures(dfm_blonde, 100)
top_channel <- topfeatures(dfm_channel, 100)
top_nostalgia <- topfeatures(dfm_nostalgia, 100)

# Color palettes for word clouds
purple1 <- colorRampPalette(c("#D8BFD8", "#C71585", "#DA70D6", "#BA55D3"))(20)
purple2 <- colorRampPalette(c("#800080", "#8A2BE2", "#9400D3", "#4B0082"))(20)
orange1 <- colorRampPalette(c("#FFD700", "#FF8C00", "#FF6347"))(20)
orange2 <- colorRampPalette(c("#FF7F50", "#FF0000", "#800000"))(20)
blue1 <- colorRampPalette(c("#ADD8E6", "#87CEEB", "#4682B4"))(10)
blue2 <- colorRampPalette(c("#003366", "#00509E", "#0066CC"))(20)
allcolours <- colorRampPalette(c("#D8BFD8", "#C71585", "#DA70D6", "#BA55D3", "#800080", "#8A2BE2", "#9400D3", "#4B0082", "#FFD700", "#FF8C00", "#FF6347", "#FF7F50", "#FF0000", "#800000", "#ADD8E6", "#87CEEB", "#4682B4", "#003366", "#00509E", "#0066CC"))(30)

# Word clouds
cloud_all <- wordcloud(words = names(top_all), freq = top_all, scale = c(3, 0.5), min.freq = 2, max.words = 70, random.order = FALSE, colors = allcolours)
cloud_blonde <- wordcloud(words = names(top_blonde), freq = top_blonde, scale = c(3, 0.5), min.freq = 2, max.words = 70, random.order = FALSE, colors = purple1)
cloud_channel <- wordcloud(words = names(top_channel), freq = top_channel, scale = c(3, 0.5), min.freq = 2, max.words = 70, random.order = FALSE, colors = orange1)
cloud_nostalgia <- wordcloud(words = names(top_nostalgia), freq = top_nostalgia, scale = c(3, 0.5), min.freq = 1, max.words = 70, random.order = FALSE, colors = blue1)

# Weighted DFMs
dfm_blonde_weight <- dfm_weight(dfm_blonde, scheme = "prop")
dfm_channel_weight <- dfm_weight(dfm_channel, scheme = "prop")
dfm_nostalgia_weight <- dfm_weight(dfm_nostalgia, scheme = "prop")

# Weighted word clouds
w_top_blonde <- topfeatures(dfm_blonde_weight, 70)
w_top_channel <- topfeatures(dfm_channel_weight, 70)
w_top_nostalgia <- topfeatures(dfm_nostalgia_weight, 70)

w_cloud_blonde <- wordcloud(words = names(w_top_blonde), freq = w_top_blonde, scale = c(3, 0.5), max.words = 70, random.order = FALSE, colors = purple2)
w_cloud_channel <- wordcloud(words = names(w_top_channel), freq = w_top_channel, scale = c(3, 0.5), max.words = 70, random.order = FALSE, colors = orange2)
w_cloud_nostalgia <- wordcloud(words = names(w_top_nostalgia), freq = w_top_nostalgia, scale = c(3, 0.5), max.words = 70, random.order = FALSE, colors = blue2)

# Sentiment analysis
nrc_lexicon <- get_sentiments("nrc")
nrc_words <- nrc_lexicon %>%
  group_by(sentiment) %>%
  summarise(words = paste(word, collapse = ", "))

sentiment_vectors <- list()
for (i in 1:nrow(nrc_words)) {
  sentiment_string <- as.character(nrc_words[i, 2])
  sentiment_vectors[[i]] <- unlist(strsplit(sentiment_string, ", "))
}

anger_vector <- sentiment_vectors[[1]]
anticipation_vector <- sentiment_vectors[[2]]
disgust_vector <- sentiment_vectors[[3]]
fear_vector <- sentiment_vectors[[4]]
joy_vector <- sentiment_vectors[[5]]
negative_vector <- sentiment_vectors[[6]]
positive_vector <- sentiment_vectors[[7]]
sadness_vector <- sentiment_vectors[[8]]
surprise_vector <- sentiment_vectors[[9]]
trust_vector <- sentiment_vectors[[10]]

# Create lexicons for different themes
nostalgia_lexicon <- wordStem(c("nostalgia", "memories", "reminisce", "retro", "vintage", "flashback", "past", "childhood", "yesteryear", "recollection"))
life_lexicon <- wordStem(c("life", "living", "alive", "existence", "living", "survival", "being", "vitality", "animation", "liveliness"))
love_lexicon <- wordStem(c("love", "affection", "adoration", "passion", "devotion", "intimacy", "romance", "amour", "attachment", "tenderness", "baby", "girl"))
frustration_lexicon <- wordStem(c("frustration", "annoyance", "irritation", "anger", "disappointment", "exasperation", "impatience", "aggravation", "vexation", "displeasure", "shit"))
time_lexicon <- wordStem(c("time", "hour", "minute", "second", "day", "week", "month", "year", "past", "present", "future", "clock", "watch"))
night_lexicon <- wordStem(c("night", "midnight", "moon", "stars", "dark", "sleep", "dream", "bed", "rest", "asleep", "awake", "nighttime"))
anticipation_lexicon <- wordStem(anticipation_vector)
anger_lexicon <- wordStem(anger_vector)
disgust_lexicon <- wordStem(disgust_vector)
fear_lexicon <- wordStem(fear_vector)
joy_lexicon <- wordStem(joy_vector)
sadness_lexicon <- wordStem(sadness_vector)
surprise_lexicon <- wordStem(surprise_vector)
trust_lexicon <- wordStem(trust_vector)
positive_lexicon <- wordStem(positive_vector)
negative_lexicon <- wordStem(negative_vector)

# Combine lexicons into a single data frame
lexicons_df <- bind_rows(
  data.frame(term = nostalgia_lexicon, theme = "nostalgia"),
  data.frame(term = life_lexicon, theme = "life"),
  data.frame(term = love_lexicon, theme = "love"),
  data.frame(term = frustration_lexicon, theme = "frustration"),
  data.frame(term = time_lexicon, theme = "time"),
  data.frame(term = night_lexicon, theme = "night"),
  data.frame(term = anticipation_lexicon, theme = "anticipation"),
  data.frame(term = anger_lexicon, theme = "anger"),
  data.frame(term = disgust_lexicon, theme = "disgust"),
  data.frame(term = fear_lexicon, theme = "fear"),
  data.frame(term = joy_lexicon, theme = "joy"),
  data.frame(term = sadness_lexicon, theme = "sadness"),
  data.frame(term = surprise_lexicon, theme = "surprise"),
  data.frame(term = trust_lexicon, theme = "trust"),
  data.frame(term = positive_lexicon, theme = "positive"),
  data.frame(term = negative_lexicon, theme = "negative")
)

Frank_Ocean.sub <- Frank_Ocean[c("title", "album", "released_year")]

# Add sentiment scores to the data frame
sentiment_scores_all <- Frank_Ocean.sub %>%
  mutate(
    nostalgia_score = rowSums(dfm_select(dfm_all, pattern = nostalgia_lexicon)),
    life_score = rowSums(dfm_select(dfm_all, pattern = life_lexicon)),
    love_score = rowSums(dfm_select(dfm_all, pattern = love_lexicon)),
    frustration_score = rowSums(dfm_select(dfm_all, pattern = frustration_lexicon)),
    time_score = rowSums(dfm_select(dfm_all, pattern = time_lexicon)),
    night_score = rowSums(dfm_select(dfm_all, pattern = night_lexicon)),
    anticipation_score = rowSums(dfm_select(dfm_all, pattern = anticipation_lexicon)),
    anger_score = rowSums(dfm_select(dfm_all, pattern = anger_lexicon)),
    disgust_score = rowSums(dfm_select(dfm_all, pattern = disgust_lexicon)),
    fear_score = rowSums(dfm_select(dfm_all, pattern = fear_lexicon)),
    joy_score = rowSums(dfm_select(dfm_all, pattern = joy_lexicon)),
    sadness_score = rowSums(dfm_select(dfm_all, pattern = sadness_lexicon)),
    surprise_score = rowSums(dfm_select(dfm_all, pattern = surprise_lexicon)),
    trust_score = rowSums(dfm_select(dfm_all, pattern = trust_lexicon)),
    positive_score = rowSums(dfm_select(dfm_all, pattern = positive_lexicon)),
    negative_score = rowSums(dfm_select(dfm_all, pattern = negative_lexicon))
  )

# Descriptive statistics
mean_scores <- colMeans(sentiment_scores_all[, -c(1:3)])
median_scores <- sapply(sentiment_scores_all[, -c(1:3)], median)
sd_scores <- sapply(sentiment_scores_all[, -c(1:3)], sd)
summary_df <- data.frame(Mean = mean_scores, Median = median_scores, SD = sd_scores)
print(as.data.frame(summary_df))

# ANOVA test
anova_results <- lapply(
  sentiment_scores_all[, -c(1:3)],
  function(score_column) {
    aov_result <- aov(score_column ~ album, data = sentiment_scores_all)
    return(summary(aov_result))
  }
)

# Correlation matrix
numeric_columns <- sentiment_scores_all[, -c(1:3)]
correlation_matrix <- cor(numeric_columns)
corrplot(correlation_matrix, method = "color", type = "lower", order = "hclust", tl.col = "blue")

# Sentiment trends over albums
albums <- c("Nostalgia Ultra", "channel ORANGE", "Blonde")
sum_sentiment <- function(album_name) {
  sentiment_scores_all %>%
    filter(album == album_name) %>%
    summarise(
      "nostalgia" = sum(nostalgia_score),
      "life" = sum(life_score),
      "love" = sum(love_score),
      "frustration" = sum(frustration_score),
      "time" = sum(time_score),
      "night" = sum(night_score),
      "anticipation" = sum(anticipation_score),
      "anger" = sum(anger_score),
      "disgust" = sum(disgust_score),
      "fear" = sum(fear_score),
      "joy" = sum(joy_score),
      "sadness" = sum(sadness_score),
      "surprise" = sum(surprise_score),
      "trust" = sum(trust_score),
      "positive" = sum(positive_score),
      "negative" = sum(negative_score)
    )
}

album_dfs <- map(albums, ~sum_sentiment(.))
combined_df <- bind_rows(album_dfs, .id = "album")
melted_df <- combined_df %>%
  gather(key = "Sentiment_Type", value = "Sentiment_Score", -album)

ggplot(melted_df, aes(x = album, y = Sentiment_Score, fill = Sentiment_Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Sentiment Trends Over Albums", x = "Album", y = "Sentiment Score") +
  theme_minimal() +
  facet_wrap(~Sentiment_Type, scales = "free_y", ncol = 3)
