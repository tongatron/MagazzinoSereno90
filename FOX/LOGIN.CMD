#trace on
#
# Programma di collegamento per tutti gli utenti monterosa con i pop (router)
# Fabio Pignolo 1995 V 1.0


if ![load $number]
  if [query $number "Inserisci il numero di telefono"]
    save $number
  end
end
if ![load $username]
  if [username "Inserisci la tua login"]
    save $username
  end
end
if ![load $password]
  if [password "Inserisci la password"]
    save $password
  end
end



output atz\n
input 10 OK
#
# send phone number
#
output atdp$number\n
#           
# now we are connected.
#
input 90 CONNECT
#
#  wait for the username prompt
#
input 30 Username:
output $username\n
input 30 Password:
output $password\n
#
# Start PPP
#
input 30 monterosa.it>
output ppp\n

display Connessione attivata! Iconifica Winsock e\n
display carica le applicazioni Internet (Netscape, etc)\n
