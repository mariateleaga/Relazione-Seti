# RELAZIONE SETI - Passalacqua, Teleaga

*Tutti i fail da noi inseriti hanno dicitura iniziale in genovese e successiva spiegazione dell'errore.  
Di seguito i casi di test che presentano:
- scopo: cosa/quali parti di codice si vogliono testare
- situazione iniziale se significativa
- linea inviata alla microbash
- risultato atteso 

## Test proposti dal file microbash.pdf
Cambia la directory di lavoro, ma darà errore perché non esiste la directory foo
```sh
cd foo
BELIN BELANDI, ADESCITE: No such file or directory
```
----------------------------------------------------------------------------------------------
Filtra l’elenco dei file tenendo solo le linee che contengono la stringa “foo” e scrive il risultato nel file “bar”
```sh
ls -l | grep foo >bar
Anâ cómme 'na lìppa:
The child terminated normally and the exit-status is 1 while the pid number is 894
```
----------------------------------------------------------------------------------------------
Conta il numero di processori (core) presenti nel sistema
```sh
cat /proc/cpuinfo | grep processor | wc -l
8
```
----------------------------------------------------------------------------------------------
Come il precedente, ma stavolta cat legge da standard input (che `e stato rediretto)
```sh
cat </proc/cpuinfo | grep processor | wc -l
8
```
----------------------------------------------------------------------------------------------
Errore: il comando cd ha un solo argomento
```sh
cd foo bar
BEZÛGO! Cd può avere un solo argomento e non può avere redirezioni I/O
```
----------------------------------------------------------------------------------------------
Errore: il comando cd non supporta la redirezione
```sh
cd foo <bar
BEZÛGO! Cd può avere un solo argomento e non può avere redirezioni I/O
```
----------------------------------------------------------------------------------------------
Errore: il comando cd deve essere usato da solo
```sh
ls | cd foo
BEZÛGO! Il comando cd va usato una sola volta e come unico comando
```
----------------------------------------------------------------------------------------------
Errore: non è specificato il file per la redirezione dello standard output (c’è uno spazio fra > e bar)
```sh
ls -l | grep foo > bar
Parsing error: no path specified for output redirection
```
----------------------------------------------------------------------------------------------
Errore: solo il primo comando pu`o avere la redirezione dell’input
```sh
ls | grep foo <bar | wc -l
Sciûsciâ e sciorbî no se pêu: Non è possibile redirigere comandi che non siano il primo o l'ultimo
```
## Test extra
Elencare i file presenti all'interno della directory microbahs-students
```sh
ls
Makefile  microbash  microbash.c  microbash.o  microbash.pdf  relazione.txt
```
----------------------------------------------------------------------------------------------
## INSERIRE SCOPO
```sh
cat prova //con flag O_TRUNC

Makefile
microbash
microbash.c
microbash.o
microbash.pdf
prova
relazione.txt
```
----------------------------------------------------------------------------------------------
## INSERIRE SCOPO
```sh
cat prova //senza flag O_TRUNC
```
```sh
Makefile
microbash
microbash.c
microbash.o
microbash.pdf
prova
relazione.txt
wxr-xr-x 1 S5428470 LaboDidattici  57792 Nov 27 17:43 microbash
-rw-r--r-- 1 S5428470 LaboDidattici  13669 Nov 27 17:43 microbash.c
-rw-r--r-- 1 S5428470 LaboDidattici  62344 Nov 27 17:43 microbash.o
-rw-r--r-- 1 S5428470 LaboDidattici 298886 Nov 11 10:58 microbash.pdf
-rw------- 1 S5428470 LaboDidattici     77 Nov 27 17:44 prova
-rw-r--r-- 1 S5428470 LaboDidattici  18461 Nov 26 11:00 relazione.txt
```
----------------------------------------------------------------------------------------------
Rimuove il file prova dalla directory microbash-students
```sh
rm prova
```
Se si esegue il comando ls si ottiene:
```sh
Makefile  microbash  microbash.c  microbash.o  microbash.pdf  relazione.txt
```
----------------------------------------------------------------------------------------------
## INSERIRE SCOPO
```sh
ls -l
```
```sh
total 464
-rw-r--r-- 1 S5428470 LaboDidattici    423 Nov 18 17:45 Makefile
-rwxr-xr-x 1 S5428470 LaboDidattici  57792 Nov 27 17:35 microbash
-rw-r--r-- 1 S5428470 LaboDidattici  13663 Nov 27 17:34 microbash.c
-rw-r--r-- 1 S5428470 LaboDidattici  62344 Nov 27 17:35 microbash.o
-rw-r--r-- 1 S5428470 LaboDidattici 298886 Nov 11 10:58 microbash.pdf
-rw------- 1 S5428470 LaboDidattici     77 Nov 27 17:36 prova
-rw-r--r-- 1 S5428470 LaboDidattici  18461 Nov 26 11:00 relazione.txt
```
-------------------------------------------------------------------------------------------------
## CONTROLLARE SCOPO
Togliere il permesso di write a prova
```sh
chmod u-w prova
```
Dopo aver eseguito comando ls-l (si noti la mancanza di w nella penultima riga)
```sh
total 464
-rw-r--r-- 1 S5428470 LaboDidattici    423 Nov 18 17:45 Makefile
-rwxr-xr-x 1 S5428470 LaboDidattici  57792 Nov 27 17:35 microbash
-rw-r--r-- 1 S5428470 LaboDidattici  13663 Nov 27 17:34 microbash.c
-rw-r--r-- 1 S5428470 LaboDidattici  62344 Nov 27 17:35 microbash.o
-rw-r--r-- 1 S5428470 LaboDidattici 298886 Nov 11 10:58 microbash.pdf
-r-------- 1 S5428470 LaboDidattici     77 Nov 27 17:36 prova
-rw-r--r-- 1 S5428470 LaboDidattici  18461 Nov 26 11:00 relazione.txt
```