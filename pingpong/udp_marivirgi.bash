#!/bin/bash

set -e

# if [[ $# != 2 ]] ; then printf "\nError: protocol name and message size expected as parameters\n\n" ; exit 1; fi

readonly ProtocolName=udp
readonly InputTFile="../data/${ProtocolName}_throughput.dat"
prima_riga=$(head -n 1 "$InputTFile")
ultima_riga=$(tail -n 1 "$InputTFile")

N1=$(echo $prima_riga | cut -d ' ' -f 1)
N2=$(echo $ultima_riga | cut -d ' ' -f 1)
###############################################################

T1=$(echo $prima_riga | cut -d ' ' -f 3)
T2=$(echo $ultima_riga | cut -d ' ' -f 3)

###############################################################

D1=$(echo "scale=9; $N1 / $T1" | bc)
D2=$(echo "scale=9; $N2 / $T2" | bc)

###############################################################

T_delta=$(echo "scale=9; $N2 - $N1" |bc)
D_delta=$(echo "scale=9; $D2 - $D1" |bc)

###############################################################
B=$(echo "scale=9;(${T_delta#-})/(${D_delta#-})" | bc)
L=$(echo "scale=9; (($D1 * $N2) - ($D2 * $N1)) / ($N2 -$N1)" | bc)


echo "La prima riga del file  è: $prima_riga"
echo "L'ultima riga del file  è: $ultima_riga"

echo -e "N1: $N1\nN2: $N2"
echo "----------------------------------------------"
echo -e "T1: $T1\nT2: $T2"
echo "----------------------------------------------"
echo -e "D1: $D1\nD2: $D2"
echo "----------------------------------------------"
echo "Banda:$B"
echo "Latenza:$L"


gnuplot <<-eNDgNUPLOTcOMMAND

	set term png size 900, 700
	set output "../data/udp_bandalatenza.png"
	set logscale x 2
	set logscale y 10
    lbf(x) = x / ( $L + x / $B )
	set xlabel "msg size (B)"
	set ylabel "throughput (KB/s)"
	plot lbf(x) title "Latency-Bandwith model with L = ${L} and B = ${B}" \
		    with linespoints, \
		"../data/udp_throughput.dat" using 1:3 title "UDP ping-pong Throughput" \
	        with linespoints
	clear
eNDgNUPLOTcOMMAND


