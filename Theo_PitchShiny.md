Pitching Predicting Theophylline Pharmacokinetics
========================================================
author: Dave Ott
date: 4/21/2017
autosize: true

Predicting Theophylline Pharmacokinetics
========================================================

Do you have Asthma? Do you know someone with Asthma? Do you 
know someone who knows someone with asthma?

If so, the Shiny App for you!! This Shiny App will predict the Pharmacokinetics, yes that is right Pharmacokinetics! What is Pharmacokinetics you ask? It is the study of the bodily absorption, distribution,  metabolism, and excretion of drug. Yes this Shiny App will predict this by using you weight and the dose of Theophylline. It will show you a nice plot over the time. But wait there is more! If you are not satisfied with the plot there is also a data table. 


You might be thinking why is he doing a project on Theophylline Pharmacokinetics?  Well it's because I have asthma and I have taken Theophylline when I was first diagnosed, back in the 1960s.

Data Set
==========================================================
Sure the data set is small,only 12 subjects, and has units in metric, **Wt** is kg, **Dose** mg/kg and **conc** is mg/L. See the sample below. So you may be thinking I know my weight in lb but not in kg. No worries! This Shiny App, with the help of modern conversion tools created by the top minds of our day, will convert your lb to kg, 



```r
head(Theoph)
```

```
  Subject   Wt Dose Time  conc
1       1 79.6 4.02 0.00  0.74
2       1 79.6 4.02 0.25  2.84
3       1 79.6 4.02 0.57  6.57
4       1 79.6 4.02 1.12 10.50
5       1 79.6 4.02 2.02  9.66
6       1 79.6 4.02 3.82  8.58
```

Model
========================================================
How is all this possible? We have a statistical non linear model from the documentation that will be used. You want to see the model don't you, well here is strait from the documentation:

**nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl),data = Theoph.4)**

Where SSfol is a self-starting model function used with doses, of course.

Final Pitch
==========================================================
ACT NOW!! This Shiny App will not stay on the selves for long. The *only* Shiny App that was created and published by this author. This Shiny App will determine when you are running low on Theophylline, based on your weight in lbs, not kgs. Remember we do the conversions for you. And the plot that moves when you move the sliders, this is just amazing. And don't forget the Data Table as our parting gift, even if you are not satisfied with the plot.

Finally here is a link to this wonder Shiny App you can't live without:

https://sqldaveott.shinyapps.io/Theo_shiny/
