# Schedule representation class

from numpy import *
from numpy.random import *

class schedule:

    def __init__(self,exams):
        self.data = random_integers(1,exams,exams)
        print 'new schedule: ', self.data

    def mutate(self,Pm):
        print 'mutating:', Pm

    def evaluate(self):
        print 'evaluating'

