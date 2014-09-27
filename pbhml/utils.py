__author__ = 'bbowman@pacificbiosciences.com'

def sorted_set(a_list):
    return sorted(list(set(a_list)))

def sample_from_file(filename):
    return filename.split('/')[-1].split('.')[0]