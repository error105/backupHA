#!/bin/bash
SAFE=$(pwd)
echo "Obecny folder: $SAFE"

echo "Adres repozytorium GIT: "
read ADRES

echo "Podaj e-mail: (do git push)"
read EMAIL

echo "Podaj nazwe uzytkownika: (do git push i logowania do GIT)"
read USER

echo "Podaj haslo: (do logowania do GIT)"
read -s PASS

FOLDER=$(cd "$(dirname "$0")" && pwd)

echo "Wybierz liste plikow i folderow ktore chcesz uwzglednic w kopii:"
echo "Po zakonczenu wybrania wpisz /"

select file in *; do
  if [ -f "$file" ] || [ -d "$file" ]; then
    PLICZKI="$PLICZKI $file"
    echo "Wybrales/as: $file"
  else
    if [ -z "$PLICZKI" ]; then
      echo "Wybrano bledny plik albo plik juz nie istnieje."
    else
      echo "Wybrales/as nastepujace pliki: $PLICZKI"
      break
    fi
  fi
 done
 
echo "git commit -m \"$(date +"%d-%m-%Y")\" -a" > "backup_$FOLDER.sh"
echo "git push -u origin main" >> "backup_$FOLDER.sh"
echo "machine github.com" > "~/.netrc"
echo "login %USER" >> "~/.netrc"
echo "password $PASS" >> "~/.netrc"
  
git init
git config --global --add safe.directory &SAFE
git checkout -b main
git add $PLICZKI
git commit -m "Pierwsza Wersja"
git remote add origin $ADRES
git push -u origin main