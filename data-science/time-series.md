# [Zillow, Prophet, Time Series, & Prices – r y x, r](https://ryxcommar.com/2021/11/06/zillow-prophet-time-series-and-prices/)

Here is my latest, nuanced opinion on Prophet after looking into it more for this post: it’s a nifty tool if you know what you’re doing or are doing something unimportant, and it is possibly very dangerous if you don’t know what you’re doing and are using it to make an actual decision.

`f(t)` means function of time. But time series processes aren’t only functions of time. Or only of contemporaneous covariates. They’re also functions of lagged values, including lagged values of the variable you’re regressing on. So to say that a time series is `f(t)` is to specifically say that it’s not a function of other things, namely previous data points, such as the previous dependent variable value.

This is an accurate description of what Prophet’s model is. To get a little more in the weeds, Prophet does the following linear decomposition:

- `g(t)`: Logistic or linear growth trend with optional linear splines (linear in the exponent for the logistic growth). The library calls the knots “change points.”
- `s(t)`: Sine and cosine (i.e. Fourier series) for seasonal terms.
- `h(t)`: Gaussian functions (bell curves) for holiday effects (instead of dummies, to make the effect smoother).

So the main caveat of Prophet is that it’s does “curve fitting.” This is fine for problems like web traffic forecasts, and some other crude forms of anomaly detection where the actionable decision is something minor like “send a notification to my Slack channel.” But why’s Prophet so bad for Zillow, exactly?

So to summarize, the problem with Prophet here is that it doesn’t model prices as a function of previous values, which is a very wrong way to think about how prices work. It’s that simple.

You can predict your way out of that problem and try to reduce the residuals, which is the natural data science thing to do, but that’s not a smart way to do risk management. 

Unfortunately for Zillow’s shareholders, risk management is often going to be a blind spot when you hire a bunch of data scientists without finance sector experience.

# [Forecasting with (un)certainty - The Causal Blog](https://www.causal.app/blog/forecasting-with-uncertainty)

1. Average assumptions don't lead to average outcomes

2. Extreme assumptions can lead to more extreme outcomes
