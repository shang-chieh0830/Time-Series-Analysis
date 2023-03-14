# Autoregressive Models

## AR Models

Suppose we have a time series $x_t$ for $t = 1, …, n.$ Could we use the regression model of 

$$x_t = \beta_0 + \beta_1t + \epsilon_t, $$

where $\epsilon_t \sim \mathrm{ind} N(0,\sigma^2)$ for it? Yes, but stated confidence levels and type I error rates will likely be incorrect. Thus, inferences can be incorrect. The reason is the likely dependence in the time series. 

While one may be able to find a set of explanatory variables that help to de-trend a response variable series so it appears that white noise is leftover (i.e., it looks like the error terms are independent), this is often not possible.

Instead, _autoregressive integrated moving average models (ARIMA)_ are used for time series data. These models were first developed by Box and Jenkins (1970). We have already touched on all parts of this type of model:

- AR: Autoregressive
- MA: Moving average
- I: Integrated (closely related to differencing)

Often, people will refer to ARIMA models as an ARIMA process as well. This refers to how $x_t$ comes about through a linear process. Both “model” and “process” will be used interchangeably.  


## Autoregressive models – AR(p)

An autoregressive model uses past observations of $x_t$ to predict future observations. Specifically, the present value of $x_t$ is explained by a linear function of p past values of $x_{t-1}, …, x_{t-p}.$


:::{.example}

**AR(1) from earlier**

$x_t=0.7x_{t-1}+w_t$, where $w_t \sim \mathrm{ind}N(0,1)\forall t=1,...,n$

Therefore, $x_2=0.7x_1+w_2$, $x_3=0.7x_2+w_3,...$

Future values may be “forecasted” by past values using 

$x_{n+1} = 0.7x_n$

More on this later in the section. 

:::

An autoregressive model of order p, denoted as AR(p), is 

$x_t = \phi_1x_{t-1} + \phi_2x_{t-2} + … + \phi_px_{t-p} + w_t$

where

$\phi_1, \phi_2, …, \phi_p$ are parameters and 
$w_t \sim \mathrm{ind}N(0,\sigma^2_w)\forall t=1,...,n$ (i.e., white noise)


Notes:

-	To find parameter estimates later in this section, we will assume $w_t \sim \mathrm{ind}N(0,\sigma^2_w)$
- WLOG, the mean of $x_t, \mu,$ will be assumed to be 0 when we write out a general model. HOWEVER, $\mu\ne$0 in most applications! The WLOG part is here because one can simply replace $x_t$ with $x_t – \mu$. The end result is an autoregressive model of 

$$x_t - \mu = \phi_1(x_{t-1}-\mu) + \phi_2(x_{t-2}-\mu) + … + \phi_p(x_{t-p}-\mu) + w_t \\
\iff x_t = \mu(1-\phi_1-\phi_2-…-\phi_p) + \phi_1x_{t-1} + \phi_2x_{t-2}+ … + \phi_px_{t-p} + w_t\\
\iff x_t = \alpha + \phi_1x_{t-1} + \phi_2x_{t-2}+ … + \phi_px_{t-p} + w_t$$

where $\alpha = \mu(1-\phi_1-\phi_2-…-\phi_p).$ The $\alpha$ does not affect the dependence structure among the $x_t$. This is why the common convention is to exclude the parameter when introducing these models.  

**When we estimate the model, we will almost always include an estimate of $\alpha.$** 

- The AR(p) model written in vector form is 

$x_t = \boldsymbol{\phi'x_{t-1}} + w_t$

where

$\boldsymbol{\phi} = (\phi_1, \phi_2, …, \phi_p)'$

$\boldsymbol{x_{t-1}} = (x_{t-1}, x_{t-2}, …, x_{t-p})'$

- The AR(p) model written in backshift notation is 

$(1-\phi_1B-\phi_2B^2-…-\phi_pB^p)x_t = w_t$

and $\phi(B)x_t = w_t$

where $\phi(B) = (1-\phi_1B-\phi_2B^2-…-\phi_pB^p)$ is called the autoregressive operator. We will be using this notation throughout the course. 

- The model can be re-expressed as a linear combination of $w_t$'s by “iterating backwards”. For example, an AR(1) model can be represented as:

$$x_t=\phi x_{t-1}+w_t\\
=\phi(\phi x_{t-2}+w_{t-1})+w_t\\
=\phi^2x_{t-2}+\phi w_{t-1}+w_t\\
=\phi^2(\phi w_{t-3}+w{t-2})+\phi w_{t-1}+w_t\\
=\phi^3x_{t-3}+\phi^2w_{t-2}+\phi w_{t-1}+w_t\\
=\dots\\
=\sum_{j=0}^{\infty}\phi^jw_{t-j}$$,

provided that $|\phi|<1$ and variance of $x_t$ is bounded.

To see this, note that the model can be rewritten as 

$$(1-\phi B)x_t = w_t \\
\implies x_t=\frac{1}{1-\phi B}w_t\\
\implies x_t = (1+\phi B+\phi^2B^2+…)w_t \\
=\sum_{j=0}^{\infty}\phi^jB^jw_t\\
=\sum_{j=0}^{\infty}\phi^jw_{t-j}$$

using the sum of an infinite series. Remember that $\sum_{i=0}^{\infty}a^i=\frac{1}{1-a},|a|<1$ . Writing the model as a linear combination of the $w_t$’s is going to be VERY useful for future work!

- The mean and autocovariance function for an AR(1) stationary model can be found easily by using the above representation.  


$$E(x_t)=E(\sum_{j=0}^{\infty}\phi^jw_{t-j})\\
=\sum_{j=0}^{\infty}\phi^jE(w_{t-j})=0$$

$$\gamma(h)=Cov(x_t,x_{t+h})\\
=E(x_tx_{t+h})-E(x_tE(x_{t+h}))\\
=E(x_tx_{t+h})-0=E(x_tx_{t+h})$$, assuming $\mu=0$

Then $$\gamma(h)=\\
E[(\sum_{j=0}^{\infty}\phi^jw_{t-j})(\sum_{k=0}^{\infty}\phi^kw_{t+h-k})]\\=E[(w_t+\phi w_{t-1}+\phi^2w_{t-2}+...)(w_{t+h}+\phi w_{t+h-1}+\phi^2 w_{t+h-2}+...)]$$

if h=0, $$\gamma(0)=E[(w_t+\phi w_{t-1}+\phi^2w_{t-2}+...)^2]\\
=Var(\sum_{j=0}^{\infty}\phi^jw_{t-j})+[E(\sum_{j=0}^{\infty}\phi^jw_{t-j})]^2\\
=\sum_{j=0}^{\infty}\phi^{2j}Var(w_{t-j})+0\\
=\sigma_w^2\sum_{j=0}^{\infty}\phi^{2j}\\
=\sigma_w^2\frac{1}{1-\phi^2}$$

I used these general results that are taught in a mathematical statistics course: 

- $E(Y_1^2) = Var(Y_1) + E(Y_1)^2$
- $Var(a_1Y_1 + a_2Y_2) = a_1^2Var(Y_1)+a_2^2Var(Y_2)$
for independent random variables Y1 and Y2 and constants a1 and a2.


if h=1, $$\gamma(1)=E[(w_t+\phi w_{t-1}+\phi^2w_{t-2}+...)(w_{t+1}+\phi w_{t}+\phi^2w_{t-1}+...)]\\
=E[w_{t+1}(w_t+\phi w_{t-1}+\phi^2w_{t-2}+...)]+
E[\phi(w_t+\phi w_{t-1}+\phi^2w_{t-2}+...)]\\
=E[w_{t+1}]E[w_t+\phi w_{t-1}+\phi^2w_{t-2}+...]+\phi \frac{\sigma^2_w}{1-\phi^2}\\
=0+\phi \frac{\sigma^2_w}{1-\phi^2}=\phi \frac{\sigma^2_w}{1-\phi^2}$$

I used $w_{t+1}$ being independent of all of the w’s in $E[w_t+\phi w_{t-1}+\phi^2w_{t-2}+...]$ in the above result.

In general, for h$\ge$0, $\gamma(h)=\frac{\phi^h\sigma^2_w}{1-\phi^2}$

Also, the ACF is $\rho(h) = \frac{\gamma(h)}{\gamma(0)} = \phi^h$.  

One can also go back to in the notes and use the results of a linear process there. Below is part of this page restated,

In general, a linear process can be defined as 

$$x_t=\mu+\sum_{j=-\infty}^{\infty}\psi_jw_{t-j}$$ with $$\sum_{j=-\infty}^{\infty}|\psi_j|<\infty$$ and $$w_t\sim\mathrm{ind.}N(0,\sigma_w^2)$$
It can be shown that $\gamma(h)=\sigma_w^2\sum_{j=-\infty}^{\infty} \psi_{j+h}\psi_j$ for h $\ge$ 0.  

In our case, we have $\psi_0 = 1, \psi_1 = \phi, \psi_2 = \phi^2, \psi_3 = \phi^3, … .$  Therefore, $x_t=\mu+\sum_{j=-\infty}^{\infty}\psi_jw_{t-j}=0+\sum_{j=0}^{\infty}\phi^jB^jw_t.$ This results in $$\gamma(h)=\sigma^2_w\sum_{j=-\infty}^{\infty}\psi_{j+h}\psi_j\\
=\sigma^2_w\sum_{j=0}^{\infty}\psi_{j+h}\psi_j\\
=\sigma^2_w\sum_{j=0}^{\infty}\phi^{j+h}\phi^j\\
=\sigma^2_w\sum_{j=0}^{\infty}\phi^{2j+h}\\
=\sigma^2_w\phi^h\sum_{j=0}^{\infty}\phi^{2j}\\
=\sigma^2_w\phi^h\frac{1}{1-\phi^2}$$

Question: What if $\mu\ne$ 0? How would this change $E(x_t)$ and $\gamma(h)$?


:::{.example}

**AR(1)with $\phi$ = 0.7 and $\phi$ =- 0.7**

:::
