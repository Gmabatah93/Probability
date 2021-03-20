# Laws of Probability ----
# Product Rule
A <- rbinom(10000,1,.4)
B <- rbinom(10000,1,.2)
mean(A&B)

# Sum Rule
C <- rbinom(10000,1,.6)
D <- rbinom(10000,1,.1)
mean(C|D)

## PROBABILITY: Distributions ----

# BERNOULLI
# - Simulate 10 coin Flips, each 30% chance of coming up heads
rbinom(n = 10, size = 1, prob = 0.30)
# - Simulate 10 Basketball shots with 50% avg
rbinom(n = 10, size = 1, prob = 0.50)

# BINOMIAL
# - Simulate 100 seperate occurences of flipping 10 coins. 30% chance of heads
rbinom(n = 100, size = 10, prob = 0.50)
# -- P(getting 6 Tails)
dbinom(x = 6, size = 10, prob = 0.50)
# -- P(getting 7 or Less Tails)
pbinom(q = 7, size = 10, prob = 0.50)
# -- P(getting 5 or more Tails)
pbinom(q = 4, size = 10, prob = 0.50, lower.tail = FALSE)

# - What is the expected value and variance of a binomial distribution where 25 coins are flipped, each having 30% chance of heads
mean(rbinom(n = 1000, size = 25, prob = 0.30))
var(rbinom(n = 1000, size = 25, prob = 0.30))
