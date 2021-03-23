# PROBABILITY: Laws ----
 
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

## PROBABILITY: Puzzles ----

# FUNCTION: Simulate the rolling of dice and report the sum of the values that appears
set.seed(1)
# - function: roll k dice
roll_dice <- function(k) {
  all_rolls <- sample(x = c(1,2,3,4,5,6),
                      size = k,
                      replace = TRUE)
  final_answer <- sum(all_rolls)
  return(final_answer)
}
# - roll 5 dice
roll_dice(5)
# - loop for 10000 iterations
output <- rep(NA, 10000)
for (i in 1:10000) {
  output[i] <- roll_dice(2)
}

# BIRTHDAY PROBLEM: With a room with 50 people in it what is the probability that anyone shares the same birthday ?
set.seed(1)
n <- 50
match <- 0
# - simulate 10,000 rooms and check for matches in each room
for (i in 1:10000) {
  birthdays <- sample(x = 365,
                      size = n,
                      replace = TRUE)
  if (length(unique(birthdays)) < n) {
    match <- match + 1
  }
}
# - calculate the estimated probability of a match and print it
p_match <- match / 10000
# - birthday function
pbirthday(50)
# - plot
room_sizes <- 1:50
match_probs <- sapply(room_sizes, pbirthday)
plot(match_probs ~ room_sizes)

# MONTY HALL:
set.seed(1)
doors <- c(1,2,3)
# - randomly select one of the doors to have the prize
prize <- sample(x = doors, size = 1)
initial_choice <- 1
# - check if the initial choice equals the prize
if (initial_choice == prize) {
  print("The initial choice was correct!")
}
print(prize)
# - define counter
win_count <- 0
# - run 10000 iterations of the game
for (i in 1:10000) {
  prize <- sample(x = doors, size = 1)
  initial_choice <- 1
  if (initial_choice == prize) {
    win_count <- win_count + 1
  }
}
print(win_count / 10000)
# - reveal
reveal_door <- function(doors, prize, initial_choice) {
  if(prize == initial_choice) {
    reveal <- sample(x = doors[-prize], size = 1)
  } else {
    reveal <- doors[-c(prize, initial_choice)]
  }
}

# Contestant initially picks door #1, and then upon the goat reveal, they switch to the remaining door
initial_choice <- 1
# - reveal_door
reveal <- reveal_door(doors, prize, initial_choice)
# - switch to the remaining door
final_choice <- doors[-c(initial_choice, reveal)]
print(final_choice)
# - check whether the final choice equals the prize
if (final_choice == prize) {
  print("The final choice is correct!")
}
# - probability
win_count <- 0
for (i in 1:10000) {
  prize <- sample(doors,1)
  initial_choice <- 1
  reveal <- reveal_door(doors, prize, initial_choice)
  final_choice <- doors[-c(initial_choice, reveal)]
  if(final_choice == prize) {
    win_count <- win_count + 1
  }
}
print(win_count / 10000)

# YAHTZHEE

# QUADRATIC FORMULA
# - Function: evaluate whether any given quadratic is factorable or not. 
is_factorable <- function(a,b,c) {
  if(b^2 - 4*a*c < 0) {
    return(FALSE)
  } else {
    sqrt_discriminant <- sqrt(b^2 - 4*a*c)
    return(sqrt_discriminant == round(sqrt_discriminant))
  }
}
# - check
counter <- 0
for(a in 1:100){
  for(b in 1:100){
    for(c in 1:100){
      # Check whether factorable
      if(is_factorable(a,b,c)){
        counter <- counter + 1
      }
    }
  }
}
print(counter / 100^3)

# iPhone PASSCODES
# - suppose you pick up an iPhone with four smudge marks on it, at locations 3,4,5 and 9.
counter <- 0
passcode <- c(4,3,5,9)
values <- c(3,4,5,9)

for(i in 1:10000){
  # Create the guess
  guess <- sample(values)
  # Check condition 
  if(identical(passcode, guess)){
    counter <- counter + 1
  }
}
print(counter/10000)
# - passcode consist of three distint digits where one of the values is repeated
counter <- 0
passcode <- c(2,4,4,7)
unique_values <- c(2,4,7)

for(i in 1:10000){
  # Pick repeated value
  all_values <- c(unique_values, sample(unique_values, 1))
  # Make guess
  guess <- sample(all_values)
  if(identical(passcode, guess)){
    counter <- counter + 1
  }
}
print(counter / 10000)
#
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
