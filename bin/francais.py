#!/usr/bin/python

import random, os

listVerbs = [ "aller", "etre", "avoir", "voir", "tenir", "venir", "envoyer", "faire", "devoir", "pouvoir", "recevoir", "savoir", "vouloir", "regarder", "sortir", "prendre", "ecrire" ] 
listTimes = [ "passé composé", "imparfait", "futur simple", "conditionnel", "subjonctif", "présent" ]

while True :
    verb = random.sample(listVerbs, 1)[0]
    time = random.sample(listTimes, 1)[0]

    print("Conjugue \"" + verb + "\" en " + time)
    key = input("Avant? - \"q\" sort le program,  \"Enter\" montre la solution pour le derrière verbe.\n")

    if key is "":
        url = 'http://french.about.com/od/verb_conjugations/a/' + verb + '.htm'
        os.system("firefox " + url)
    elif key is "q": 
        exit()
