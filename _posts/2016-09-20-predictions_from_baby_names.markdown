---
layout: post
title: Predictions from US Baby Names
subtitle: ask silly questions, get silly answers
date: 2016-09-20
header-img: img/headers/star_trek_enterprise.jpg
comments: true
---

I discovered the predictive analytics tool, [RapidMiner](https://rapidminer.com/), through a [Safari tutorial](https://www.safaribooksonline.com/library/view/beginning-data-analytics/9781491969137/) and wanted to try it out.  Given my recently loaded [US baby names]({{ site.url }}/2016/09/13/loading_babyname_data/) data set, I thought I'd ask some silly questions... more to see how Rapid Miner works, than to accurately predict anything. 

## Decision Tree

I wondered if one could predict a US person's most likely birth state given their first name, their gender, and their year of birth. First off, I created a Rapid Miner process which:

* Creates a 1000 record training set:  ```SELECT "name", "state", "gender","count", "year" FROM "public"."statenames" ORDER BY RANDOM() LIMIT 1000```
* Loads a test set of 20 records: ```SELECT "name", "gender", "year", "state" as "actual_state" FROM "public"."statenames" ORDER BY RANDOM() LIMIT 20```
* Set attribute roles as needed to binomial (gender) etc.

![Process]({{ site.url }}/img/posts/rm_predict_state_process.png)

* Then trained a decision tree model on the training data set.  Interestingly, the decision tree ignored name and started to split solely on birth year, occasionally considering gender, in order to predict birth state.

![Tree]({{ site.url }}/img/posts/rm_predict_state_decision_tree.png)

* Applied the model to the test data set to predict a name/gender/year record's birth state.  As you can probably guess, a decision tree model based solely on year and gender does a horrible job of predicting birth state.  See the two green columns in the results below (actual vs predicted).

![Results]({{ site.url }}/img/posts/rm_predict_state_results.png)

So this use of decision tree was clearly [a mis-applicaton for this data set and question](http://community.rapidminer.com/t5/RapidMiner-Studio/Predictions-based-on-US-baby-names-data/m-p/33430/highlight/true#M23651).


## Naive Bayes

So let's narrow the solution space by seeing if we can predict gender, a binomial, based on name and birth year using the national names data set.  As an aside, there are a number of names which have both male and female records for a given year.  For example, my own name 'Guy' has a handful of female counts for 59 different years.  I leave it to the read to decide if these are accurate records (actual baby girls named 'Guy') or simply a data quality problem.

```select year, count from nationalnames where name = 'Guy' and gender = 'F' order by year desc```

![Query]({{ site.url }}/img/posts/rm_predict_gender_girls_guy.png)

So, I created a RapidMiner process with Naive Bayes model, increased the training set size to 10,000 records, and added a Performance (Binomial Classification) operator as shown:

![Process]({{ site.url }}/img/posts/rm_predict_gender_process.png)

Repeated runs generated results approximating a coin flip, so not great.  Here's an example:

![Performance]({{ site.url }}/img/posts/rm_predict_gender_performance.png)


## Better Results

While the results above are not particularly predictive, I did learn a good deal about Rapid Miner and its algorithms.  For rapid prototyping, it is a very effective tool.  For a better result from the name data, check out this example which [predicts age from name and gender](http://www.randalolson.com/2015/08/13/can-the-name-age-calculator-guess-how-old-you-are/).