## Problem Set 01: Data Structures

#### Exercise 1 ####

# Consider this hypothetical Fall 2023 course schedule for Ava Lugg, a student here at Smith College

# +-------------+------------------+---------+---------------+
# | Course Name | Meeting Schedule | Credits | S/U Eligible? |
# +=============+==================+=========+===============+
# | SDS 100     | Tu 2:45pm        | 1       | Yes           |
# +-------------+------------------+---------+---------------+
# | SDS 220     | M 3:05 pm,       | 4       | No            |
# |             | WF 2:45 pm       |         |               |
# +-------------+------------------+---------+---------------+
# | MTH 111     | WMF 9:25 am      | 4       | No            |
# +-------------+------------------+---------+---------------+
# | GOV 207     | TuTh 9:25 am     | 4       | Yes           |
# +-------------+------------------+---------+---------------+

# Represent this course schedule as an object in R, being sure to use using the most appropriate
# types and data structures possible.

# Be sure to pay special attention to representing the course meeting schedules, as some courses
# have more than 1 meeting time.

list(
  course = c("SDS 100", "SDS 220", "MTH 111", "GOV 207"),
  schedule = c("Tu 2:45 pm", "M 3:05 pm, WF 2:45 pm",  "WMF 9:25 am", "TuTh 9:25 am"),
  credits = c(1, 4, 4, 4),
  SU_eligible = c(TRUE, FALSE, FALSE, TRUE)
)

#### Exercise 2 ####

# For each command below, predict what type of vector you think will be returned. Then, check your
# intuitions by running each command in the R console. Were you right? And, can you explain the
# reasons for the results you got?

# 1. c(TRUE, 8)
# 2. c("TRUE", FALSE)
# 3. c(F, F, F, T)
# 4. c(4, "4", factor("Four"))
# 5. c(list("Ten"), 20)

# 1. I expect to get a logical
typeof(c(TRUE, 8))
# But I got a double. This makes sense in retrospect because R cannot represent a logical value and
# a numeric value in the same atomic vector, so R finds "common ground" between the two data types
# by converting the logical TRUE into the numeric 1

# 2. I expect to get a character vector, because the first value is a character
typeof(c("TRUE", FALSE))
# Yes, I got a character. R cannot represent a character value and a logical value in the same
# atomic vector, so R "compromises"and converts the logical FALSE into the character "FALSE"

# 3. I expect to get a character vector because the values are all letters
typeof(c(F, F, F, T))
# But I got a logical and I don't know why

# 4. I expect to get a character vector, because it contains the word "Four"
typeof(c(4, "4", factor("Four")))
# Yes, I got a character vector.

# 5. I expect to get a character vector, because it contains the word "Ten"
typeof(c(list("Ten"), 20))
# I was wrong, I got a list. I seems that if one object inside the `c()` function is a list, it will
# return a list.

#### Exercise 3 ####

# Can this list be transformed in a data frame object using `as.data.frame()`?

# List of 3
#  $ x: int [1:4] 9 4 7 1
#  $ y: chr [1:5] "b" "w" "k" "n" ...
#  $ z: logi [1:8] TRUE TRUE TRUE TRUE TRUE FALSE ...

# Give a detailed explanation of why or why not.

# This list cannot become a data frame because the three elements of the list each have different
# lengths. To make a data frame, all the elements must have a common length.
