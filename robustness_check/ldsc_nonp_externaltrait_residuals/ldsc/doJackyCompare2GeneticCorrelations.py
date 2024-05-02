#!/usr/bin/env python
import sys
import csv
import numpy as np
import scipy.stats

# delete values for first genetic covariance file
deletefilec1 = sys.argv[1]
# delete values for second genetic covariance file
deletefilec2 = sys.argv[2]
# delete values heritability trait 1 correlation 1
deletefileh1 = sys.argv[3]
# delete values heritability trait 2 correlation 1
deletefileh2 = sys.argv[4]
# delete values heritability trait 3 correlation 2
deletefileh3 = sys.argv[5]
# delete values for heritability trait 4 correlation 2
deletefileh4 = sys.argv[6]
# first global genetic correlation
globgencorr1 = sys.argv[7]
# second global genetic correlation
globgencorr2 = sys.argv[8]
outfile = sys.argv[9]


with open(deletefilec1, 'rt') as fc1, open(deletefilec2, 'rt') as fc2, open(deletefileh1, 'rt') as fh1, open(deletefileh2, 'rt') as fh2, open(deletefileh3, 'rt') as fh3, open(deletefileh4, 'rt') as fh4:
    reader = csv.reader(fc1, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_c1 = np.array(list(reader)).astype('float64')
    reader = csv.reader(fc2, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_c2 = np.array(list(reader)).astype('float64')
    reader = csv.reader(fh1, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_h1 = np.array(list(reader)).astype('float64')
    reader = csv.reader(fh2, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_h2 = np.array(list(reader)).astype('float64')
    reader = csv.reader(fh3, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_h3 = np.array(list(reader)).astype('float64')
    reader = csv.reader(fh4, delimiter='\t', quoting=csv.QUOTE_NONE)
    delete_values_h4 = np.array(list(reader)).astype('float64')

delete_values = (delete_values_c1/np.sqrt(delete_values_h1*delete_values_h2)) - (delete_values_c2/np.sqrt(delete_values_h3*delete_values_h4))
globgencorr = float(globgencorr1)-float(globgencorr2)

def jknife(pseudovalues, outfile):
    n_blocks = pseudovalues.shape[0]
    jknife_cov = np.atleast_2d(np.cov(pseudovalues.T, ddof=1) / n_blocks)
    jknife_var = np.atleast_2d(np.diag(jknife_cov))
    jknife_se = np.atleast_2d(np.sqrt(jknife_var))
    jknife_est = np.atleast_2d(np.mean(pseudovalues, axis=0))
    zscore = float(jknife_est)/float(jknife_se)
    p_value = scipy.stats.norm.sf(abs(zscore))*2
    outlog = open(outfile, 'w')
    outlog.write("nblocks\tvar\tse\testimate\tzscore(diff!=0)\tpvalue(diff!=0)\n")
    outlog.write("%s\t%s\t%s\t%s\t%s\t%s\n" %
                 (np.squeeze(n_blocks),
                 np.squeeze(jknife_var),
                 np.squeeze(jknife_se),
                 np.squeeze(jknife_est),
                 np.squeeze(zscore),
                 np.squeeze(p_value)))
    outlog.close()
    print("\n%s\t%s\t%s" % ("jknife_estimate_difference", "zscore", "p_value"))
    print("%s\t%s\t%s\n" % (jknife_est[0][0], zscore, p_value))


def delete_values_to_pseudovalues(delete_values, est):
    n_blocks = len(delete_values)
    return n_blocks * est - (n_blocks - 1) * delete_values


jknife(delete_values_to_pseudovalues(delete_values, globgencorr), outfile)
