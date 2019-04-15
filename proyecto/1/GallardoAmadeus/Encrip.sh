#!/bin/bash
#Funciones auxiliares para el encriptado y Desencriptado
function modulo {
	cadena=()
	for i in $(seq 0 $((${#contenido} - 1))); 
	do
		cadena[i]=${contenido:$i:1}	
	done
	lcadena=$(echo ${#cadena[@]})
	temp1=0
}
function modulo2 {
	contenido=""
	for i in ${cadena[*]}
	do
		contenido=$(echo $contenido$i)
	done
}
function cifrar {
	a=$(($temp + $pasos))
	if [ $a -ge $(($letras)) ];
	then 
	  	while [ $a -ge $(($letras)) ]
	  	do 
	   		a=$(($temp + $pasos - $letras))
	   	done
	else 
	   	a=$(($temp + $pasos))
	fi  
}
function descifrar {
	a=$(($temp - $pasos))
	if [ $a -lt 0 ];
	then 
	    while [ $a -lt 0 ] 
	    do
	      	a=$(($temp - $pasos + $letras))
	    done
	else 
	    a=$(($temp - $pasos))
	fi
}
function codificacion {
	modulo
	for (( i=0; i<lcadena; i++)) 
	do 
	    encontrado=`echo ${alfabeto[*]} | grep "${cadena[i]}"`
	    if [ "${encontrado}" != "" ]; 
	    then 
	        temp=0
	        for j in ${alfabeto[*]}
	        do
	            if [ $j == "${cadena[$i]}" ]
	            then
	            	if [ "$tipo" == "c" ]
	            	then
	            		cifrar
	            	else
	            		descifrar
	            	fi    
	                cadena[$temp1]=${alfabeto[$a]}
	                break
	            fi
	            temp=$(($temp + 1))
	        done 
	    else 
	        esta=0
	    fi
	    temp1=$(($temp1 + 1))
	done
	modulo2a
}
#Variables globales como alfabeto y numero de desplazamiento
estado=0
declare -a alfabeto=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
letras=$(echo ${#alfabeto[@]})
pasos=4
codigo=""
tipo=""
#Menu principal (lectura de banderas)
while getopts ":e:d:s:a:z:" op 
do 
	case $op in 
		e) 
			codigo=$OPTARG
			codigotemp=$(echo temporal)
			cat $OPTARG | sed 's/\t/®®®®/g' | sed 's/ /®/g' >  $(echo temporal)
			estado=1
		;;
		d)
			codigo=$OPTARG
			codigotemp=$(echo temporal)
			cp $OPTARG $(echo temporal)
			estado=2
		;;
		s)
			pasos=$OPTARG
		;;
		a)
			abctemp=$OPTARG
			unset alfabeto
			alfabeto=()
			for i in $(seq 0 $((${#abctemp} - 1))); 
			do
				alfabeto[i]=${abctemp:$i:1}
			done
			letras=$(echo ${#alfabeto[@]})
		;;
		z)
			codigo=$OPTARG
			codigotemp=$(echo temporal)
			codigotemp2=$(echo temp2$codigo)
			cat $OPTARG | sed 's/\t/®®®®/g' | sed 's/ /®/g' >  $(echo temporal)
			cat $OPTARG >  $(echo temp2$codigo)
			estado=3
		;;
	esac
done
#Ejecucion de estados
case $estado in
	1)
		tipo="c"
		true>$codigo
		echo " " >> $codigotemp
		while read  line;
		do 
			contenido=$line
			codificacion
			echo $contenido >> $codigo
		done < $codigotemp
		rm $codigotemp
	;;
	2)
		tipo="d"
		true>$codigo
		while read line;
		do 
			contenido=$line
			codificacion
			echo $contenido | sed 's/®/ /g' >> $codigo
		done < $codigotemp
		rm $codigotemp
	;;
	3)
		tipo="d"
		true>$codigotemp2
		while read line;
		do 
			contenido=$line
			codificacion
			echo $contenido | sed 's/®/ /g' >> $codigotemp2
		done < $codigotemp
		rm $codigotemp
		. $codigotemp2
		rm $codigotemp2
	;;
esac