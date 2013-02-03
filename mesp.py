# Apply a genetic algorithm to a population of schedules using the schedule class

from schedule import *

population = input("Population size: ")
generations = input("Number of iterations to iterate through: ")

S = []
for i in range(population):
    S.append(schedule(10))

for i in range(generations):
    for j in range(population):
        S[j].mutate(10)
        S[j].evaluate()

