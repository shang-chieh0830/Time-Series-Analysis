# Time Series Basics-Dependence

We would like to understand the relationship among all random variables in a time series. In order to do that, we would need to look at the joint distribution function.  

Suppose the time series consists of the random variables  . The cumulative joint distribution function for these random variables is: 

$$ F(c_1, c_2, …, c_n) = P(X_1\leq{c_1},X_2\leq{c_2},...,X_n\leq{c_n}) $$
 
This can be VERY difficult to examine over the MULTIDIMENSIONS. 

The one-dimensional cumulative distributional function is denoted by $ F_t(x) = P(X_t\leq{x}) $for a random variable $X_t$ at time t. The corresponding probability distribution function is $f_t(x)=\frac{\partial{F_t(x)}}{\partial{x}}$

The mean value function is $\mu_t=E(X_t)=\int{xf_t(x)dx}$

Important: The interpretation of $\mu_t$ is that it represents the mean taken over ALL possible events that could have produced $x_t$. Another way to think about it is suppose that $x_1,\dots,x_n$ is observed an infinite number of times. Then $\mu_1$ represents the average value at time 1, $\mu_2$ represents the average value at time 2, …


:::{.example }

**Moving Average**

Let $m_t=\frac{(w_t+w_{t-1}+w_{t-2})}{3}$, where $w_t\sim\mathrm{i.i.d.}N(0,1)\forall t=1,...,n$


Then $\mu_t=E(m_t)=E[\frac{(w_t+w_{t-1}+w_{t-2})}{3}]=\frac{1}{3}[E(w_t)+E(w_{t-1})+E(w_{t-2})]=0$

:::


:::{.example }

**Autoregressions**

Let $x_t = 0.7x_{t-1} + w_t, w_t \sim \mathrm{i.i.d.} N(0,1) ,\forall t = 1, …, n$



Then $\mu_t=E(x_t)=E[0.7x_{t-1} + w_t]=0.7E(x_{t-1})+E(w_t)=0.7E(0.7x_{t-2}+w_{t-1})+0=...=0$

:::

**Autocovariance function**

To assess the dependence between two random variables, we need to examine the two-dimensional cumulative distribution function. This can be denoted as $F(c_s, c_t) = P(X_s \le c_s, X_t \le c_t) $for two different time points s and t.  

In another course, you learned about the covariance function which measures the linear dependence between two random variables:For two random variables X and Y, the covariance between them is 

$$Cov(X,Y) = E[(X – \mu_x)(Y – \mu_y)] = E(XY) – \mu_x\mu_y,  

\mu_x = E(X) , \mu_y = E(Y)$$

Because we are interested in linear dependence between two random variables in the same time series, we will examine the autocovariance function: 

$$\gamma (s,t) 	= Cov(X_s, X_t)
= E[(X_s – \mu_s)(X_t – \mu_t)]=
\int\int(x_s-\mu_s)(x_t-\mu_t)f(x_s,x_t)dx_sdx_t ,\forall s, t $$ 
 

where$f(X_s,X_t)=\frac{\partial{F(X_s,X_t)}}{\partial{X_s}\partial{X_t}}$and assuming continuous random variables 

- If the autocovariance is 0, there is no linear dependence.     
- If s = t, the autocovariance is the variance:  
$\gamma (t,t) = E[(X_t-\mu_t)^2]$

:::{.example }
**White Noise**

Suppose $w_t \sim ind. N(0,\sigma^2_w ), t=1,…,n.$

if $ s=t, \gamma(s,t)=$
if $ s\ne t, \gamma(s,t)=$

$$\begin{cases}
  \gamma(s,t)=  & \text{if } s=t \\
  \gamma(s,t)=  & \text{if } s\ne t
\end{cases}$$
:::

:::{.example }

**Moving Average**

Let $m_t=\frac{w_t+w_{t-1}+w_{t-2}}{3}, w_t \sim ind. N(0,1 ), t=1,…,n$

$\gamma (s,t)=E[(m_s-\mu_s)(m_t-\mu_t)]=E[m_sm_t]$ b/c $\mu_s=\mu_t=0$

Then $E[m_sm_t]=E[\frac{w_s+w_{s-1}+w_{s-2}}{3}\frac{w_t+w_{t-1}+w_{t-2}}{3}]=\frac{1}{9}E[(w_s+w_{s-1}+w_{s-2})(w_t+w_{t-1}+w_{t-2})]$

To find this, we need to examine a few different cases:

- s = t 

$$E[m_tm_t] = E[m^2_t] = Var(m_t) + [E(m_t)]^2 
= \frac{1}{9}Var(w_t + w_{t-1} + w_{t-2}) + 0\\= \frac{1}{9}{Var(w_t) + Var(w_{t-1}) + Var(w_{t-2})} = \frac{1}{9}(1+1+1) = 3/9$$

- s = t - 1

$$E[m_{t-1}m_t] =\frac{1}{9}E[(w_{t-1} + w_{t-2} + w_{t-3})(w_t + w_{t-1} + w_{t-2})]\\

= \frac{1}{9}[E(w_{t-1})E(w_t) + E(w^2_{t-1}) + E(w_{t-1})E(w_{t-2}) \\
+ E(w_{t-2})E(w_t) + E(w_{t-2})E(w_{t-1}) + E(w^2_{t-2}) \\
+ E(w_{t-3})E(w_t) + E(w_{t-3})E(w_{t-1}) + E(w_{t-3})E(w_{t-2})]\\

=\frac{1}{9}[0 + 1 + 0 + 0 + 0 + 1 + 0  + 0  + 0]=2/9$$
$E(w^2_{t-1}) = 1$, because $Var(w_{t-1}) = 1$



- s = t - 2

$$E[m_{t-2}m_t] = \frac{1}{9}E[(w_{t-2} + w_{t-3} + w_{t-4})(w_t + w_{t-1} + w_{t-2})]\\

= \frac{1}{9}[E(w_{t-2}w_t) + E(w_{t-2}w_{t-1}) + E(w_{t-2}w_{t-2}) +\\ E(w_{t-3}w_t) + E(w_{t-3}w_{t-1}) + E(w_{t-3}w_{t-2})\\ + E(w_{t-4}w_t) 
+ E(w_{t-4}w_{t-1}) + E(w_{t-4}w_{t-2})]\\

=\frac{1}{9}[0 + 0 + 0 + 1 + 0 + 0  + 0  + 0 + 0]

=\frac{1}{9}$$

- s = t – 3


$$ E[m_{t-3}m_t] = \frac{1}{9}E[(w_{t-3} + w_{t-4} + w_{t-5})(w_t + w_{t-1} + w_{t-2})]\\

= \frac{1}{9}E[w_{t-3}w_t + w_{t-3}w_{t-1} + w_{t-3}w_{t-2} + w_{t-4}w_t + w_{t-4}w_{t-1} \\
+ w_{t-4}w_{t-2} + w_{t-5}w_t + w_{t-5}w_{t-1} + w_{t-5}w_{t-2}]\\

= \frac{1}{9}E[0+ 0 + 0 + 0 + 0 + 0  + 0 + 0 + 0]= 0 $$




:::


Notice that s = t + 1, t + 2, … can be found in a similar manner. Also s = t - 4, t - 5,… can be found. In summary, the autocovariance function is$$\begin{cases}
  \gamma(s,t)= \frac{3}{9} & \text{if } s=t \\
  \gamma(s,t)= \frac{2}{9} & \text{if } |s-t|=1\\
  \gamma(s,t)= \frac{1}{9} & \text{if } |s-t|=2\\
  \gamma(s,t)= 0 & \text{if } |s-t|\ge 3\\
\end{cases}$$

Notes: 
- The word “lag” is used to denote the time separation between two values. For example, |s - t| = 1 denotes the lag is 1 and |s - t| = 2 denotes the lag is 2. We will use this “lag” terminology throughout this course.

- The autocovariance depends on the lag, but NOT individual times for the moving average example! This will be VERY, VERY important later!

**Autocorrelation function (ACF)**

In another course, the Pearson correlation coefficient was defined to be: 

$$\rho=\frac{Cov(X,Y)}{\sqrt{Var(X)Var(Y)}}$$

The reason the correlation coefficient is examined instead of the covariance is that it is always between –1 and 1. 

Note the following:
-  close to 1 means strong, positive linear dependence
-  close to –1 means strong, negative linear dependence
-  close to 0 means weak linear dependence.  


The autocorrelation is the extension of the Pearson correlation coefficient to time series analysis. The autocorrelation function (ACF) is
$$\rho(s,t)=\frac{\gamma (s,t)}{\sqrt{\gamma (s,s)\gamma (t,t)}}$$

where s and t denote two time points. The ACF is also between –1 and 1 and has a similar interpretation as for correlation coefficient.  

Notice that $\gamma (t,t)$ is the variance at time t. 


