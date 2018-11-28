# Pollution, Weather, and Mortality
# Page 304

# model fitting
library(vars)
x = cbind(cmort, tempr, part)
summary(VAR(x, p=1, type='both'))
VARselect(x, lag.max=10, type="both")
summary(fit <- VAR(x, p=2, type="both")) # partial results displayed

# residuals
acf(resid(fit), 52)
serial.test(fit, lags.pt=12, type="PT.adjusted")

# forecast
(fit.pr = predict(fit, n.ahead = 24, ci = 0.95)) # 4 weeks ahead
fanchart(fit.pr) # plot prediction + error
