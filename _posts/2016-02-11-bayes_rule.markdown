---
layout: post
title: Bayes' Rule
subtitle: slayer of spam
date: 2016-02-11
background: /img/headers/prince_of_wales.jpg
published: true
comments: true
---

<script type="text/x-mathjax-config">
        MathJax.Hub.Config({
        showProcessingMessages: false,
        tex2jax: { inlineMath: [['$','$'],['\\(','\\)']] }
    });
    </script>
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

As I work through the refresher on probability and information theory, the authors showcase [Bayes' Rule](https://en.wikipedia.org/wiki/Bayes%27_rule) which is a key statistical technique applied to e-mail filtering.  

><p style="margin-top:0px">We often find ourselves in a situation where we know <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>y</mi> <mo>|</mo> <mi>x</mi></mfenced></math> and need to know <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>x</mi> <mo>|</mo> <mi>y</mi></mfenced></math>. Fortunately, if we also know <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>x</mi></mfenced></math>, we can compute the desired quantity using Bayes’ rule:</p>
><math display="block" xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>x</mi> <mo>|</mo> <mi>y</mi></mfenced> <mo>=</mo><mfrac><mrow><mi>P</mi><mfenced separators=''><mi>x</mi></mfenced> <mi>P</mi><mfenced separators=''><mi>y</mi> <mo>|</mo> <mi>x</mi></mfenced></mrow><mrow><mi>P</mi><mfenced separators=''><mi>y</mi></mfenced></mrow></mfrac></math>
>Note that while <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>y</mi></mfenced></math> appears in the formula, it is usually feasible to compute
><math display="block" xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>y</mi></mfenced><mo>=</mo><msub><mo>&#x2211;</mo><mi>x</mi></msub><mi>P</mi><mfenced separators=''><mi>y</mi> <mo>|</mo> <mi>x</mi></mfenced> <mi>P</mi><mfenced separators=''><mi>x</mi></mfenced></math>
>so we do not need to begin with knowledge of <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>P</mi><mfenced separators=''><mi>y</mi></mfenced></math>.
>

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
<img src="/img/posts/bayes_gaussiannb_scikit.png" class="img-fluid" />