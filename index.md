# Knotation: A notation for knowledge representation

<div class="alert alert-danger" role="alert">
<strong>Unstable!</strong> Knotation is new technology under active development. It is <strong>not yet ready</strong> for use in critical systems.
</div>

<div class="row" style="height: 16em">
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
@prefix obo: <http://purl.obolibrary.org/obo/>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

: rdfs:label
rdfs:label: label

: kn:predicate/default-datatype
label: default datatype
default datatype: kn:datatype/datatype

: rdf:type
label: type
default datatype: kn:datatype/link

: obo:NCBITaxon_9615
label: Canis lupus familiaris

: obo:BFO_0000050
label: part of
default datatype: link

: obo:UBERON_0000033
label: head</textarea>
    </div>
    <div role="tabpanel" class="tab-pane active" id="content">
      <textarea id="ex_1_kn" wrap="off">
: ex:laika
label: Laika
label; @ru: Лайка
type: Canis lupus familiaris

: ex:laikas-head
label: Laika's head
type: head
part of: Laika</textarea>
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
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
@prefix obo: <http://purl.obolibrary.org/obo/>
@prefix kn: <https://knotation.org/>
@prefix ex: <https://example.com/>

ex:laika
  rdfs:label "Laika" ;
  rdfs:label "Лайка"@ru ;
  rdf:type obo:NCBITaxon_9612 ./

ex:laikas-head
  rdfs:label "Laika's head" ;
  rdf:type obo:UBERON_0000033 ;
  obo:BFO_0000050 ex:laika .</textarea>
    </div>
  </div>

</div>
</div>

<div class="clearfix"></div>

<div id="context_message" class="hidden">
  <h3>Knotation Context</h3>
  <p>We often have a number of prefixes, labels, and defaults that we want to use for our Knotation content.</p>
</div>

<div id="content_message" class="hidden">
  <h3>Try it!</h3>
  <ol>
    <li>Click the <strong>interactive example</strong> to learn more about Knotation</li>
    <li>Click the <strong>Turtle tab</strong> to see how Knotation is converted to Turtle format</li>
    <li>Click the <strong>Context tab</strong> to see how prefixes, labels, and defaults are defined</li>
  </ol>
  <h3>Knotation is:</h3>
  <ul>
    <li>a text format that's easy for humans and machines to read and write</li>
    <li>a tool for working wth linked data and ontologies</li>
    <li>a concrete syntax for RDF and OWL</li>
    <li>free and open source</li>
    <li><strong>work in progress!</strong></li>
  </ul>
  <p>Please try it out and give us your feedback on our mailing list or issue tracker.</p>
</div>

<script src="assets/js/knotation_editor.js"></script>
<script>
function about_message(ed) {
  var cur = ed.doc.getCursor();
  line = cur.line + 1;
  $('#about').html('TODO: Add context-sensitive information about line ' + line + '.');
}

window.onload = function(e) {
  var ex_1_env = org.knotation.editor.core.fromSelector('#ex_1_env', {mode: 'knotation'});
  var ex_1_kn = org.knotation.editor.core.fromSelector('#ex_1_kn', {mode: 'knotation'});
  ex_1_kn.on('cursorActivity', about_message);
  var ex_1_ttl = org.knotation.editor.core.fromSelector('#ex_1_ttl', {mode: 'turtle'});
  ex_1_ttl.setOption('readOnly', true);
  org.knotation.editor.core.linked([ex_1_env, ex_1_kn, ex_1_ttl]);

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
}
</script>

[Knotation Quick Start](quick-start.html)


## What is Knotation useful for?

Knotation helps people read and write RDF data and OWL ontologies. It's useful for developing ontologies, for applying ontologies to your data, and for working with linked data in general.

- learn more about [RDF and Linked Data](rdf.html)
- lean more about [Knotation for Open Biomedical Ontologies](obo.html)


## Where can I get Knotation?

Documentation is available at <https://knotation.org>. Source code and tools are available from our GitHub organization at <https://github.com/knotation>.


## How do I use Knotation?

- our [online editor and converter](http://fiddle.knotation.org)
- your favourite text editor and our [command-line conversion tool](https://github.com/knotation/knotation-cljc)
- as a [library in your program](https://github.com/knotation/knotation-cljc)
- with your own scripts and build systems


## How does Knotation compare to format X?

Knotation is a concrete syntax for RDF datasets. At a quick glance, it looks similar to Turtle, but its features are closer to JSON-LD. Unlike Turtle and JSON-LD, Knotation is designed for both RDF and OWL. It has an simple syntax for OWL annotations, and uses a subset of Manchester syntax for OWL expressions (like the Protege editor).

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
      <td class="warning">poor</td>
      <td class="success">good</td>
      <td class="success">very good</td>
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
      <td class="success">yes</td>
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
      <td>no?</td>
      <td class="success">yes</td>
    </tr>
    <tr>
      <th>RDF list syntax</th>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td>yes?</td>
      <td></td>
      <td>planned</td>
    </tr>
    <tr>
      <th>anonymous object syntax</th>
      <td></td>
      <td></td>
      <td class="success">yes</td>
      <td>no?</td>
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

Learn more in the [Knotation Quick Start](quick-start.html)!


## How does Knotation work with tool Y?

Knotation files are just text files, so you can use them with many other tools:

- You can read and write Knotation using any program that works with plain text, from your favourite text editor to command-line tools and scripts.
- You can copy-and-paste Knotation anywhere you can use text: email, text documents, issue trackers, etc.
- You can store Knotation files in version control, and your pull requests will be easier to read and revise.
- You can convert Knotation to other RDF/OWL formats and use the results with other linked data tools: put it in a triple store; use ROBOT to reason over it; view in Protege.
- You can convert other RDF/OWL formats to Knotation, making them easier to read and edit.


## Who wrote Knotation?

Knotation is an open source project written by our contributors, and shared under a BSD licence. See our GitHub organization <https://github.com/knotation> for details.


## Learn More

- [Try it!](https://fiddle.knotation.org)
- [Knotation Quick Start](quick-start.html)
- [Source Code and Downloads](https://github.com/knotation)
