---
layout: post
title: Bayes' Rule
subtitle: slayer of spam
date: 2016-07-07
header-img: img/prince_of_wales.jpg
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
