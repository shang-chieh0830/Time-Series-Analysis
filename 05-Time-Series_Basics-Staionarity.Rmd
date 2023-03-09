# Time Series Basics-Stationarity

Stationarity is a VERY important concept to understand because it allow us to construct time series models.  

:::{.definition }

**Strictly Stationary**

The probabilistic behavior of $X_{t_1},...,X_{t_k}$ is exactly the same as that of the shifted set $X_{t_{1+h}},...,X_{t_{k+h}}$  for ANY collection of time points t1,…, tk, for ANY k = 1, 2, …, and for ANY shift h = 0, $\pm$ 1, $\pm$ 2, … .

Let $c_1,…, c_k$ be constants. Then$$P(X_{t_1}\leq{c_1},...,X_{t_k}\leq{c_k})=P(X_{t_{1+h}}\leq{c_{1}},...,X_{t_{k+h}}\leq{c_k})$$ 

i.e., the probability distribution is INVARIANT to time shifts. 
:::

e.g. $P(X_1\leq{c_1}, X_2\leq{c_2})=P(X_{10}\leq{c_1}, X_{11}\leq{c_2})$

Requiring a time series to be strictly stationary is VERY restrictive! A less restrictive requirement is weakly stationary.  

:::{.definition }

**Weakly Stationary**

The first two moments (mean and covariance) of the time series are invariant to time shifts. $$E(X_t)=\mu, \forall t$$ and $$ \gamma(t,t+h)=\gamma(0,h), \forall t$$
:::


Notes:

- $\mu$ and $\gamma(0,h)$ are NOT functions of t.  
- h is the lag  
- $\gamma(t, t+h)$ = $\gamma(0,h)$ for ALL time t means that the autocovariance function ONLY depends on the number of lags of the time shift. Thus,$\gamma(0,h) = \gamma(1, h+1) = \gamma(2, 2+h) = \gamma(3, 3+h) = …$
- Because we will generally be dealing with a weakly stationary time series, we can make the following notational change: $\gamma(h)=\gamma(0,h)=\gamma(t, t+h).$  
- The variance of $X_t$ is $\gamma(0)$.
- The same notational change can be made to the autocorrelation function (ACF). Thus, $\rho(h)$ denotes the ACF at lag h. Note that$$\rho(h)=\rho(t,t+h)=\frac{\gamma(t,t+h)}{\sqrt{\gamma(t,t)}\sqrt{\gamma(t+h,t+h)}}=\frac{\gamma(h)}{\sqrt{\gamma(0)}\sqrt{\gamma(0)}}=\frac{\gamma(h)}{\gamma(0)}$$

- Strictly stationary implies weakly stationary, but the reverse is not necessarily true.  
- Frequently, we will just say “stationary” to refer to weakly stationary and say the full “strictly stationary” to refer to strictly stationary.

:::{.example }
**White Noise**
Suppose $w_t \sim ind. N(0,\sigma^2_w ), t=1,…,n.$ Is this a weakly stationary time series?  

:::


:::{.example }

**Moving Average**

Let $m_t=\frac{w_t+w_{t-1}+w_{t-2}}{3}, w_t \sim ind. N(0,1 ), t=1,…,n$

Previously, we found that $\mu_t=0, \forall t$ and 

$$\begin{cases}
  \gamma(s,t)= \frac{3}{9} & \text{if } s=t \\
  \gamma(s,t)= \frac{2}{9} & \text{if } |s-t|=1\\
  \gamma(s,t)= \frac{1}{9} & \text{if } |s-t|=2\\
  \gamma(s,t)= 0 & \text{if } |s-t|\ge 3\\
\end{cases}$$

Is the time series weakly stationary? Hint: let h=s-t. 

:::


Comments: 

- $\gamma(h) = \gamma(-h)$ for all h if the series is weakly stationary. This means that it does not matter which way the shift occurs.  
- Stationarity can also be examined when two time series are of interest. We will examine this in more detail later in the course.

In summary,  

- Both time series must have constant mean
- Both autocovariance functions must depend only on the lag difference
- The “cross-covariance” function, the extension of the autocovariance function for one time series to two time series, must depend only on the lag difference. The cross-covariance function is defined as 

$$\gamma_{xy}(h) = E[(x_{t+h} – \mu_x)(y_t – \mu_y)]$$

Note that $\gamma_{xy}(h)$  is not necessarily equal to $\gamma_{yx}(h)$  (usually will be different).

:::{.example }

Let $x_t = w_t + w_{t-1}$ and $y_t = w_t - w_{t-1}$, where $w_t \sim \mathrm{ind}N(0,\sigma^2_w )$ for t = 1, …, n

Claim: $x_t$ and $y_t$ are weakly stationary.

pf:

- $X_t$

$E(X_t)=E(w_t+w_{t-1})=E(w_t+w_{t-1})=0+0=0$


:::


## Linear Process

The previous examples are special cases of a “linear process”. In general, a linear process can be defined as 



