---
layout: post
title: Bayes' Rule
subtitle: slayer of spam
date: 2016-07-07
header-img: img/headers/prince_of_wales.jpg
published: true
comments: true
---

As I work through the refresher on probability and information theory, the authors showcase [Bayes' Rule](https://en.wikipedia.org/wiki/Bayes%27_rule) which is a key statistical technique applied to e-mail filtering.  

><p>We often find ourselves in a situation where we know P(y | x) and need to know P(x | y). Fortunately, if we also know P(x), we can compute the desired quantity using Bayes’ rule:
><table style="border:none; width:initial; margin:0px 0px 0px 100px">
><tr>
>    <td rowspan="2" style="vertical-align:middle;text-align:right;border:none">P(x | y) =</td>
>    <td style="vertical-align:bottom;text-align:left;border:none">P(x) P(y | x)</td>
></tr>
><tr>
>   <td style="vertical-align:top;text-align:center;border-top:1px solid #808080">P(y)</td>
></tr>
></table>
><p>Note that while P(y) appears in the formula, it is usually feasible to compute</p>
><p style="margin-left:100px">P(y) = &#x2211;<sub>x</sub> P(y | x) P(x)</p>
><p>so we do not need to begin with knowledge of P(y).</p>

<cite>Excerpted from Chapter 3 of [Deep Learning](http://www.deeplearningbook.org/) by Ian Goodfellow, Yoshua Bengio and Aaron Courville.</cite>

## Example Code

Here's an example of prediction with a [Gaussian Naive Bayes algorithm](http://scikit-learn.org/stable/modules/generated/sklearn.naive_bayes.GaussianNB.html) using Python's scikit-learn library:

```python
import numpy as np
X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
Y = np.array([1, 1, 1, 2, 2, 2])
from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()
print(clf.predict([[-0.8, -1]]))
clf_pf = GaussianNB()
clf_pf.partial_fit(X, Y, np.unique(Y))
print(clf_pf.predict([[-0.8, -1]]))
```

with output shown in this interactive session:
![Python Shell]({{ site.url }}/img/posts/bayes_gaussiannb_scikit.png)