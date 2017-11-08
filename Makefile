%.html: %.md
	pandoc $< -o $@ \
		--from markdown_strict+yaml_metadata_block \
		--template template.html \
		--css template.css \
		--css knotation.css

