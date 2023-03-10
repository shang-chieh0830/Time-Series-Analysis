# Time Series Basics-Estimation and Inference for measures of dependence

$\mu, \gamma(h),\rho(h)$ are usually unknown so we need to estimate them. To estimate these quantities, we need to assume the time series is weakly stationary.  

## Sample mean function

By the weakly stationary assumption, $E(x_1) = \mu, E(x_2) = \mu,…, E(x_n) = \mu$. Thus, a logical estimate of $\mu$ is$$\bar{X}=\frac{1}{n}\sum_{t=1}^{n}X_t$$ 
Note that this would not make sense to do if the weakly stationarity assumption did not hold!

## Sample autocovariance function

Again with the weakly stationarity assumption, we only need to worry about the lag difference. The estimated autocovariance function is: $$\hat{\gamma}(h)=\frac{1}{n}\sum_{t=1}^{n-h}(X_{t+h}-\bar{X})(X_t-\bar{X})$$

- $\hat{\gamma}(h)=\hat{\gamma}(-h)$
- What is this quantity if h = 0? 
- What is this quantity if h =1?
- This is similar to the formula often used to estimate the covariance between two random variables x and y:$\hat{Cov}(X,Y)=\frac{1}{n}\sum_{i=1}^{n}(X_i-\bar{X})(Y_i-\bar{Y})$.
- The sum goes up to n - h to avoid having negative subscripts in the x’s.
- This is NOT an unbiased estimate of $\gamma(h)$! However, as n gets larger, the bias will go to 0. 

## Sample autocorrelation function (ACF)

$$\hat{\rho}(h)=\frac{\hat{\gamma}(h)}{\hat{\gamma}(0)}$$

Question: What does $\rho(h) = 0$ mean and why would this be important to detect?  

Because this is important, we conduct hypothesis tests for $\rho(h)$ for all h $\ne$ 0! To do the hypothesis test, we need to find the sampling distribution for \hat{\rho}(h) under the null hypothesis of $\rho(h)$ = 0.  
