Talked about more overdispersion stuff and how it affects inferences/testing, and the Type I/II error we see

Then he wen tthrough the Poisson GLM for count response I, like R code for it. We found that this dataset has a high predicted overdispersion, so what do we do about it?

Overdispersion <=> V(Yi) >> $\hat{\mu}_i$, variance estimated by the poisson model
This is all assuming $V(Y_i)=\phi \hat{\mu}_i, \phi >> 1$

$$
\phi = \div{1}{n-p} \sum{\div{1}{n-p}}
$$
overdispersion <=> $\hat{\phi} >> 1$ <=> $w >> n-p$ 

### Addressing Overdispersion
1. Quasi-Poisson model
   In a GLM, score function (first derivative of log likelihood) can be described as 
   $$
   yea im not typing that
   $$


The model only uses Var(Yi) = phi mu i in the expression of (*)

Note2: the quasi model affects Var(\hat{\beta}), not \hat{\beta} estimates
Note3: LRT is not appropriate for quasi-poisson models bc we no longer have a a proper likelihood function, but the Wald-type test/CI may still be valid (bc from Poisson regression, our \hat{\beta} is approx N(\beta, (X^T\hat{W}X)^{-1}), from quasi-poisson our \hat{\beta} is approx N(\beta, \phi (X^T\hat{W}X)^{-1}))

2. Negative Binomial (NB) model (to address overdispersion issue from doing Poisson Regression)
Allows more flexibility in the relnship btwn E(Yi) and Var(Yi)
In the standard Poisson regression, the relnthip btwn mu_i and the linear predictor x_i^T \beta is deterministic, as in $mu_i = e^{x_i^T \beta}$. what this means is, if there's 2 obs. w/ same $x$, they have the same $\mu$

In NB reg, we add extra variability to \mu, by assuming \mu_i follows a gamma distribution whose mean is e^{x_i^T\beta}, so 
$$
\mu_i \approx gamma(\gamma,\div{\gamma}{e^{x_i^T\beta}})
$$
And also $E(\mu_i) = \div{\gamma}{e^{x_i^T\beta}}, V(\mu_i) = \div{\gamma}{e^{x_i^T\beta}} = \div{1}{\gamma}e^{2x_i^T\beta}$

When $x_i^T$ is given, the model assumes $Y_i(\mu_i \approx Poi(\mu_i)$ where $\mu_i \approx gamma(etc, etc)$

This is like a mix of the two so we call it a Poisson-gamma mixture.

To get the pmf, we use <insert here>

It follows: ...

Notice that the negative binomial allows the variance to differ from the mean, which is how it addresses overdispersion.

If somehow gamma is large -> infinity, then NB reg is converging/collapsing to the Poisson regression.

midterm nxt tuesday will cover until tomorrow's lecture (feb 25) practice problems and formula sheets posted/will be posted
focus mostly on poisson regression, and then one topic on accuracy/ROC curve stuff

See R code on how we handle overdispersion using the above methods in R.

Notice the SE's are now different from the glm, and the residual plots they look the same since parameters are the same, but the threshold changes
