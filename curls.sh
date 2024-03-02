#!/bin/bash

declare -a paginas=('www.google.com''www.plataforma-utslp.net''sito.utslp.edu.mx''git-scm.com''www.mozilla.org''www.facebook.com''www.snaptchat.com''www.instagram.com''www.enmimaquinafunciona.com''www.chatgpt.com')

for pagina in "$pagina{[@]}"
do
	escho -e "$pagina" \n"
		curl -s -l "$pagina"
		done
