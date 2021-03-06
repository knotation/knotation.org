---
title: Knotation Quick Start
---

# Knotation Quick Start

This quick start assumes you're familiar with [Linked Data](http://linkeddata.org) and [Turtle syntax](https://en.wikipedia.org/wiki/Turtle_(syntax) ).

<script src="assets/js/knotation_editor.js"></script>


## Knotation and Turtle

Knotation is similar to Turtle syntax. Try adding an `rdfs:comment` to the Knotation on the left, and see what happens to the Turtle on the right.

<div id="ex_1" class="examples halves">
<textarea id="ex_1_kn">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix ex: <https://example.com/>

: ex:123
rdfs:label: owl 123
ex:translation; @fr: hibou 123
ex:has-wingspan; ex:inches: 22
ex:description: White face,
 light brown head and upper body,
 dark banding on wings.

# Lines starting with "#" are comments</textarea>

<textarea id="ex_1_ttl">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <https://example.com/> .

ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches ;
  ex:text """White face,
light brown head and upper body,
dark banding on wings.""" .

# Lines starting with "#" are comments</textarea>
</div>

<script>
var ex_1_kn = org.knotation.editor.core.fromSelector('#ex_1_kn', {mode: 'knotation'});
var ex_1_ttl = org.knotation.editor.core.fromSelector('#ex_1_ttl', {mode: 'turtle'});
ex_1_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_1_kn, ex_1_ttl]);
</script>


## Feature Comparison

<table class="table">
  <tr>
    <th>Feature</th>
    <th>Knotation</th>
    <th>Turtle</th>
  </tr>

  <tr>
    <td>basic syntax</td>
    <td>line-based with indentation</td>
    <td>token-based with delimiters: <code>.</code> <code>;</code> <code>""</code> <code>[]</code> <code>()</code> <code>{}</code></td>
  </tr>

  <tr>
    <td>basic semantics</td>
    <td>sequence of subject stanzas, each with one-or-more predicate-object pairs</td>
    <td>same</td>
  </tr>

  <tr>
    <td>whitespace</td>
    <td>significant</td>
    <td>not significant</td>
  </tr>

  <tr>
    <td>general IRI</td>
    <td><code>&lt;foo&gt;</code></td>
    <td>same</td>
  </tr>

  <tr>
    <td>HTTP(S) URL</td>
    <td>delimiters optional <code>http://example.com/</code></td>
    <td>delimiters required <code>&lt;http://example.com/&gt;</code></td>
  </tr>

  <tr>
    <td>prefix</td>
    <td><code>@prefix ex: &lt;http://example.com&gt;</code></td>
    <td>same, with trailing period <code>.</code></td>
  </tr>

  <tr>
    <td>CURIE</td>
    <td><code>ex:foo</code></td>
    <td>same</td>
  </tr>

  <tr>
    <td>subject</td>
    <td>line starting with colon-space-identifier, <code>: ex:foo</code></td>
    <td>just an identifier</td>
  </tr>

  <tr>
    <td>predicate</td>
    <td>line starting with an identifier, then colon-space-object</td>
    <td>just an identifier</td>
  </tr>

  <tr>
    <td>literal object</td>
    <td>plain string</td>
    <td>quoted string</td>
  </tr>

  <tr>
    <td>IRI object</td>
    <td>identifier with a "link" datatype</td>
    <td>just an identifier</td>
  </tr>

  <tr>
    <td>datatype</td>
    <td>after the predicate</td>
    <td>after the object</td>
  </tr>

  <tr>
    <td>subject stanza</td>
    <td>starts with subject line, ends with next subject</td>
    <td>starts with subject identifier, ends with period <code>.</code></td>
  </tr>

  <tr>
    <td>predicate-object</td>
    <td><code>predicate: object</code></td>
    <td><code>predicate "object" ;</code></td>
  </tr>

  <tr>
    <td>predicate-object-datatype</td>
    <td><code>predicate; datatype: object</code></td>
    <td><code>predicate "object"^^datatype ;</code></td>
  </tr>

  <tr>
    <td>predicate-object-language</td>
    <td><code>predicate; language: object</code></td>
    <td><code>predicate "object"@language ;</code></td>
  </tr>

  <tr>
    <td>multiline literal</td>
    <td>indented with one space</td>
    <td>triple-quoted</td>
  </tr>

  <tr>
    <td>comment</td>
    <td>line starting with <code>#</code></td>
    <td>starts with <code>#</code></td>
  </tr>

  <tr>
    <td>label</td>
    <td>declare then use as an identifier</td>
    <td>not supported</td>
  </tr>

  <tr>
    <td>default datatype</td>
    <td>supported</td>
    <td>not supported</td>
  </tr>

  <tr>
    <td>default language</td>
    <td>supported</td>
    <td>not supported</td>
  </tr>

  <tr>
    <td>Manchester syntax</td>
    <td>supported</td>
    <td>not supported</td>
  </tr>
</table>


## Labels

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
has wingspan; inches: 22</textarea>

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
  ex:has-wingspan "22"^^ex:inches .</textarea>
</div>

<script>
var ex_2_kn = org.knotation.editor.core.fromSelector('#ex_2_kn', {mode: 'knotation'});
var ex_2_ttl = org.knotation.editor.core.fromSelector('#ex_2_ttl', {mode: 'turtle'});
ex_2_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_2_kn, ex_2_ttl]);
</script>


## Re-Usable Context

A Knotation file might require a large number of labels, and we often want to use the same labels for multiple Knotation files. So we usually put that **context** information in a separate file (left), letting us focus on the **content** (middle).

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
label: has wingspan</textarea>

<textarea id="ex_3_kn">
: ex:123
label: owl 123
translation; @fr: hibou 123
has wingspan; inches: 22</textarea>

<textarea id="ex_3_ttl">
ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches .</textarea>
</div>

<script>
var ex_3_env = org.knotation.editor.core.fromSelector('#ex_3_env', {mode: 'knotation'});
var ex_3_kn = org.knotation.editor.core.fromSelector('#ex_3_kn', {mode: 'knotation'});
var ex_3_ttl = org.knotation.editor.core.fromSelector('#ex_3_ttl', {mode: 'turtle'});
ex_3_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_3_env, ex_3_kn, ex_3_ttl]);
</script>


## Default Language and Datatype

We can also specify the default language and datatype for a predicate (left), making the Knotation content (middle) even more concise.

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
default datatype: inches</textarea>

<textarea id="ex_4_kn">
: ex:123
label: owl 123
translation: hibou 123
has wingspan: 22</textarea>

<textarea id="ex_4_ttl">
ex:123
  rdfs:label "owl 123" ;
  ex:translation "hibou 123"@fr ;
  ex:has-wingspan "22"^^ex:inches .</textarea>
</div>

<script>
var ex_4_env = org.knotation.editor.core.fromSelector('#ex_4_env', {mode: 'knotation'});
var ex_4_kn = org.knotation.editor.core.fromSelector('#ex_4_kn', {mode: 'knotation'});
var ex_4_ttl = org.knotation.editor.core.fromSelector('#ex_4_ttl', {mode: 'turtle'});
ex_4_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_4_env, ex_4_kn, ex_4_ttl]);
</script>


## Links

When an object is an IRI (instead of a literal), Knotation requires a "link" datatype. Default datatypes make this easy.

<div id="ex_5" class="examples thirds">
<textarea id="ex_5_env">
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix knd: <https://knotation.org/datatype/>
@prefix knp: <https://knotation.org/predicate/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: knd:link
rdfs:label: link

: knp:default-datatype
label: default datatype
default datatype; link: link

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
default datatype: link</textarea>

<textarea id="ex_5_kn">
: ex:labelled-object
rdfs:label: labelled object

: ex:some-subject
has label link: labelled object
has CURIE link: ex:curie-object
has HTTP URL link: http://example.com/url-object
has IRI link: <urn:ietf:rfc:2648>
ex:no-default; link: ex:curie-object</textarea>

<textarea id="ex_5_ttl">
ex:labelled-object
  rdfs:label "labelled object" .

ex:some-subject
  ex:has-label-link ex:labelled-object ;
  ex:has-curie-link ex:curie-object ;
  ex:has-httpurl-link <http://example.com/url-object> ;
  ex:has-iri-link <urn:ietf:rfc:2648> ;
  ex:no-default ex:curie-object .</textarea>
</div>

<script>
var ex_5_env = org.knotation.editor.core.fromSelector('#ex_5_env', {mode: 'knotation'});
var ex_5_kn = org.knotation.editor.core.fromSelector('#ex_5_kn', {mode: 'knotation'});
var ex_5_ttl = org.knotation.editor.core.fromSelector('#ex_5_ttl', {mode: 'turtle'});
ex_5_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_5_env, ex_5_kn, ex_5_ttl]);
</script>


## Manchester Syntax

Knotation allows you to write OWL class expressions using Manchester syntax, just like in [Protégé](https://protege.stanford.edu). This is **much** more clear and concise than the corresponding Turtle.

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
label: head</textarea>

<textarea id="ex_6_kn">
: ex:owl-head
label: owl head
type: owl:Class
subclass of: head and ('in taxon' some 'Tyto alba')</textarea>

<textarea id="ex_6_ttl">
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
  ] .</textarea>
</div>

<script>
var ex_6_env = org.knotation.editor.core.fromSelector('#ex_6_env', {mode: 'knotation'});
var ex_6_kn = org.knotation.editor.core.fromSelector('#ex_6_kn', {mode: 'knotation'});
var ex_6_ttl = org.knotation.editor.core.fromSelector('#ex_6_ttl', {mode: 'turtle'});
ex_6_ttl.setOption('readOnly', true);
org.knotation.editor.core.linked([ex_6_env, ex_6_kn, ex_6_ttl]);
</script>
