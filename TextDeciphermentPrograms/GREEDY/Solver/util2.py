import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from nltk.tokenize import RegexpTokenizer
from itertools import izip
import util2
import subprocess
import os

def decs_to_files(filename,scores):
    with open(filename,'r') as f:
        lines = f.readlines()
    with open(scores,'r') as g:
        scoreslist = g.readlines()
    scoreslist = list(map(lambda x:x.replace('\n',''),scoreslist))
    if not(os.path.exists('Texts/'+filename+'/')):
        os.makedirs('Texts/'+filename+'/')
    for i,line in enumerate(lines):
        save_name = ('Texts/%s/%s_%s.txt')%(filename,scoreslist[i],i)
        with open(save_name,'a+') as f:
            f.write(line.replace(' ',''))


def file_to_list(filename):
    with open(filename,'r') as f:
        lines = f.readlines()

    for i,j in enumerate(lines):
        lines[i] = float(j.replace('\n',''))
    return lines

def sort_decs(scorefile,decfile,musicpath):
    musicfiles = os.listdir(musicpath)

    with open(scorefile,'r') as f:
        lines = f.readlines()

    lines = list(map(lambda x:x.replace('\n',''),lines))

    for file in musicfiles:
        os.rename(musicpath+file,musicpath+lines[int(file[:-5])]+file[-5]+file[:-5]+'.mid')


def best_decs(scorefile,decfile,nums=2):
    if nums == None:
        nums = 2
    #print type(nums)
    scores = util2.file_to_list(scorefile)
    #decs = util2.file_to_list(decfile)

    #scores = list(map(lambda x:x.replace('\n',''),scores))
    #decs = list(map(lambda x:x.replace('\n',''),decs))

    with open(decfile,'r') as f:
        lines = f.readlines()
    decs = list(map(lambda x:x.replace('\n',''),lines))

    score_dec = dict(zip(decs,scores))

    ret = list(sorted(score_dec.items(),key = lambda kv:(kv[1], kv[0])))
    return ret[:nums]



def dist_2(data,strings,save):
    x = np.zeros(len(data))
    y = np.zeros(len(data))
    med = np.zeros(len(data))
    for i,j in enumerate(data):
        ax = sns.distplot(j)
        xdata = ax.lines[0].get_xdata()
        ydata = ax.lines[0].get_ydata()
        maxid = np.argmax(ydata)

        x[i] = xdata[maxid]
        y[i] = ydata[maxid]
        med[i] = np.median(j)
        plt.show()

    for i,j in enumerate(data):
        sns.distplot(j,kde_kws = {"label":strings[i]})
        plt.plot((x[i],x[i]),(0,y[i]),'r')
        plt.text(x[i],y[i],med[i])

    plt.xlabel('Negative Log Probability')
    plt.ylabel('Frequency')

    num = len(os.listdir('Plots/'))
    if save:
        save_str = 'Plots/{0}_Histogram.svg'.format(str(num))
        plt.savefig(save_str)
    plt.show()


def dist_plot(data):
    ax1 = sns.distplot(data[0],kde_kws = {"label":"E2E"})
    #x1 = ax1.lines[0].get_xdata()
    #y1 = ax1.lines[0].get_ydata()
    #maxid1 = np.argmax(y1)


    ax2 = sns.distplot(data[1],kde_kws = {"label":"E2M"})
    #x2 = ax2.lines[0].get_xdata()
    #y2 = ax2.lines[0].get_ydata()
    #maxid2 = np.argmax(y2)
    #ax2.plot((x2[maxid2], x2[maxid2]), (0, y2[maxid2]), '#de8f05')


    ax3 = sns.distplot(data[2],kde_kws = {"label":"M2E"})
    #x3 = ax3.lines[0].get_xdata()
    #y3 = ax3.lines[0].get_ydata()
    #maxid3 = np.argmax(y3)

    ax4 = sns.distplot(data[3],kde_kws = {"label":"M2M"})
    #x4 = ax4.lines[1].get_xdata()
    #y4 = ax4.lines[1].get_ydata()
    #maxid4 = np.argmax(y4)

    #plt.axvline(x=np.mean(data[1]),color = 'k',ymax = 0.5)
    #plt.axvline(x=np.mean(data[2]),color = 'k',ymax = 0.5)
    #plt.axvline(x=np.mean(data[3]),color = 'k',ymax = 0.5)
    #plt.savefig('distplot.svg')#, transparent = True)
    plt.show()


def comb_box(data):
    #sns.set_style("darkgrid")
    ax = sns.boxplot(data = data)
    ax.set(xlabel = 'Decipherment Type',ylabel = 'Negative log probability')
    ax.set_xticklabels(['E2E','E2M','M2E','M2M'])
    #ax.hline()
    plt.savefig('Plots/boxplot.svg')
    plt.show()

def comb_box_2(data,strings,save):
    #sns.set_style("darkgrid")
    ax = sns.boxplot(data = data)
    ax.set(xlabel = 'Decipherment Type',ylabel = 'Negative log probability')
    ax.set_xticklabels(strings)
    #ax.hline()
    #if save:
    #    plt.savefig('Plots/boxplot.svg')
    #plt.show()

    num = len(os.listdir('Plots/'))
    if save:
        save_str = 'Plots/{0}_Boxplot.svg'.format(str(num))
        plt.savefig(save_str)




def text_to_train(filename):
    with open(filename,'r') as f:
        lines = f.readlines()
    tokenizer = RegexpTokenizer(r'\w+')
    for i,j in enumerate(lines):
        lines[i] = tokenizer.tokenize(j)

    for i,j in lines:
        for l,m in enumerate(j):
            lines[i][l] = m.lower()

    for i,j in enumerate(lines):
        for l,m in enumerate(j):
            lines[i][l] = ' '.join(m)


    for i,j in enumerate(lines):
        lines[i] = ' '.join(j)

    lines = list(filter(lambda x:x!='',lines))
    newlines = []
    newlines = ' '.join(lines)

    #length of dorabella cipher *2 -1 to account for spaces

    len_dora2 = 173

    write_lines = []
    for i in range(0,len(newlines),2):
        write_lines.append(newlines[i:i+len(dora2)])


    write_lines2 = list(map(lambda x:x.replace(' ',''),write_lines))
    write_lines3 = list(filter(lambda x:x.isalpha(),write_lines2))
    write_lines4 = list(map(lambda x:' '.join(x),write_lines3))


    with open('testfile.txt','w') as f:
        for i in write_lines4:
            if(len(i)>=len_dora2):
                f.write(i+'\n')


# Hamming distance
def evaluate(string1,string2):
    string1 = string1.replace(' ','')
    string2 = string2.replace(' ','')
    assert len(string1) == len(string2)
    return 100*sum(c1!=c2 for c1,c2 in izip(string1,string2))/float(len(string1))
