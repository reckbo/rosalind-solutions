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
arr2str=: '_-' charsub , @: (,"1&LF) @: ":
k=:7
((": !k), LF, arr2str tap k) 1!:2 < outfile

NB. http://rosalind.info/problems/sign/
bitstrings=. #: @: i. @: (2&^ @: #)
signed_masks=. ({&(1 _1) @: bitstrings)
signed=: [  (*"1 1) signed_masks 
input=:5
count=: (! * 2&^) input
output=: (": count), LF, arr2str signed"1 tap input
output 1!:2 < 'rosalind_sign_out.txt'

NB. http://rosalind.info/problems/prot/
codon_tbl=: ;: (] ;. _2) 1!:1 < 'codon_tbl'
codons=: > 0 {"1 codon_tbl
aminos=: 1 {"1 codon_tbl
stop_indices=: I. ; 'Stop'&-:&.> aminos
aminos=: (<'') stop_indices} aminos  NB. replace 'Stop' with ''
get_amino=: {&aminos @: I. @: (-:"1)&codons
input=: 1!:1 < 'rosalind_prot.txt'
output=: ; _3 get_amino\ input
output 1!:2 < 'rosalind_prot_out.txt'

NB.http://rosalind.info/problems/subs/
f=:(1+I.@E.)
data=: freads 'rosalind_subs.txt'
s=: > {. (< ;. _2) data
t=: > {: (< ;. _2) data
output=: t f s
