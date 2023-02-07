import random
import string
# https://www.educative.io/answers/how-to-generate-a-random-string-in-python

# # printing lowercase
# letters = string.ascii_lowercase
# print ( ''.join(random.choice(letters) for i in range(10)) )

# # printing uppercase
# letters = string.ascii_uppercase
# print ( ''.join(random.choice(letters) for i in range(10)) )

# # printing letters
# letters = string.ascii_letters
# print ( ''.join(random.choice(letters) for i in range(10)) )

# # printing digits
# letters = string.digits
# print ( ''.join(random.choice(letters) for i in range(10)) )

# # printing punctuation
# letters = string.punctuation
# print ( ''.join(random.choice(letters) for i in range(10)) )

letters = string.ascii_lowercase
letters += string.ascii_uppercase
letters += string.digits
letters += '!@#&*+-'
# letters += string.punctuation

print ( ''.join(random.choice(letters) for i in range(16)) )
