# Statistical-Emotions

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

Figure 1 : Most Frequently Used Words in all the Albums

![Word Freq All](https://github.com/user-attachments/assets/061d477a-7d4f-40b7-95b5-b0e9fc6edbc0)

---

## Document-Feature Matrix (DFM) and Word Clouds

A Document-Feature Matrix (DFM) was created to tabulate the frequency of terms in the lyrics corpus. Word clouds were generated for all albums and individually for each album, providing a visual representation of the most prominent words.

---

## Sentiment Analysis and Visualization

Sentiment scores were created using the NRC lexicon and custom lexicons for various themes. Descriptive statistics and ANOVA tests were conducted to analyze the sentiment scores. A correlation matrix was created to explore relationships between sentiment scores, and sentiment trends were visualized across albums.

---

## Conclusion

This project provides insights into the emotional themes and lyrical nuances in Frank Ocean’s albums. By using text mining and sentiment analysis, we explored the evolution of sentiments across his discography, offering a unique perspective on his artistic journey.

---
