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

#### Exercise 2 ####

# For each command below, predict what type of vector you think will be returned. Then, check your  
# intuitions by running each command in the R console. Were you right? And, can you explain the
# reasons for the results you got?

# 1. c(TRUE, 8)
# 2. c("TRUE", FALSE)
# 3. c(F, F, F, T)
# 4. c(4, "4", factor("Four"))
# 5. c(list("Ten"), 20)

#### Exercise 3 ####

# Can this list be transformed in a data frame object using `as.data.frame()`?

# List of 3
#  $ x: int [1:4] 9 4 7 1
#  $ y: chr [1:5] "b" "w" "k" "n" ...
#  $ z: logi [1:8] TRUE TRUE TRUE TRUE TRUE FALSE ...

# Give a detailed explanation of why or why not.
