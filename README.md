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
2. [Data Collection](#data-collection)
3. [Preprocessing the Data](#preprocessing-the-data)
4. [Text Analysis and Word Frequency](#text-analysis-and-word-frequency)
5. [Document-Feature Matrix (DFM) and Word Clouds](#document-feature-matrix-dfm-and-word-clouds)
6. [Sentiment Analysis and Visualization](#sentiment-analysis-and-visualization)
7. [Conclusion](#conclusion)

---

## Introduction

The aim of this project is to analyze the sentiment expressed in Frank Ocean’s lyrics across his three albums. By utilizing text mining techniques and sentiment lexicons, we explore the emotional themes and lyrical nuances that define his musical journey.

---

## Data Collection

Lyrics were collected using the Genius API and processed with R programming. JSON files for each album were obtained and imported into R for analysis.

---

## Preprocessing the Data

Data frames were created for each album, including relevant song information such as title, ID, lyrics, and album release year. The lyrics were tokenized and transformed into a tidy format, facilitating text mining and analysis.

---

## Text Analysis and Word Frequency

Word frequencies were analyzed across all albums and individually for each album. This involved creating word clouds and visualizing the most frequently used words in Frank Ocean's lyrics.

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
