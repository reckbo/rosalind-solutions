NB. computing gc content


F=:'rosalind_gc.txt'
data =: 1!:1 < F
mktbl =: < ;. 1
getdna=:(#~ LF&~:) @ (}.~ i.&LF)
gc=: *&100 @ ([: +/ [: +/ ="1 0 &'GC') % #
getlabel=: }. & ({.~ i.&LF)
tbl=: (getlabel ; gc@getdna) & > & mktbl data
gc=: (\: keys=.1&{"1) tbl
topgc=: ,. {. gc

NB. http://rosalind.info/problems/fib/
k=:5
f=: (-&2  ((k*[) + ])&$: -&1)^: (1&<)

NB. http://rosalind.info/problems/hamm/
F=:'rosalind_hamm.txt'
data =: (] ;. _2) 1!:1 < F
hamm=: +/ ~:/ data

NB.http://rosalind.info/problems/perm/
outfile=:'rosalind_perm_out.txt'
tap=: i.@! A. (1+i.)
arr2str=: , @: (,"1&LF) @: ":
k=:7
((": !k), LF, arr2str tap k) 1!:2 < outfile

NB. http://rosalind.info/problems/sign/
