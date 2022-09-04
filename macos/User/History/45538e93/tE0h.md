### form

#### Comment customisé les Datas ?
comment gérer les paramètres d'inputs ? les paramètre peuvent variées en fonction du type de field utilisé. ok pour les champ style param: value, mais ca devient plus lourd pour les décoration de text.
**ex: hintText**
solution idéale:
    -> librairie de modèle form input:
        le from utilise des sous modèles, qui eut meme appelent leurs générateurs
        le model expose des paramètres facile a utiliser. eventuellemnt des validateurs pré définis.
        ex:
            TextFormField:
                hint: "yes"
        il faudra égalment prévoir une option pour utiliser un type custom.
            Si model not found -> use at imported widget

#### Intégration avce l10n
les textes doivent être traduit avec l10n.
cela implique d'ajouter les trads dans un .arb
comment merge les trad user et générées ?
ne pas généréer les trads ?

### les data doivent être bi-directionelles
les sub-models peuvent requérir des générations spécifique au niveau des parents