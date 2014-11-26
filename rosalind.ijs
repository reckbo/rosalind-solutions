parse_fasta=: (LF&taketo ; (LF -.~ LF&takeafter));._1
read_fasta=: parse_fasta@freads

NB. http://rosalind.info/problems/gc/
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

NB. http://rosalind.info/problems/iprb/
chrom=: 3 2 $ 1 1  0 1  0 0  NB. 1=dominant, 0 recessive, chromosome is 'x x'
p=:4 %~ +/ @: , @: (+./)  NB. probability of dominant phenotype, e.g 1 1 p 0 1 = 0.5
pairs=: 3 : '; {@({. ; }.)&.> }: <\. y # i.3' NB. pair combos, e.g. pairs y=: 2 2 2
pair2chroms=: ((chrom {~ {.) ,: (chrom {~ {:)) each
probs=: ; @: (p"1/ each) @: pair2chroms
prob_of_dom=: 3 : '(+/ probs pairs y) % (2!+/y)'
output=: prob_of_dom 16 20 19

NB. http://rosalind.info/problems/cons/
joinLF=: (, LF&,)/
d=: parse_fasta 'rosalind_cons.txt'
profmat=: +/"2 @: (="2 0&'ACGT') @: > @: (1&{"1)
fmt=: ((4 3 $ 'A: C: G: T: ') & ,.) @: (0&":)  NB. add prefixes and LF's
consensus=: ({&'ACGT') @:  ((i. >./)"1) @: |: 
output=: (consensus@profmat d) , LF, joinLF fmt profmat d
output 1!:2 < 'rosalind_cons_out.txt'

NB. http://rosalind.info/problems/prob/
F=: 'rosalind_prob.txt'
'dna gcprobs'=: (<;._2) freads F
gcprobs=: ". gcprobs
probs=: -: @ (-. , ], ] , -.)"0 gcprobs  NB. probs for A C G T
output=: '_-' charsub ": 10^. */"1 probs {~"1 'ACGT' i. dna  NB. apply probs to dna and multiply


NB. http://rosalind.info/problems/fibd/
f=: ( -&2 +&$: -&1)^:(1&<)
