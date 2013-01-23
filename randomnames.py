# A library containing methods to generate random names.

from random import choice

def _to_list(filename):
    names = []
    with open(filename, 'r') as f:
        for line in f:
            names.append(line.rstrip())
    return names
    
male_names = _to_list('malenames')
female_names = _to_list('femalenames')
surnames = _to_list('surnames')

def random_female_name():
    return '%s %s' % (choice(female_names), choice(surnames))

def random_male_name():
    return '%s %s' % (choice(male_names), choice(surnames))

with open('peeps', 'r') as f:
    female = True
    for line in f:
      print('%s\t%s' % (line.rstrip(), random_female_name() if female else random_male_name()))
      female = not female

