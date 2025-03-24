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

---

## Sentiment analysis and visualisation

Sentiment scores were created using the NRC lexicon and custom lexicons for various themes. Descriptive statistics and ANOVA tests were conducted to analyze the sentiment scores. A correlation matrix was created to explore relationships between sentiment scores, and sentiment trends were visualized across albums.

---

## Conclusion

This project provides insights into the emotional themes and lyrical nuances in Frank Ocean’s albums. By using text mining and sentiment analysis, we explored the evolution of sentiments across his discography, offering a unique perspective on his artistic journey.

---
