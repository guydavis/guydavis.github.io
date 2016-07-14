---
layout: post
title: Linear Algebra
subtitle: my old friend
date: 2016-07-05
header-img: img/headers/apostles.jpg
published: true
comments: true
---

As part of explorations into machine learning, I've been brushing up on computer science basics starting with linear algebra.  Nice to see good old [eigenvectors](https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors) again after so many years.

><p style="margin-top:0px;">An eigenvector of a square matrix <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>A</mi></math> is a non-zero vector <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>v</mi></math> such that multiplication by <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>A</mi></math> alters only the scale of <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>v</mi></math>:</p>
>
><p style="font-size:larger;text-align:center"><math xmlns="http://www.w3.org/1998/Math/MathML"><mi>Av</mi> <mo>=</mo> <mi>λv</mi></math></p>
>
> The scalar <math xmlns="http://www.w3.org/1998/Math/MathML"><mi>λ</mi></math> is known as the eigenvalue corresponding to this eigenvector.
> 

<cite>Excerpted from Chapter 2 of [Deep Learning](http://www.deeplearningbook.org/) by Ian Goodfellow, Yoshua Bengio and Aaron Courville.</cite>

## Practical Use?

So, why are eigenvectors important?  Well, they are used in [singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition), which can be applied in [principal component analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) as mentioned in this [podcast on machine learning fundamentals](http://www.thetalkingmachines.com/blog/2015/7/2/solving-intelligence-and-machine-learning-fundamentals).

## Example Code

Here's a quick way of calculating eigenvalues and eigenvectors in Python using the numpy library:

```python
import numpy as np
k = np.random.normal(size=(2,2))
eigenvalues,eigenvectors = np.linalg.eig(k)
```

with output shown in this interactive session:
![Python Shell]({{ site.url }}/img/posts/eigenvectors_shell.png)