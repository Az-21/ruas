import numpy as np

# Dataset
data = np.array([57, 12, 34, 89, 21, 5, 96, 21, 68, 43])

# Mean
mean = np.mean(data)
print(f"Mean = {mean}")

# Median
median = np.median(data)
print(f"Median = {median}")

# Mode
mode = np.argmax(np.bincount(data))
print(f"Mode = {mode}")

# Minimum value
minimum = np.min(data)
print(f"Minimum value = {minimum}")

# Maximum value
maximum = np.max(data)
print(f"Maximum value = {maximum}")

# Range
data_range = maximum - minimum
print(f"Range = {data_range}")

# Count
count = len(data)
print(f"Number of values = {count}")

# Cumulative sum
cumulative_sum = np.sum(data)
print(f"Sum of all values = {cumulative_sum}")

# 25th percentile
percentile_25 = np.percentile(data, 25)
print(f"25th percentile = {percentile_25}")

# 75th percentile
percentile_75 = np.percentile(data, 75)
print(f"75th percentile = {percentile_75}")

# Interquartile range (IQR)
iqr = percentile_75 - percentile_25
print(f"Interquartile range (IQR) = {iqr}")

# Median absolute deviation (MAD)
mad = np.median(np.abs(data - median))
print(f"Median absolute deviation (MAD) = {mad}")
