start :- 
    maladie(Nom),
        write('Nous pensons que vous souffrez de :'),
        write(' '),
        write(Nom),
        nl,
        undo.
start :-
        write('Desole, je ne parviens pas a diagnostique votre maladie'),nl,
        write('Mais je vous promet de m\'ameliorer'),nl.

/*Bases de faits et de règles*/
maladie('paludisme'):- paludisme.
maladie('cholera'):- cholera.
maladie('lepre'):- lepre.
maladie('tuberculose'):- tuberculose.
maladie('typhoide'):- typhoide.
maladie('varicele'):- varicele.
maladie('rougeol adulte'):- rougeole_adulte.
maladie('rougeole enfant'):- rougeole_enfant.
maladie('covid 19') :- covid_19.
maladie('syphilis') :- syphilis.
maladie('ebola') :- ebola.
maladie('grippe') :- grippe.


paludisme:- 
    vrai('fievre froide'),
    vrai('cephalees'),
    vrai('vertiges'),
    vrai('coubatures').

cholera:- 
    vrai('douleurs abdominales'),
    vrai('diarhee chronoque'),
    vrai('soif intense'),
    vrai('deshydratation').

lepre:- 
    vrai('macules'),
    vrai('perte de sensibilite'),
    vrai('gonflement du nez'),
    vrai('maux perforants plantaires').

tuberculose:- 
    vrai('douleurs toraciques'),
    vrai('dysphne'),
    vrai('hemoptysie'),
    vrai('nez qui coule'), 
    vrai('toux seche').

typhoide:- 
    vrai('courbature'),
    vrai('maux de ventre'),
    vrai('fievre en plateau'), 
    vrai('maux de tete').

grippe:- 
    vrai('nez qui coule'), 
    vrai('maux de tete'), 
    vrai('fievre froide'), 
    vrai('toux seche').

varicele:- 
    vrai('toux legere'),
    vrai('macules rouges'),
    vrai('demangeaison'),
    vrai('fieve froide'),
    vrai('nez qui coule').

rougeole_enfant:-
    vrai('yeux rouges larmoyants'),
    vrai('points blauc en bouche'),
    vrai('toux seche'),
    vrai('nez qui coule'),
    vrai('fievre en plateau').

rougeole_adulte:-
    vrai('yeux rouges larmoyants'),
    vrai('points blauc en bouche'),
    vrai('rhinopharyngite'),
    vrai('toux seche'),
    vrai('nez qui coule'),
    vrai('fievre en plateau').

ebola:- 
    vrai('maux de tete'),
    vrai('douleurs musculaires'),
    vrai('mal de gorge'),
    vrai('nausees vomissements'),
    vrai('fievre froide'),
    vrai('hemoragie').

syphilis:- 
    vrai('chancre'),
    vrai('maux de tete'),
    vrai('douleurs musculaires'),
    vrai('fievre froide'),
    vrai('macule rouges').

covid_19:- 
    vrai('maux de tete'),
    vrai('douleurs musculaires'),
    vrai('mal de gorge'),
    vrai('toux seche'),
    vrai('fievre en plateau'),
    vrai('perte odorat gout').


/* Questions */
inpput(Question):-
    write('Souffrez vous de : '),
    write(Question),
    write(' ?'),
    read(Reponse),
    nl,
    ((Reponse == yes; Reponse == y) 
        ->
            assert(yes(Question));
            assert(no(Question)),fail).
:- dynamic yes/1,no/1.

vrai(Order) :-
    (yes(Order)
    -> true;
    (no(Order)
    -> fail;
    inpput(Order))).

undo :-retract(yes(_)),fail.
undo :-retract(no(_)),fail.
undo.