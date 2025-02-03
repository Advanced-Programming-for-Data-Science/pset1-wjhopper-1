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

#### Instructor Solution ####

schedule <- data.frame(
  course = c("SDS 100", "SDS 220", "MTH 111", "GOV 207"),
  schedule = I(list("Tu 2:45 pm", c("M 3:05 pm, WF 2:45 pm"),  "WMF 9:25 am", "TuTh 9:25 am"))
schedule

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

#### Instructor Solution ####

# 1.
x <- c(TRUE, 8)
print(x)
typeof(x)
# The object R produces is a double vector. This is because R cannot represent two different data
# types (logical and double) in an atomic vector, so it will "coerce" (i.e., convert) some of the
# elements into other data types, until all it finds a common data type for all objects.

# In this coercion process, R will prefer coercing more specific data types to more general ones.
# In this case, logical is a more specific data type than double, so it coerces the logical TRUE
# into an analogous representation in the double type. A logical TRUE is analogous to a 1 in binary,
# so the TRUE is coerced to the value 1.

# 2.
x <- c("TRUE", FALSE)
print(x)
typeof(x)
# The object R produces is a character vector. As explained in part 1, this is because R cannot
# represent two different data in an atomic vector, so it will coerce some of the  elements into 
# other data types. In this case, it coerces the element with the more specific data type (the 
# logical FALSE) into an analogous representation in the character type (the character string
# "FALSE").

# 3.
x <- c(F, F, F, T)
print(x)
typeof(x)
# R produces a logical vector in this case because by default, T and F can be used as abbreviations
# for TRUE and FALSE.

# 4.
x <- c(4, "4", factor("Four"))
print(x)
typeof(x)
# Despite having three different types of atomic objects as input (a double, a character, and a
# factor object, which is "secretly" an integer), R returns a character vector.

# As explained in part 1, this is because R cannot represent multiple different data types in an
# atomic vector, so it will coerce some of the  elements into
# other data types. In this case, R coerces 4 and factor("Four") into character. 

# If that is a confusing outcome, think about it this way: A number can always becomes a word (i.e.,
# 4 can always become "4") but not all words can become numbers (how do you turn the word "Chicken"
# into a number?). Thus, R considers the character data type the "lowest common denominator" between
# data types.

# However, this does not explain why factor("Four") becomes a "1" in the output. This is because
# factor objects are a class of object built on top of integer vectors. Factor objects are created
# by assigning integer values (starting at 1) to represent each unique value in the input. In this
# case, there is only one unique value in the input (the character string "Four"), so it is
# represented with the integer 1. Later, when this factor object is concatenated with the other
# inputs to the c() function, this integer 1 is coerced into the character "1", in order to have a
# compatible type with the other objects.

# 5.
x <- c(list("Ten"), 20)
print(x)
typeof(x)
# Interestingly, R produces a list object with two elements. This reveals a piece of information
# that is not widely known: the c() function is not just for creating atomic vectors (even though is
# it's most useful feature)

# A good way to think about the results is this: We get a list object as result because one of the
# inputs was a list object, and this makes R's job of combining inputs easy. You can always add
# another element onto the end of an existing list. So, R takes the list("Ten") object (which is
# list of length one) and adds a second element to it (a double vector holding the value 20),

#### Exercise 3 ####

# Can this list be transformed in a data frame object using `as.data.frame()`?

# List of 3
#  $ x: int [1:4] 9 4 7 1
#  $ y: chr [1:5] "b" "w" "k" "n" ...
#  $ z: logi [1:8] TRUE TRUE TRUE TRUE TRUE FALSE ...

# Give a detailed explanation of why or why not.

# This list cannot become a data frame because the three elements of the list each have different
# lengths. To make a data frame, all the elements must have a common length.
  
#### Instructor Solutions ####

# This list cannot become a data frame for two reasons. 

# The most important reason is that all the elements (i.e., columns) of a data frame must have a the same length. In this list, each element has a different length, so it cannot be converted into a data frame.

# There is one exception to the "Each element must have the same length for a list to become a data frame": If the length of the longest element is a multiple of the length of the other, shorter elements, then the shorter elements will be "recycled" (i.e., replicated) until their length matches that of the longest element.

# However, this list is not an example of this exception. The longest element, z, has a length of 8, and 8 is not a multiple of both 4 and 5. Thus, this list cannot be become a data frame.
