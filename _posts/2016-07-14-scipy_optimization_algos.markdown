---
layout: post
title: Optimization Algorithms 
subtitle: a least squares example
date: 2016-07-14
header-img: img/headers/climbing_wall.jpg
comments: true
---

I just completed the chapter on numerical computation in the [Deep Learning](http://www.deeplearningbook.org/) book by Ian Goodfellow, Yoshua Bengio and Aaron Courville. The topic of gradient-based optimization using various algorithms is explored. The example they give at the end of the chapter is using least squares to minimize a function.  This is also known as "curve-fitting", often performed when trying to tune parameters of a model function to best match the some collected data.

## Least Squares with SciPy

<p style="margin-left:20px"><i>"Least-squares problems occur in many branches of applied
mathematics. In this problem a set of linear scaling coefficients is
sought that allow a model to fit data. In particular it is assumed
that data</i> 
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <msub>
    <mi>y</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
    </mrow>
  </msub>
</math>
<i>is related to data</i>
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <msub>
    <mrow class="MJX-TeXAtom-ORD">
      <mi mathvariant="bold">x</mi>
    </mrow>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
    </mrow>
  </msub>
</math>
<i>through a set of coefficients</i>
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <msub>
    <mi>c</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>j</mi>
    </mrow>
  </msub>
</math>
<i>and model functions</i>
<math xmlns="http://www.w3.org/1998/Math/MathML">
  <msub>
    <mi>f</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>j</mi>
    </mrow>
  </msub>
  <mrow>
    <mo>(</mo>
    <msub>
      <mrow class="MJX-TeXAtom-ORD">
        <mi mathvariant="bold">x</mi>
      </mrow>
      <mrow class="MJX-TeXAtom-ORD">
        <mi>i</mi>
      </mrow>
    </msub>
    <mo>)</mo>
  </mrow>
</math>
<i>via the model"</i>.<br/>
<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <msub>
    <mi>y</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
    </mrow>
  </msub>
  <mo>=</mo>
  <munder>
    <mo>&#x2211;<!-- ∑ --></mo>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>j</mi>
    </mrow>
  </munder>
  <msub>
    <mi>c</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>j</mi>
    </mrow>
  </msub>
  <msub>
    <mi>f</mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>j</mi>
    </mrow>
  </msub>
  <mrow>
    <mo>(</mo>
    <msub>
      <mrow class="MJX-TeXAtom-ORD">
        <mi mathvariant="bold">x</mi>
      </mrow>
      <mrow class="MJX-TeXAtom-ORD">
        <mi>i</mi>
      </mrow>
    </msub>
    <mo>)</mo>
  </mrow>
  <mo>+</mo>
  <msub>
    <mi>&#x03F5;<!-- ϵ --></mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
    </mrow>
  </msub>
</math>
<i>where</i>
 <math xmlns="http://www.w3.org/1998/Math/MathML">
  <msub>
    <mi>&#x03F5;<!-- ϵ --></mi>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
    </mrow>
  </msub>
</math>
<i>represents uncertainty in the data."</i> [From <a href="http://docs.scipy.org/doc/scipy/reference/tutorial/linalg.html">Scipy docs</a>]</p>

### Solving directly with scipy.linalg.lstsq

```python
import numpy as np
from scipy import linalg
import matplotlib.pyplot as plt

c1, c2 = 5.0, 2.0
i = np.r_[1:11]
xi = 0.1*i
yi = c1*np.exp(-xi) + c2*xi
zi = yi + 0.05 * np.max(yi) * np.random.randn(len(yi))

A = np.c_[np.exp(-xi)[:, np.newaxis], xi[:, np.newaxis]]
c, resid, rank, sigma = linalg.lstsq(A, zi)

xi2 = np.r_[0.1:1.0:100j]
yi2 = c[0]*np.exp(-xi2) + c[1]*xi2

plt.plot(xi,zi,'x',xi2,yi2)
plt.axis([0,1.1,3.0,5.5])
plt.xlabel('$x_i$')
plt.title('Data fitting with linalg.lstsq')
plt.show()
```

![Plotted]({{ site.url }}/img/posts/scipy_optimization_lstsq_plot.png)

### Solving iteratively with scipy.optimize.leastsq

Similarly, here's a good example of using <a href="http://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.curve_fit.html">`scipy.optimize.curve_fit`</a>, a convenient wrapper around <a href="http://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.leastsq.html">`scipy.optimize.leastsq`</a>.  Here we're fitting time vs temperature data in a cooling cup of coffee.

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
 
```python 
def fitFunc(t, a, b, c):
    return a*np.exp(-b*t) + c

t = np.linspace(0,4,50)
temp = fitFunc(t, 2.5, 1.3, 0.5)
noisy = temp + 0.25*np.random.normal(size=len(temp))

fitParams, fitCovariances = curve_fit(fitFunc, t, noisy)
print (fitParams)
print (fitCovariances)

plt.ylabel('Temperature (C)', fontsize = 16)
plt.xlabel('time (s)', fontsize = 16)
plt.xlim(0,4.1)
# plot the data as red circles with vertical errorbars
plt.errorbar(t, noisy, fmt = 'ro', yerr = 0.2)
# now plot the best fit curve and also +- 1 sigma curves
# (the square root of the diagonal covariance matrix  
# element is the uncertianty on the fit parameter.)
sigma = [fitCovariances[0,0], \
         fitCovariances[1,1], \
         fitCovariances[2,2] \
         ]
plt.plot(t, fitFunc(t, fitParams[0], fitParams[1], fitParams[2]),\
         t, fitFunc(t, fitParams[0] + sigma[0], fitParams[1] - sigma[1], fitParams[2] + sigma[2]),\
         t, fitFunc(t, fitParams[0] - sigma[0], fitParams[1] + sigma[1], fitParams[2] - sigma[2]))
plt.show()
```

[Code example above from the <a href="http://scipyscriptrepo.com/wp/?p=76">SciPy Script Repository</a>]

![Plotted]({{ site.url }}/img/posts/scipy_optimization_curve_fit_plot.png)