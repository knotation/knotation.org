# Knotation Quick Start


This quick start assumes you're familiar with Linked Data and Turtle syntax. If not, the longer [tutorial](tutorial.html) will be a better introduction.


## Knotation and Turtle

Turtle syntax is the closest to Knotation. The Knotation on the left is equivalent to the Turtle on the right.

<textarea class="half">
@prefix ex: <https://example.com/>

: ex:some-subject
ex:has-literal: text
ex:has-language-literal; @fr: texte
ex:has-typed-literal; ex:number: 1234
</textarea>

<textarea class="half">
@prefix ex: <https://example.com/> .

ex:some-subject
  ex:has-literal "text" ;
  ex:has-language-literal "texte"@fr ;
  ex:has-typed-literal "1234"^^ex:number .
</textarea>

TODO: Synchronize these editors, so a change to one is immediately reflected in the other.

Key similarities and differences in this example:

- both Knotation and Turtle use prefixes and CURIEs
- Knotation indicates the current subject with a line that starts with `: `
- in Turtle, semi-colons separate predicate-object pairs
- in Knotation, we start the line with a predicate, then an optional semi-colon and datatype, then a colon and the object
- plain literals
    - Turtle uses quoted strings
    - Knotation just uses plain text
- language and typed literals
    - in Turtle the datatype follows the quoted lexical value of the object
    - in Knotation the dataype comes after the predicate and before the lexical value of the object

The main advantage of Knotation over Turtle is that we can use labels instead of CURIEs.

<textarea class="half">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: ex:some-predicate
rdfs:label: some predicate

: ex:some-subject
some predicate: text
</textarea>

<textarea class="half">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

ex:some-predicate
  rdfs:label "some predicate" .

ex:some-subject
  ex:some-predicate "text" .
</textarea>

While a Turtle file usually has just a few prefixes, a Knotation file might require a large number of labels, and we often want to use the same labels for multiple Knotation files. So we usually put that 'context' information in a second file. The Knotation file on the left provides prefixes and labels that are used in the Knotation file in the middle. But only the content of the Knotation file in the middle is converted to the Turtle file on the right.

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: ex:some-predicate
rdfs:label: some predicate
</textarea>

<textarea class="third">
: ex:some-subject
some predicate: text
</textarea>

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

ex:some-subject
  ex:some-predicate "text" .
</textarea>

In Knotation we can specify the default datatype for a predicate.

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: kn:default-datatype
label: default datatype
default datatype: kn:datatype/datatype

: ex:has-french-label
label: has French label
default datatype: @fr

: ex:has-size
label: has size
default datatype: xsd:integer
</textarea>

<textarea class="third">
: ex:some-subject
label: some subject
has French label: un sujet
has size: 3
</textarea>

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix kn: <https://knotation.org/> .
@prefix ex: <https://example.com/> .

ex:some-subject
  rdfs:label "some subject" ;
  ex:has-french-label "un sujet"@fr ;
  ex:has-size "3"^^xsd:integer .
</textarea>

In Knotation we need to be explicit when an object is a link, but default datatypes make this easy.

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: kn:link
rdfs:label: link

: kn:default-datatype
label: default datatype
default datatype: kn:datatype/datatype

: ex:has-label-link
label: has label link
default datatype: link

: ex:has-curie-link
label: has CURIE link
default datatype: link

: ex:has-httpurl-link
label: has HTTP URL link
default datatype: link

: ex:has-iri-link
label: has IRI link
default datatype: link
</textarea>

<textarea class="third">
: ex:labelled-object
rdfs:label: labelled object

: ex:some-subject
has label link: labelled object
has CURIE link: ex:curie-object
has HTTP URL link: http://example.com/url-object
has IRI link: <urn:ietf:rfc:2648>
ex:no-default; link: ex:curie-object
</textarea>

<textarea class="third">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix kn: <https://knotation.org/> .
@prefix ex: <https://example.com/> .

ex:labelled-object
  rdfs:label "labelled object" .

ex:some-subject
  ex:has-label-link ex:labelled-object ;
  ex:has-curie-link ex:curie-object ;
  ex:has-httpurl-link <http://example.com/url-object> ;
  ex:has-iri-link <urn:ietf:rfc:2648> ;
  ex:no-default ex:curie-object .
</textarea>

