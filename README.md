# Statistical-Emotions

![images](https://github.com/user-attachments/assets/9617e266-7a12-4a1b-aa5a-131a77b62f34)

**Sentiment Analysis on Frank Ocean Albums' Lyrics**

**Project Title:** Frank Ocean’s Lyrics Sentiment Analysis

**Author:** Alice Zanni

**Date:** 2023-12-12

---

## Summary

This project conducts a sentiment analysis on the lyrics of Frank Ocean's officially released albums: "Channel Orange," "Blonde," and "Nostalgia Ultra." The aim is to discern patterns and evolutions in the sentiments expressed across these albums, offering a unique perspective on the artist’s creative evolution.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Data Collection and Genius API](#data-collection-using-the-genius-api)
3. [Data processing](#data-processing)
4. [Text Analysis and Word Frequency](#text-analysis-and-word-frequency)
5. [Document-Feature Matrix (DFM) and Word Clouds](#document-feature-matrix-dfm-and-word-clouds)
6. [Sentiment Analysis and Visualization](#sentiment-analysis-and-visualization)
7. [Conclusion](#conclusion)

---

## Introduction

The aim of this project is to conduct a sentiment analysis on Frank Ocean’s lyrics, and to try to discern patterns and evolution based on various criteria.
According to the Genius website, the artist has over 60 singles and unrealised pieces, however this report will focus on the three officially released albums: “Channel Orange,” “Blonde,” and “Nostalgia Ultra.”
This project offers an exploration of data of lyrics and musical compositions, providing a diffrent perspective on the artist’s songs using various text mining and statistical methods .

---

## Data Collection using the Genius API

To collect all the lyrics from the artist’s albums, we will use the “Genius API”, which serves as the connection between my program and the online music encyclopedia “Genius”.
To gather the lyrics, I used my API Client page and accessed my client token. Using Python we then obtain Jason files for each album.

These files are imported into R and organised into data frames for each album, including relevant song information.

---

## Data processing

Data frames were created for each album, including relevant song information such as title, ID, lyrics, and album release year. The lyrics were tokenized and transformed into a tidy format, facilitating text mining and analysis.

---

## 4. Text Analysis and Word Frequency

### 4.1 Tidy Format
By creating a tidy version of words from lyrics, we ensures consistency to facilitate tokenisation and integra- tion for text mining tools.

---

## Text Analysis and Word Frequency

Word frequencies were analysed across all albums and individually for each album. This involved creating word clouds and visualizing the most frequently used words in Frank Ocean's lyrics.

Figure 1 : Most frequencies throughout the albums

![Word Freq All](https://github.com/user-attachments/assets/061d477a-7d4f-40b7-95b5-b0e9fc6edbc0)

Figure 2 : Word frequencies in the per albums
![image](https://github.com/user-attachments/assets/97f3087d-0e9d-4a6e-8c38-678a61a963ab)


---

## Document-Feature Matrix (DFM) and Word Clouds

A Document-Feature Matrix (DFM) was created to tabulate the frequency of terms in the lyrics corpus. Word clouds were generated for all albums and individually for each album, providing a visual representation of the most frequent and important words.

Figure 3:  Wordcloud of across the albums
![image](https://github.com/user-attachments/assets/54da6afd-5ac2-4b29-981c-21e3f79be201)

### For each albums

Figure 4. Blond Wordcloud
![image](https://github.com/user-attachments/assets/d46d6228-f723-44f6-9176-c5b38032a806)


Figure 5. Channel Orange Wordcloud
![image](https://github.com/user-attachments/assets/e8cb5be7-8815-409a-aeb2-af7ae3421cf1)


Figure 6. Nostalgia Ultra Wordcloud
![image](https://github.com/user-attachments/assets/b98d3ebb-abb3-4386-8103-e18f0028d4ed)

###  Weighted Word Clouds 

Additionally, We can look at a weighted DFM which will assign varying importance to terms based on their prevalence in shorter and longer songs. This weighting enhances accuracy by reflecting the significance of words in the lyrics corpus more effectively.

Figure 7: Blond weighted wordcloud
![image](https://github.com/user-attachments/assets/06b65512-8ff4-49ae-8f05-86ebf15703f7)

Figure 8. Channel Orange weighted wordcloud
![image](https://github.com/user-attachments/assets/f576a5b9-857c-4919-8bc7-460c774c0c17)

Figure 9. Nostalgia Ultra weighted wordcloud
![image](https://github.com/user-attachments/assets/097b88fa-0d26-4a0a-abc9-0e3a908ee531)


---

## Sentiment analysis and visualisation

In this section, we will use the NRC lexicon and lexicons in the context of the songs themes that I have personally created in order to perform our sentiment analysis. The NRC dataset is a lexicon containing words annotated with sentiment categories. It classifies words based on emotions and sentiments, providing a structured resource for sentiment analysis in text data.

### Creating Sentiment Scores 
With out NRC dataset and our own lexicons, we create a sentiment scores for sentiments such as nostalgia, life, love, frustration, time, night, anticipation, anger, disgust, fear, joy, sadness, surprise, trust, positive, and negative.

By scoring songs based on lexicon occurrences allows insights into thematic associations, enabling diverse assumptions about song sentiments.

With our new scoring method, we can therefore conduct descriptive statistics and statistical tests and gain insights on our findings.

### Descriptive Statistics

|                    Mean        Median        SD
nostalgia_score     0.1250000    0.0    0.3342187
life_score          1.3750000    0.0    3.0008864
love_score          3.7916667    1.0    6.6266976
frustration_score   0.9166667    0.0    3.6718210
time_score          1.7708333    1.0    2.8601412
night_score         1.7291667    0.0    4.5883274
anticipation_score 10.7708333    8.0   10.3681993
anger_score         7.6458333    5.0    8.3347251
disgust_score       5.8333333    3.5    7.5606296
fear_score          7.3125000    5.0    7.8825319
joy_score          13.1875000    9.0   12.3023199
sadness_score      12.0208333    8.5   13.2817097
surprise_score      7.7500000    4.5   10.1530836
trust_score        14.6041667   10.5   12.9232424
positive_score     22.6875000   20.5   18.6629183
negative_score     12.1041667    9.5   11.3573288

### Correlation Matrix
A correlation matrix is useful for exploring the strength and direction of relationships between variables. It provides a comprehensive overview of pairwise correlations, helping identify patterns and dependencies in the data.

Figure 10: Correlation Matrix between sentiment scores
![image](https://github.com/user-attachments/assets/17669570-124f-42e7-a9d7-f627d9e73be2)

## Sentiment patterns and trends over the albums

Figure 10. Sentiment scores trends over the first, second and thrid albums 
![image](https://github.com/user-attachments/assets/71510ad2-dfcd-47fc-9205-93fb5c13fadc)

Figure 10, illustrates sentiment scores across Frank Ocean’s first and last albums, suggesting potential evolution in his songwriting, emotions, and overall themes. This visual aids in understanding how the artist’s expression and sentiments have evolved throughout different albums.

---
## Conclusion

In conclusion, this project examined sentiment patterns in Frank Ocean’s lyrics across his three official albums: “Nostalgia Ultra,” “Channel Orange,” and “Blonde.”

By using text mining, sentiment lexicons, and statistical analyses, we looked at evolving emotional themes and lyrical nuances. The uses of of the NRC lexicon and personally curated lexicons offered insights into sentiments associated with themes like nostalgia, life, and love.

Despite non-significant p-values in descriptive statistics and ANOVA tests, enhancing robustness necessitates a broader dataset, encompassing singles and unreleased tracks for a comprehensive time series analysis — a possibility that was unfortunately beyond the project’s scope.

Nevertheless, this exploration provides intriguing observational insights into an artist’s emotive landscape, showcasing the potential of text analysis in unraveling intricate patterns within song lyrics.

---
