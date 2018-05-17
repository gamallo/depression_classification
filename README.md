# depression_classification
Lexicon-based method to detect  depressive language

## DESCRIPTION
This software contains an unsupervised method to detect depression language. It takes a text and returns a value from 0 to 1 by taking into account a domain-specific lexicon (described in Choudhury et al. 2013).

It also contains all lexicons expanded with distribution models and WordNet fromtwo existing ones: Choudhury lexicon (Choudhury et al. 2013) and Pedesis lexicon (Neuman&Cohen 2015). All lexical resources, including expanded lexicons are in folder ./lexicons. More information in the following paper:

Losada, David and Pablo Gamallo (...) "Evaluating and Improving a Lexical Resource for Detecting Signs of Depression in Text"

## REQUIREMENTS
Linguakit. Please, donwload Linguakit:
```https://github.com/citiususc/Linguakit/archive/master.zip```
and copy the Linguakit folder in folder `depression_classification` at the first level.


## HOW TO INSTALL
You only need to download the repository.

### ZIP Download

Download [depression_classification-master.zip](https://github.com/gamallo/depression_classification/archive/master.zip) and then: 

```bash
unzip depression_classification-master.zip
```

### Using Git

```bash
git clone https://github.com/gamallo/depression_classification.git
```

## HOW TO USE
Run `./classif --help` to see the modules:
```
echo "Syntax: cat input_file |./classif  <module> [PoS_tags]
      
      module= tok or tag | you can just use a tokenizer (tok) or a PoS tagger (tag)
      PoS_tags= N, V, J | if you use module tag, it is possible to classify using a specific tag: noun (N), verb (V), adj (J), or a combination of them: e.g. NJ, VNJ, JV, ... (by default: NVJ).

      example of use: 
      echo "I hate my life" |./classif tag VJ 
```

## EXAMPLES

Use tokenized text:
```
echo "I hate my life" |./classif tok  
```
Use tagged text without specifying any PoS tag:
```
echo "I hate my life" |./classif tag
```
Use tagged text with just nouns:
```
echo "I hate my life" |./classif tag N
```
Use tagged text with nouns and adjectives:
```
echo "I hate my life" |./classif tag NJ
```
Use tagged text with nouns, verbs and adjectives:
```
echo "I hate my life" |./classif tag NJV
```
(all combinations of these 3 PoS tags are possible)

