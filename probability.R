# Laws of Probability ----
 
# Product Rule 
A <- rbinom(10000,1,.4)
B <- rbinom(10000,1,.2)
mean(A&B)

# Sum Rule
C <- rbinom(10000,1,.6)
D <- rbinom(10000,1,.1)
mean(C|D)


# Bayesian 
#   - Flip 20, 11 came out Heads
fair <- rbinom(50000, 20, .5)
biased <- rbinom(50000, 20, .75)

fair_11 <- sum(fair == 11)
biased_11 <- sum(biased == 11)
fair_11 / (fair_11 + biased_11)

#   - Flip 20, 16 came out Heads
fair <- rbinom(50000, 20, .5)
biased <- rbinom(50000, 20, .75)

fair_16 <- sum(fair == 16)
biased_16 <- sum(biased == 16)
fair_16 / (fair_16 + biased_16)

#   - Flip 14/20 came out Heads. Fair(80%) 
fair_flips <- rbinom(8000,20,.5)
biased_flips <- rbinom(2000,20,.75)

fair_14 <- sum(fair_flips == 14)
biased_14 <- sum(fair_flips == 14)
fair_14 / (fair_14 + biased_14)

flips_fair <- rbinom(80000, 20, .5)
flips_high <- rbinom(10000, 20, .75)
flips_low <- rbinom(10000, 20, .25)

fair_14 <- sum(flips_fair == 14)
high_14 <- sum(flips_high == 14)
low_14 <- sum(flips_low == 14)
fair_14 / (fair_14 + low_14 + high_14)

probability_fair <- dbinom(11,20,.5)
probability_biased <- dbinom(11,20,.75)
probability_fair / (probability_fair + probability_biased)

dbinom(14, 20, .5) / (dbinom(14, 20, .5) + dbinom(14, 20, .75))
dbinom(18, 20, .5) / (dbinom(18, 20, .5) + dbinom(18, 20, .75))

probability_16_fair <- dbinom(16, 20, .5)
probability_16_biased <- dbinom(16, 20, .75)
(probability_16_fair * .99) / (probability_16_fair * .99 + probability_16_biased * .01)

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
