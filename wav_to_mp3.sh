#! /bin/bash
#
#
#		Script para codificar uma pasta com arquivos wav em mp3 
#
#
#		Flavio	07/03/15
#				18/05/23
#

declare -rx SCRIPT=${0##*/}
declare -r T0="lista.txt"
declare -r TMP="tmp.tmp"
declare -i TOTAL
declare MUS
declare TRA
declare -i TOTLET
declare -i N
declare AB

# 	verifica parametros
if [ $# -eq 0 ] ; then

		((AB=128000))
	else
		((AB="$1"))     # 	carrega o parametro
fi

printf "%s \n\n" "***********************************************************************"
printf "%s %s  !!! \n\n" "  USANDO bitrate de " $AB
printf "%s \n\n" "***********************************************************************"


#	abre o arquivo temporario para leitura escrita
exec 4> $T0

# 	lista diretorio e filtra as .wav escreve em temporario e fecha
ls -1 *.wav >&4-

#   conta total
((TOTAL=` cat $T0 | wc -l `))

#	abre para leitura
exec 5< $T0

#	looping de execução de musica
((N=0))

while  ((N++ < $TOTAL)) ; 
do 
	# 	le linha inteira
	read -i text MUS <&5
		
	# 	calcula novo nome
	# conta letras
	((TOTLET=${#MUS}))				

	# novo nome
	exec 6> $TMP
	printf "%s%s\n" "${MUS:0:TOTLET-3}" "mp3" >&6-

	# rele novo nome
	exec 6< $TMP
	read -i text TRA <&6-
		 
	# executa comando conversâo e copia metadados
	#	`ffmpeg -i "$MUS" -y -ab $AB -map_meta_data outfile:infile rrr.mp3`
	`ffmpeg -i "$MUS" -ab $AB rrr.mp3`

	# renomeia
	`mv rrr.mp3 "$TRA"`	

done

#	cria diretorio para remoção
`mkdir wav`

#	move todos m4a para dentro 
`mv *.wav wav/. `

#	move o script tambem
`mv $SCRIPT wav/. `

#	remove temporarios	
`rm $T0`
`rm $TMP`
	
printf "%s \n\n" "***********************************************************************"
printf "%s \n\n" " Arquivos recodificados !!!"
printf "%s \n\n" "***********************************************************************"

exit 0






