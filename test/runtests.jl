include("../src/Bioinformatics.jl")
using Bioinformatics
if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@test verifyDna("ACGT") == true
@test_throws ErrorException verifyDna("ACFY") == false
@test countBases(readStringFromFile("Bioinformatics.jl/test/data/rosalind_dna.txt")) == (201, 182, 223, 195)
@test transcribeDna(readStringFromFile("Bioinformatics.jl/test/data/rosalind_rna.txt")) == "GCACUUGAACGCUCAUUGUGUCCCGCCUUCUAUCCGCAAAAUGGGCGGUUAGGGAAUAUUGAGCAGAUGUCUAAGAAGAAACAACUCAAAUUGUUUAUAACUCUUCGGCAUGAUAUACAGAUGCCUUAGUCCGAAGUUUUCAUCUUCCGCCUACCGGUCUUUCGUAAUCAAGUCGCAGUUUACGGUCAUGAUCCAAUUAUGUAUAACCGUAGUCCCUAUAAGAUGUAAGCCUUCAGCUUUGUCUGACCAUCGCCAUGUAGACCGCCGCUAAUUGUGGACAGACAGGGUAUGGUUUAGCGCCUAUUUGCAGAUUGAGAAAUAGGAGUACCAGGAGAAGGCAUCUUUUAAGGAGGGACGCGAUAUACUUAAACGCGACCUAUUACAUUUUAGAAGCAGGGUUCAAGUCCCCCAUCCCUGGCAAUGGAGCUGUGUGGCCAUAAGAAAAGUUUCCGUUCACUGACGGCAGAUCAUCAAAGACUUUCGUGAAGUGUAAACAAAUCGAUUCGCAUAAUAGAGGCCUAUCCGGUGCCAAAGUGCAGCCGUUUCGAUGACUUUCGCAUUGGCUGUGGCAAAUAAUCCAGCCGGUAAUCUGGUAAAUUUAUACCCCUCGCCCAUAACAUUAGCGGGGCAUAUCACCGUACAUUGAAACGGAUGGUCGUCCUAUCUUGAUGCGACAAGGUUGUCAUAAGGCACCGGAUAACCUGGCGGUGCAAGCAACAUAAAGAUAAGCUGGGGUCCAAUAACCGGCGUGUUCACUGAAACCAACAACUAUUUAGUUAUUCGACACAGUGCGAGGUUGAGUCGAGGCCGUCCACAAGACCCGCUGGCAAGUUUACGCUUUGCAACUACCGGCACGCAACCAAAAGACACAGGGGCACAAGUCUUGGGUGCCCUGUUAAAUCUGCACGUUAUCU"
@test reverseComplement(readStringFromFile("Bioinformatics.jl/test/data/rosalind_revc.txt")) == "TGACACTATGGGTATCCATTGTCAACGGGGAGGCCGAAAGGTGCTTTTAAATTTTATGTATTGTGTAGCCAATATAAGGACCTGGAAGGATCTTCCTTTTGTGGGGCGTATGGATACAAGCTCAGTTCGCGCATCATCACCCACCTTGACGACACCGTCGGCCGGAAACAGTGACAAACACGCTAATCAGAGGCATGAGAGGTGAACGGAGACGTGGGATAGCTCATGCGCAACAGTGGTTCGGGGAGGGTTCCGAGATAAGGCACGGACACGTATGGAGCTACATTTTCTGGGAATTTGAACCGCCTACCCCTTGCGACACCCCAACGCGCGGGTAGTGGAACTAGTTCAAAGGCTGACTTTAGTAGAACAGCACTCGCATCGCCCTGAAGCAGAACTGTCTAGCTCACCCGTATGCAGCAACTCCTGGTAATTGGGTCCCATATGGTCTGTACCACGAGCTAATCTTACTCGTTATCAGAAGCTTCCGGCATGTGTTAAAGCGATCATGTGGTATACGGGCATCTGAGTACATTTTGGGTCAGGTTGCAGACCAGATTTGGACAGAGTATGAGCCACCATGCGGTTGAGCGCCAGAAGGCAACTCTTATACATTCTCCTGTGATAACCAGGCGGTTGAGTCCGACGTCTGTTAAGAAGGCATGGCCCGTGGGTTATTAGACTCGTTACGTGTGGGATGAAGGTGCAGTGGGGGCATTTCTGTTACTGGCATTTGATGACTGTCTGTTCGAGTGACCATCGTTCTAAATATAGCCTACGAACTCTGAGGGCTTTTGTTCGTTCGAACCTATAGTCCTGGACACCCTGTTATGCCTTTTCACTTCT"
@test maximum(values(gcContent(readFASTA("Bioinformatics.jl/test/data/rosalind_gc.txt")))) == 51.125
