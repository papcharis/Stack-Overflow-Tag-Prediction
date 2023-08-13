# Stack-Overflow-Tag-Prediction

## Description
In this problem, we are going to try and predict correctly the tags of various questions that have been uploaded on the Stack Overflow forum. As understood, the problem that we have to solve, is a multi-labeled classification problem. The dataset used can be found here: https://www.kaggle.com/datasets/stackoverflow/stacksample.

The Dataset consists of the text of 10% of questions and answers from the Stack Overflow programming Q&A website.

This is organized as three tables:

&#8226; Questions contains the title, body, creation date, closed date (if applicable), score, and owner ID for all non-deleted Stack Overflow questions whose Id is a multiple of 10.

&#8226; Answers contains the body, creation date, score, and owner ID for each of the answers to these questions. The ParentId column links back to the Questions table.

&#8226; Tags contains the tags on each of these questions

## Exploratory Data Analysis (EDA) - Data Sanitizing

In the first part of the problem, I performed some exploratory data analysis on the dataset in order to understand the quality and distributions of the data. Following, I have "cleaned" the text data with various techniques like: 

&#8226; Transforming to Lowercase

&#8226; Discarding HTML tags & Punctuation

&#8226; Lemmatization 

&#8226; Removing Stopwords

## Feature Extraction - Base Machine Learning Classifiers

In the next part, I extracted from the data the famous NLP feature, **TF-IDF**. Next, I binarized the tags so that the labels of every example were represented from a list of binary numbers, with 1 stating the existance of the tag, while 0 the opposite. The length of the list for every example was equal to the number of possible tags (100 - my choice). We used an 80-20 Train-Test split.

Three different Machine Learning classifiers were used in order to test their performance. The classifiers were:

&#8226; Logistic Regression

&#8226; Multinomial Naive Bayes

&#8226; Linear Support Vector Classifier

While, the metrics used to test their performance were:

&#8226; ROC - AUC

&#8226; F1 Score

&#8226; Jaccard Similarity Score

The classifier that managed to perform the best was the Linear SVC with: a) F1 Score: 61% and b) ROC-AUC Score: 74.8% c)Jaccard Similarity Score: 49.5%

## LLM Approach - Pretrained BERT transformer from Hugging Face

For this part, a pretrained BERT transformer model, from Hugging Face, was used in order to perform the same classification. I have added a trainable classifier head on the pretrained model in order to make the output have the correct shape and match our labels. The final model have been trained only for 10 epochs and has already outperformed the base classifiers. For sure, with some extra tuning and training the results can be exceptional. The performance was evaluated using the same metrics. The scores on the test set are presented below:

&#8226; F1 Score: 70.7%

&#8226; ROC- AUC Score: 88.6%

&#8226; Jaccard Similarity Score: 64%

# Docker Contenarization 

For the final part of the problem, I have created a Docker file in order to reproduce the problem in any machine. Using the Dockerfile, a Docker image can be created and a container with all the modules and libraries installed can be launched in order to run the Jupyter Notebook.

