# Knotation: A notation for knowledge representation

<div class="alert alert-danger" role="alert">
<strong>Unstable!</strong> Knotation is new technology under active development. It is <strong>not yet ready</strong> for use in critical systems. IRIs are <strong>not permanent</strong> and are likely to change.
</div>

<div class="text-center">
  <h2>
    <strong>Try it!</strong>
    <button id="content-button" type="button" class="btn btn-primary">1. Content</button>
    <button id="convert-button" type="button" class="btn btn-primary">2. Convert</button>
    <button id="context-button" type="button" class="btn btn-primary">3. Context</button>
  </h2>
  <h3 id="content-step" class="step">
    1. Edit the <strong>Content tab</strong>. Click on a line to learn more about Knotation.
  </h3>
  <h3 id="convert-step" class="step hidden">
    2. Use the <strong>Turtle tab</strong> to see how Knotation is converted to <a href="https://en.wikipedia.org/wiki/Turtle_(syntax)">Turtle format</a>.
  </h3>
  <h3 id="context-step" class="step hidden">
    3. Use the <strong>Context tab</strong> to see how prefixes, labels, and defaults are defined.
  </h3>
</div>

<div class="row">
<div class="col-md-6">

  <!-- Nav tabs -->
  <ul id="left-tabs" class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#context" aria-controls="context" role="tab" data-toggle="tab">Context</a></li>
    <li role="presentation" class="active"><a href="#content" aria-controls="content" role="tab" data-toggle="tab">Content</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active hideAfterRendering" id="context">
      <textarea id="ex_1_env" wrap="off">
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>
@prefix owl: <http://www.w3.org/2002/07/owl#>
@prefix obo: <http://purl.obolibrary.org/obo/>
@prefix knd: <https://knotation.org/datatype/>
@prefix knp: <https://knotation.org/predicate/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: rdfs:comment
label: comment

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

: obo:IAO_0000115
label: definition

: obo:IAO_0000118
label: alternative term

: obo:BFO_0000050
label: part of
default datatype: link

: obo:RO_0002162
label: in taxon
default datatype: link

: obo:NCBITaxon_56313
label: Tyto alba

: obo:UBERON_0011796
label: primary remex feather
definition: A remex feather that is connected to the manus

: ex:0000001
label: birth date
default datatype: xsd:date

: ex:0000002
label: length (cm)
default datatype: xsd:real

: ex:0000003
label: coloration</textarea>
    </div>
    <div role="tabpanel" class="tab-pane active" id="content">
      <textarea id="ex_1_kn" wrap="off">
: ex:0000111
label: barn owl primary remex feather
type: owl:Class
definition: A primary remex feather of a barn owl
subclass of: 'primary remex feather' and
 ('in taxon' some 'Tyto alba')
alternative term; @fr: grange hibou primaire remex plume

: ex:0002222
label: barn owl 2222
type: Tyto alba
birth date: 2016-05-04

: ex:0033333
label: sample feather 33333
type: barn owl primary remex feather
part of: barn owl 2222
length (cm): 25.0
coloration: light brown with darker bands</textarea>
    </div>
  </div>

</div>

<div class="col-md-6">

  <!-- Nav tabs -->
  <ul id="right-tabs" class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#about" aria-controls="about" role="tab" data-toggle="tab">About</a></li>
    <li role="presentation"><a href="#turtle" aria-controls="turtle" role="tab" data-toggle="tab">Turtle</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="about">
      <p>Context-sensitive information about Knotation.</p>
    </div>
    <div role="tabpanel" class="tab-pane active hideAfterRendering" id="turtle">
      <textarea id="ex_1_ttl" wrap="off">
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
  </div>

</div>
</div>

<div class="clearfix"></div>

<div id="context_message" class="hidden">
  <h3>Knotation Context</h3>
  <p>We often have a number of prefixes, labels, and defaults that we want to use for our Knotation content. By putting this <strong>context</strong> information in a separate file, we can reuse it for many <strong>content</strong> files.</p>
  <ul>
    <li><strong>prefixes</strong> let us shorten long IRIs to concise CURIEs, just like in Turtle and SPARQL</li>
    <li><strong>labels</strong> are defined by the <code>rdfs:label</code> predicate; once defined, a label can be used wherever a CURIE or IRI is used</li>
    <li><strong>default datatypes</strong> are used when a statement does not specify a datatype</li>
    <li><strong>default languages</strong> work in the same way</li>
  </ul>
  <p>When we convert Knotation to Turtle (or other formats) we can choose whether or not to include the full context, just the prefixes, or none of it. In the <strong>Turtle tab</strong>, none of the context information is included, just the content.</p>
</div>

<div id="content_message" class="hidden">
  <h3>Knotation is ...</h3>
  <ul>
    <li>a text format that's easy for people and machines to read and write</li>
    <li>a tool for working wth <a href="https://linkeddata.org">Linked Data</a> and <a href="https://en.wikipedia.org/wiki/Ontology_(information_science)">ontologies</a></li>
    <li>a concrete syntax for <a href="https://www.w3.org/RDF/">RDF</a> and <a href="https://www.w3.org/OWL/">OWL</a></li>
    <li>free and open source</li>
    <li><strong>work in progress!</strong></li>
  </ul>
  <h4>Knotation combines the best features of ...</h4>
  <ul>
    <li><a href="https://en.wikipedia.org/wiki/Turtle_(syntax)">Turtle</a>: prefixed names, subject stanzas, multiline strings, comments</li>
    <li><a href="https://json-ld.org">JSON-LD</a>: labels, default datatypes, contexts</li>
    <li><a href="https://www.w3.org/TR/owl2-manchester-syntax/">Manchester</a>: human-readable OWL expressions</li>
    <li><a href="https://yaml.org">YAML</a>: lightweight line-based syntax</li>
  </ul>
  <p>Use the interactive editor to learn more. Click on a line for details.</p>
  <p>Please give us your feedback on our <a href="https://groups.google.com/d/forum/knotation">mailing list</a> or <a href="https://github.com/knotation/knotation-cljc">issue tracker</a>.</p>
</div>

<script src="assets/js/knotation_editor.js"></script>
<script>
function about_message(ed) {
  var cur = ed.doc.getCursor();
  var line = cur.line;
  var state = ed.knotation.getCompiledLine(line);
  var help = org.knotation.info.help(state);
  var html = org.knotation.info.html(help);
  $('#about').html(html);
}

var ex_1_env, ex_1_kn, ex_1_ttl;
var ex_1_env_starting, ex_1_kn_starting;

window.onload = function(e) {
  ex_1_env = org.knotation.editor.core.fromSelector('#ex_1_env', {mode: 'knotation'});
  ex_1_kn = org.knotation.editor.core.fromSelector('#ex_1_kn', {mode: 'knotation'});
  ex_1_ttl = org.knotation.editor.core.fromSelector('#ex_1_ttl', {mode: 'turtle'});
  org.knotation.editor.core.linked([ex_1_env, ex_1_kn, ex_1_ttl]);

  ex_1_env_starting = ex_1_env.getDoc().getValue();
  ex_1_kn_starting = ex_1_kn.getDoc().getValue();

  //ex_1_env.on('cursorActivity', about_message);
  ex_1_kn.on('cursorActivity', about_message);
  ex_1_ttl.setOption('readOnly', true);

  $('.hideAfterRendering').each( function () {
    $(this).removeClass('active')
  });

  $('#left-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  $('#right-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('#about').empty();
  $('#content_message').children().clone().appendTo('#about');

  $('a[href="#context"]').click(function (e) {
    $('#about').empty();
    $('#context_message').children().clone().appendTo('#about');
  });
  $('a[href="#content"]').click(function (e) {
    $('#about').empty();
    $('#content_message').children().clone().appendTo('#about');
  });

  $('#content-button').click(function(e) {
    $('.step').addClass('hidden');
    $('#content-step').removeClass('hidden');
    $('a[href="#content"]').click();
    $('a[href="#about"]').click();
  });
  $('#convert-button').click(function(e) {
    $('.step').addClass('hidden');
    $('#convert-step').removeClass('hidden');
    $('a[href="#content"]').click();
    $('a[href="#turtle"]').click();
  });
  $('#context-button').click(function(e) {
    $('.step').addClass('hidden');
    $('#context-step').removeClass('hidden');
    $('a[href="#context"]').click();
    $('a[href="#about"]').click();
  });
}
</script>

<div class="row text-center">
  <h2>Learn more with the <a href="quick-start.html">Knotation Quick Start</a>!</h2>
</div>


## What is Knotation useful for?

Knotation helps people read and write [RDF](https://www.w3.org/RDF/) data and [OWL](https://www.w3.org/OWL/) ontologies. It's useful for developing ontologies, for applying ontologies to your data, and for working with linked data in general.


## Where can I get Knotation?

Documentation is available at <https://knotation.org>. Source code and tools are available from our GitHub organization at <https://github.com/knotation>.


## How do I use Knotation?

- our [online editor and converter](http://fiddle.knotation.org)
- your favourite text editor and our [command-line conversion tool](https://github.com/knotation/knotation-cljc)
- as a [library in your program](https://github.com/knotation/knotation-cljc)
- with your own scripts and build systems


## How does Knotation compare to format X?

Knotation is a concrete syntax for [RDF](https://www.w3.org/RDF/) datasets with strong support for [OWL](https://www.w3.org/OWL/). It combines the best features of:

- [Turtle](https://en.wikipedia.org/wiki/Turtle_(syntax) ): prefixed names, subject stanzas, multiline strings, comments
- [JSON-LD](https://json-ld.org): labels, default datatypes, contexts
- [Manchester](https://www.w3.org/TR/owl2-manchester-syntax/): human-readable OWL expressions
- [YAML](https://yaml.org): lightweight line-based syntax

Knotation is still in early development. Several planned features have not yet been implemented.

<table id="comparison_table" class="table">
  <thead>
    <tr>
      <th></th>
      <th><a href="https://www.w3.org/TR/rdf-syntax-grammar/">RDF/XML</a></th>
      <th><a href="https://www.w3.org/TR/n-triples/">N-Triples</a><br/><a href="http://www.w3.org/TR/n-quads/">N-Quads</a></th>
      <th><a href="https://www.w3.org/TR/turtle/">Turtle</a><br/><a href="https://www.w3.org/TR/trig/">TriG</a></th>
      <th><a href="https://json-ld.org">JSON-LD</a></th>
      <th><a href="https://www.w3.org/TR/owl2-manchester-syntax/">Manchester</a></th>
      <th><a href="https://knotation.org">Knotation</a></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>file extensions</th>
      <td>rdf, xml, owl</td>
      <td>nt, nq</td>
      <td>ttl, trig</td>
      <td>json, json-ld</td>
      <td>omn</td>
      <td>kn</td>
    </tr>
    <tr>
      <th>human readability</th>
      <td class="warning">poor</td>
      <td class="warning">poor</td>
      <td class="success">good</td>
      <td>mixed</td>
      <td class="success">good</td>
      <td class="success">excellent</td>
    </tr>
    <tr>
      <th>triples</th>
      <td class="success">yes</td>
      <td class="success">yes</td>
      <td class="success">yes</td>
      <td class="success">yes</td>
      <td class="warning">poor</td>
      <td class="success">yes</td>
    </tr>
    <tr>
      <th>quads (named graphs)</th>
      <td></td>
      <td>NQuads</td>
      <td>Trig</td>
      <td class="success">yes</td>
      <td></td>
      <td>planned</td>
    </tr>
    <tr>
      <th>prefixed names</th>
      <td class="success">yes</td>
      <td></td>
      <td class="success">yes</td>
      <td class="success">yes</td>
      <td class="success">yes</td>
      <td class="success">yes</td></tr>
    <tr>
      <th>labels</th>
      <td></td>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td></td>
      <td class="success">yes</td>
    </tr>
    <tr>
      <th>default datatypes</th>
      <td></td>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td></td>
      <td class="success">yes</td>
    </tr>
    <tr>
      <th>multiline strings</th>
      <td class="success">yes</td>
      <td></td>
      <td class="success">yes</td>
      <td></td>
      <td class="success">yes</td>
      <td class="success">yes</td>
    </tr>
    <tr>
      <th>RDF list syntax</th>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td></td>
      <td></td>
      <td>planned</td>
    </tr>
    <tr>
      <th>anonymous object syntax</th>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td></td>
      <td></td>
      <td>planned</td>
    </tr>
    <tr>
      <th>OWL logic syntax</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td>partial</td>
    </tr>
    <tr>
      <th>OWL annotation syntax</th>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td>planned</td>
    </tr>
  </tbody>
</table>


<div class="row text-center">
  <h2>Learn more with the <a href="quick-start.html">Knotation Quick Start</a>!</h2>
</div>


## How does Knotation work with tool Y?

Knotation files are just text files, so you can use them with many other tools:

- You can read and write Knotation using any program that works with plain text, from your favourite text editor to command-line tools and scripts.
- You can copy-and-paste Knotation anywhere you can use text: email, text documents, issue trackers, etc.
- You can store Knotation files in version control, and your pull requests will be easier to read and revise.
- You can convert Knotation to other RDF/OWL formats and use the results with other linked data tools: put it in a triple store; use ROBOT to reason over it; view in [Protégé](https://protege.stanford.edu).
- You can convert other RDF/OWL formats to Knotation, making them easier to read and edit.


## Who wrote Knotation?

Knotation is an open source project written by our contributors, and shared under a BSD licence. See our GitHub organization <https://github.com/knotation> for details.


## Learn More

- [Try it!](https://fiddle.knotation.org)
- [Knotation Quick Start](quick-start.html)
- [Source Code and Downloads](https://github.com/knotation)
- [Mailing List](https://groups.google.com/d/forum/knotation)
