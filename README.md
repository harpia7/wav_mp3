# wav_mp3
#
#			Script montado para trancodificar audio padrão wav para mp3 por lote 
#		fazendo uso do ffmpeg via linha de comando
#
#  arquivo original criado em 03/2015

bash script convert wav to mp3 !!!

uso :
	- copie para uma pasta todos os .wav que deseja transcodificar

	- copie para dentro desta pasta wav_to_mp3.sh e certifique que tempermisao de execução rwx

	- parametro opcional após o comando a taxa de bits por segundo deve ser escrita sem abreviaçoes
		192k ==>> 192000
		256k ==>> 256000
		128k ==>> 128000 ( default )
	
	
		ex: $ ./wav_to_mp3.sh 128000 

			será gerado um arquivo temporário com lista de todas musicas .wav
			
			serão todos transcodificados para mp3 com bitrate pedido
			
			será criada uma subpasta wav onde serão movidos todos os arquivos originais
			
			temporarios serão apagados ! 



