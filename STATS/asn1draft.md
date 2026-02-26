
## Q1
### (a) MLE of $p$ and its sampling distribution.
$Y \sim \text{Binomial}(n, p)$ means pmf = $\binom{n}{y_i} p^{y} (1-p)^{n-y}$, so the likelihood function is

$$
\begin{align*}

L(p \mid y) &= \prod_{i=1}^n \binom{n}{y}p^{y} (1-p)^{n-y} \\
    &= \binom{n}{y} p^y (1-p)^{n-y} \\
\ell(p \mid y) = \ln L(p \mid y) &= \ln \left( \binom{n}{y} p^y (1-p)^{n-y} \right) \\
    &= \ln \binom{n}{y} + y \ln p + (n-y)\ln(1-p) \\
\frac{d\ell(p\mid y)}{dp} &= \frac{y}{p} - \frac{n-y}{1-p} 

\end{align*}
$$

Set to 0 for a maximum:

$$
\begin{align*}

\frac{d\ell(p\mid y)}{dp} &= \frac{y}{p} - \frac{n-y}{1-p} = 0 \\
\frac{y}{p} &= \frac{n-y}{1-p} \\
y(1-p) &= p(n-y) \\
y - yp &= np - yp \\
y &= np \\
\therefore \hat{p}_{MLE} &= \frac{y}{n} \\

\end{align*}
$$

The sampling distribution of $\hat{p}_{MLE}$ is $N(p, Var(\hat{p}_{MLE}))$, but we can only estimate for the variance of the estimator, so we use 

$$\begin{align*}

\hat{Var}(\hat{p}_{MLE}) = \frac{1}{I(\hat{p}_{MLE})},
\qquad I(\hat{p}_{MLE}) &= -E\left[ \frac{d^2 \ell(p)}{dp^2} \right]\\
I(\hat{p}_{MLE}) &= -E\left[ \frac{d}{dp} \left( \frac{y}{p}- \frac{n-y}{1-p} \right) \right] \\
I(\hat{p}_{MLE}) &= -E\left[-\frac{y}{p^2} - \frac{n-y}{(1-p)^2}\right], E\left[Y\right]=np \text{ for binomial}\\
I(\hat{p}_{MLE}) &= \frac{np}{p^2} + \frac{n(1-p)}{(1-p)^2} \\
I(\hat{p}_{MLE}) &= \frac{n}{p} + \frac{n}{1-p} \\
I(\hat{p}_{MLE}) &= \frac{n(1-p) + np}{p(1-p)} \\
I(\hat{p}_{MLE}) &= \frac{n}{p(1-p)} \\

\hat{Var}(\hat{p}_{MLE}) = \frac{p(1-p)}{n}

\end{align*}$$

So $\hat{p}_{MLE} \dot\sim N\left(p, \frac{\hat{p}_{MLE}(1-\hat{p}_{MLE})}{n}\right)$.

### (b) Wald test statistic and rejection region for this test.
We use the sampling distribution above to construct the Wald test.

Let Wald test statistic be
$$W = \frac{\hat{p}_{MLE} - p^*}{SE(\hat{p}_{MLE})}$$
where $SE(\hat{p}_{MLE}) = \sqrt{\frac{\hat{p}_{MLE}(1-\hat{p}_{MLE})}{n}}$.

So for testing $H_0: p = p^*$ vs $H_a: p \neq p^*$, the rejection region at significance level $\alpha$ is
$$|W| > z_{\alpha/2}$$
where $z_{\alpha/2}$ is the critical value from the standard normal distribution.
Or, we fail to reject $H_0$ if $-z_{\alpha/2} \leq W \leq z_{\alpha/2}$.

### (c) Likelihood ratio test statistic and rejection region for this test.
Let LRT statistic be 
$$LR = -2 \left( \ell(p^*) - \ell(\hat{p}_{MLE}) \right) \dot\sim \chi^2_{1}$$
and $p-val= P(T > LR)$, 
where $T \sim \chi^2_1$ under $H_0$. So the rejection region at significance level $\alpha$ is 
$$LR > \chi^2_{1, 1-\alpha}$$

### (d) $n=100$, $y=35$, $p^*=0.4$ at $\alpha=0.05$.
**Wald test:** $\alpha/2 = 0.025$, $\hat{p}_{MLE}=\frac{y}{n}=\frac{35}{100}=0.35$.

$$
\begin{align*}

SE(\hat{p}_{MLE}) &= \sqrt{\frac{0.35 \times (1-0.35)}{100}} = 0.04769696 \\
W = \frac{\hat{p}_{MLE} - p^*}{SE(\hat{p}_{MLE})}&= \frac{0.35 - 0.4}{0.04769696} = -1.048284837 \\
z_{\alpha/2} &= z_{0.025} = 1.96

\end{align*}$$

We fail to reject $H_0$ since $|W| \not>  z_{\alpha/2}$, $-1.96 < -1.048 < 1.96$. Thus we cannot say the true probability of success differs from our assumption of 0.4.

**LRT test:** 
$$\begin{align*}
\ell(0.35)&=\ln \binom{100}{35} + 35 \ln 0.35 + 65 \ln 0.65 = \ln \binom{100}{35}-64.7447\\
\ell(0.4) &= \ln \binom{100}{35} + 35 \ln 0.4 + 65 \ln 0.6. = \ln \binom{100}{35} -65.2738
\end{align*}$$

$$\begin{align*}
LR &= -2 \left( \ell(p^*) - \ell(\hat{p}_{MLE}) \right) \dot\sim \chi^2_{1} \\
LR &= -2 \left( \ell(0.4) - \ell(0.35) \right) = -2 (-65.2738 - (-64.7447)) = 1.0582 \\
\chi^2_{1, 1-0.05}&=\chi^2_{1, 0.95} = 3.841
\end{align*}$$

We fail to reject $H_0$ since $LR \not> \chi^2_{1, 1-\alpha}$, $0.576 < 3.841$.

## Q2
### (a) MLE of $\lambda$ and its sampling distribution.
$Y_i \sim \text{Poisson}(\lambda)$ means pmf $= \dfrac{e^{-\lambda}\lambda^{y_i}}{y_i!}$, so the likelihood function is

$$\begin{align*}
L(\lambda \mid y_i)
= \prod_{i=1}^n f(y_i \mid \lambda)
= \prod_{i=1}^n \frac{e^{-\lambda}\lambda^{y_i}}{y_i!}
&= \frac{e^{-n\lambda}\lambda^{\sum y_i}}{y_1!y_2!\cdots y_n!} \\

\ell(\lambda \mid y_i)
= \ln L(\lambda \mid y_i)
= \ln \left(
\frac{e^{-n\lambda}\lambda^{\sum y_i}}{y_1!y_2!\cdots y_n!}
\right)
&= -n\lambda + (\sum y_i)\ln\lambda - \sum \ln(y_i!) \\

\frac{\partial \ell(\lambda \mid y_i)}{\partial \lambda}
&= -n + \frac{\sum y_i}{\lambda}\\
\end{align*}$$

Set to 0 for a maximum:

$$\begin{align*}
\frac{\partial \ell(\lambda \mid y_i)}{\partial \lambda} = -n + \frac{\sum y_i}{\lambda} &= 0 \\

n &= \frac{\sum y_i}{\lambda} \\

\therefore \hat{\lambda}_{MLE} &= \frac{\sum y_i}{n} = \bar{y}
\end{align*}$$

The sampling distribution of $\hat{\lambda}_{MLE}$ is $N(\lambda, \text{Var}(\hat{\lambda}_{MLE}))$, we use an estimate for the variance of the estimator,

$$\begin{align*}
\text{Var}(\hat{\lambda}_{MLE})
= \frac{1}{I(\hat{\lambda}_{MLE})},
\qquad
I(\hat{\lambda}_{MLE})
&= -E\left[\frac{\partial^2 \ell(\lambda)}{\partial \lambda^2}\right] \\
I(\hat{\lambda}_{MLE})
&= -E\left[
\frac{\partial}{\partial \lambda}
\left(
-n + \frac{\sum y_i}{\lambda}
\right)
\right] \\
I(\hat{\lambda}_{MLE})
&= -E\left[
-\frac{\sum y_i}{\lambda^2}
\right],
\qquad
E[Y_i] = \lambda \text{ for Poisson} \\

I(\hat{\lambda}_{MLE})
&= \frac{n\lambda}{\lambda^2}
= \frac{n}{\hat{\lambda}_{MLE}} \\

\text{Var}(\hat{\lambda}_{MLE})
&= \frac{\hat{\lambda}_{MLE}}{n}
= \frac{\bar{y}}{n}

\end{align*}$$

so $\hat{\lambda}_{MLE} \dot\sim N\!\left(\lambda, \frac{\bar{y}}{n}\right)$.

### (b) Wald test statistic and rejection region for this test.
We use the sampling distribution above to construct the Wald test.

Let Wald test statistic be
$$W = \frac{\hat{\lambda}_{MLE} - \lambda^*}{SE(\hat{\lambda}_{MLE})}$$
where $SE(\hat{\lambda}_{MLE}) = \sqrt{\frac{\bar{y}}{n}}$.

So for testing $H_0: \lambda = \lambda^*$ vs $H_a: \lambda \neq \lambda^*$, the rejection region at significance level $\alpha$ is
$$|W| > z_{\alpha/2}$$
where $z_{\alpha/2}$ is the critical value from the standard normal distribution.
Or, we fail to reject $H_0$ if $-z_{\alpha/2} \leq W \leq z_{\alpha/2}$.

### (c) Likelihood ratio test statistic and rejection region for this test.
Let LRT statistic be 
$$LR = -2 \left( \ell(\lambda^*) - \ell(\hat{\lambda}_{MLE}) \right) \dot\sim \chi^2_{1}$$
and $p-val= P(T > LR)$, 
where $T \sim \chi^2_1$ under $H_0$. So the rejection region at significance level $\alpha$ is 
$$LR > \chi^2_{1, 1-\alpha}$$

### (d) $n=200$, $\bar{y}=5$, $\lambda^*=4$ at $\alpha=0.05$.
**Wald test:** $\alpha/2 = 0.025$, $\hat{\lambda}_{MLE}= \bar{y} = 5$.

$$
\begin{align*}

SE(\hat{\lambda}_{MLE}) = \sqrt{\frac{\bar{y}}{n}} &= \sqrt{\frac{5}{200}} = 0.15811 \\
W = \frac{\hat{\lambda}_{MLE} - \lambda^*}{SE(\hat{\lambda}_{MLE})}&= \frac{5 - 4}{0.15811} = 6.324555 \\
z_{\alpha/2} &= z_{0.025} = 1.96

\end{align*}$$

We reject $H_0$ since $|W| > z_{\alpha/2}$, $-1.96 < 1.96 < 6.3246$. Thus the true $\lambda$ differs from our assumption of 4.

**LRT test:** 
$$\begin{align*}
\ell(4)&=-200(4) + 1000\ln4 - \sum \ln(y_i!) = -800 + 1000\ln4 - C = 586.2944 - C \\
\ell(5) &= -200(5) + 1000\ln5 - \sum \ln(y_i!) = -1000 + 1000\ln5 - C = 609.4379 - C
\end{align*}$$

$$\begin{align*}
LR &= -2 \left( \ell(\lambda^*) - \ell(\hat{\lambda}_{MLE}) \right)  \dot\sim \chi^2_{1} \\
LR &= -2 \left( \ell(4) - \ell(5) \right) = -2 (586.2944 - C - (609.4379 - C))= 46.287\\
\chi^2_{1, 1-0.05}&=\chi^2_{1, 0.95} = 3.841
\end{align*}$$

We reject $H_0$ since $LR > \chi^2_{1, 1-\alpha}$, $46.287 > 3.841$.