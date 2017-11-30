FILES := index.html quick-start.html

.PHONY: all
all: $(FILES)

.PHONY: clean
clean:
	rm -rf $(FILES)

%.html: %.md
	pandoc $< -o $@ \
		--from markdown_strict+yaml_metadata_block \
		--template template.html \
		--css assets/css/knotation.css

