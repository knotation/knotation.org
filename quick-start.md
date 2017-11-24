# Knotation Quick Start


This quick start assumes you're familiar with Linked Data and Turtle syntax. If not, the longer [tutorial](tutorial.html) will be a better introduction.

<script src="knotation_editor.js"></script>

## Knotation vs. Turtle

Turtle syntax is the closest to Knotation. Below, an individual (an owl) identified by `ex:123` is defined in Knotation on the left and Turtle on the right.

<div id="ex_1" class="examples halves">
<textarea id="ex_1_kn">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: ex:123
rdfs:label: owl 123
ex:translation; @fr: hibou 123
ex:has-wingspan; ex:inches: 22
ex:text: Text that spans multiple lines...
 
 ... must be indented with a single space.

# Lines starting with "#" are comments
</textarea>

<textarea id="ex_1_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches ;
  ex:text """Text that spans multiple lines...

... must be indented with a single space.""" .

# Lines starting with "#" are comments
</textarea>
</div>

<script>
var ex_1_line_map = org.knotation.editor.util.new_line_map();
var ex_1_kn = org.knotation.editor.core.fromSelector('#ex_1_kn', {mode: 'knotation'});
var ex_1_ttl = org.knotation.editor.core.fromSelector('#ex_1_ttl', {mode: 'turtle'});
org.knotation.editor.update.compile_content_to(ex_1_line_map, ex_1_kn, ex_1_ttl);
org.knotation.editor.update.cross__GT_update_BANG_(ex_1_line_map, ex_1_kn, ex_1_ttl);
org.knotation.editor.highlight.cross__GT_highlight_BANG_(ex_1_line_map, ex_1_kn, ex_1_ttl);
org.knotation.editor.highlight.subject_highlight_on_move_BANG_(ex_1_kn);
</script>

TODO: Synchronize these editors, so a change to one is immediately reflected in the other.

Key similarities and differences in this example:

- Both use prefixes and CURIEs
- For subjects
    - Turtle: current subject at start of line, predicate-object pairs on following lines preceded by tab
    - Knotation: current subject preceded by `: ` (e.g. `: subject`)
- For predicate-object pairs
    - Turtle: separated by semi-colons
    - Knotation: each line after the subject has a predicate, optional datatype, and object (e.g. `predicate: object`)
- For plain literals
    - Turtle: quoted strings
    - Knotation: plain text
- For language and typed literals
    - Turtle: datatype follows the quoted lexical value of the object
    - Knotation: the dataype comes after the predicate (with a semicolon) and before the lexical value of the object (e.g. `predicate; datatype: object`)

In Knotation, we can use labels instead of CURIEs and IRIs. The label has to be specified before it's used. The result is a little longer but easier to read.

<div id="ex_2" class="examples halves">
<textarea id="ex_2_kn">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: ex:translation
label: translation

: ex:inches
label: inches

: ex:has-wingspan
label: has wingspan

: ex:123
label: owl 123
translation; @fr: hibou 123
has wingspan; inches: 22
</textarea>

<textarea id="ex_2_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

rdfs:label
  rdfs:label "label" .

ex:translation
  rdfs:label "translation" .

ex:inches
  rdfs:label "inches" .

ex:has-wingspan
  rdfs:label "has wingspan" .

ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches .
</textarea>
</div>

<script>
var ex_2_kn = org.knotation.editor.core.fromSelector('#ex_2_kn', {mode: 'knotation'});
var ex_2_ttl = org.knotation.editor.core.fromSelector('#ex_2_ttl', {mode: 'turtle'});
</script>

A Knotation file might require a large number of labels, and we often want to use the same labels for multiple Knotation files. So we usually put that 'context' information in a second file.

The Knotation file on the left provides prefixes and labels that are used in the Knotation file in the middle. Using that information, the Knotation file in the middle is translated into the Turtle file on the right.

<div id="ex_3" class="examples thirds">
<textarea id="ex_3_env">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: ex:translation
label: translation

: ex:inches
label: inches

: ex:has-wingspan
label: has wingspan
</textarea>

<textarea id="ex_3_kn">
: ex:123
label: owl 123
translation; @fr: hibou 123
has wingspan; inches: 22
</textarea>

<textarea id="ex_3_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches .
</textarea>
</div>

<script>
var ex_3_env = org.knotation.editor.core.fromSelector('#ex_3_env', {mode: 'knotation'});
var ex_3_kn = org.knotation.editor.core.fromSelector('#ex_3_kn', {mode: 'knotation'});
var ex_3_ttl = org.knotation.editor.core.fromSelector('#ex_3_ttl', {mode: 'turtle'});
</script>

We can also specify the default datatype for a predicate, which makes the Knotation in the middle even more concise.

<div id="ex_4" class="examples thirds">
<textarea id="ex_4_env">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: kn:datatype/link
label: link

: kn:predicate/default-language
label: default language

: kn:predicate/default-datatype
label: default datatype
default datatype; link: link

: ex:translation
label: translation
default language: fr

: ex:inches
label: inches

: ex:has-wingspan
label: has wingspan
default datatype: inches
</textarea>

<textarea id="ex_4_kn">
: ex:123
label: owl 123
translation: hibou 123
has wingspan: 22
</textarea>

<textarea id="ex_4_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix kn: <https://knotation.org/> .
@prefix ex: <https://example.com/> .

ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches .
</textarea>
</div>

<script>
var ex_4_env = org.knotation.editor.core.fromSelector('#ex_4_env', {mode: 'knotation'});
var ex_4_kn = org.knotation.editor.core.fromSelector('#ex_4_kn', {mode: 'knotation'});
var ex_4_ttl = org.knotation.editor.core.fromSelector('#ex_4_ttl', {mode: 'turtle'});
</script>

We need to be explicit when an object is a link, but default datatypes make this easy. As previously, the Knotation files are the left and middle, and the corresponding Turtle is on the right.

<div id="ex_5" class="examples thirds">
<textarea id="ex_5_env">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: kn:datatype/link
rdfs:label: link

: kn:predicate/default-datatype
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

<textarea id="ex_5_kn">
: ex:labelled-object
rdfs:label: labelled object

: ex:some-subject
has label link: labelled object
has CURIE link: ex:curie-object
has HTTP URL link: http://example.com/url-object
has IRI link: <urn:ietf:rfc:2648>
ex:no-default; link: ex:curie-object
</textarea>

<textarea id="ex_5_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
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
</div>

<script>
var ex_5_env = org.knotation.editor.core.fromSelector('#ex_5_env', {mode: 'knotation'});
var ex_5_kn = org.knotation.editor.core.fromSelector('#ex_5_kn', {mode: 'knotation'});
var ex_5_ttl = org.knotation.editor.core.fromSelector('#ex_5_ttl', {mode: 'turtle'});
</script>

In Knotation you can write OWL class expressions just like in Protege, using the OWL Manchester Syntax. This is a big advantage over Turtle, where the OWL class expressions use nested anonymous constructs.

<div id="ex_6" class="examples thirds">
<textarea id="ex_6_env">
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix owl: <http://www.w3.org/2002/07/owl#>
@prefix obo: <http://purl.obolibrary.org/obo/>
@prefix knd: <https://knotation.org/datatype/>
@prefix knp: <https://knotation.org/predicate/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: knd:link
label: link

: knd:omn
label: OWL Manchester Syntax

: knp:default-datatype
label: default datatype
default datatype; link: link

: rdf:type
label: type
default datatype: link

: rdfs:subClassOf
label: subclass of
default datatype: OWL Manchester Syntax

: obo:RO_0002162
label: in taxon

: obo:NCBITaxon_56313
label: Tyto alba

: obo:UBERON_0000033
label: head
</textarea>

<textarea id="ex_6_kn">
: ex:owl-head
label: owl head
type: owl:Class
subclass of: head and ('in taxon' some 'Tyto alba')
</textarea>

<textarea id="ex_6_ttl">
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix obo: <http://purl.obolibrary.org/obo/> .
@prefix knd: <https://knotation.org/datatype/> .
@prefix knp: <https://knotation.org/predicate/> .
@prefix ex: <https://example.com/> .

ex:owl-head
  rdfs:label "owl head" ;
  rdf:type owl:Class ;
  rdfs:subClassOf [
    rdf:type owl:Class ;
    owl:intersectionOf (
      obo:UBERON_0000033
      [
        rdf:type owl:Restriction ;
        owl:onProperty obo:RO_0002162 ;
        owl:someValuesFrom obo:NCBITaxon_56313 ;
      ]
    ) ;
  ] .
</textarea>
</div>

<script>
var ex_6_env = org.knotation.editor.core.fromSelector('#ex_6_env', {mode: 'knotation'});
var ex_6_kn = org.knotation.editor.core.fromSelector('#ex_6_kn', {mode: 'knotation'});
var ex_6_ttl = org.knotation.editor.core.fromSelector('#ex_6_ttl', {mode: 'turtle'});
</script>
