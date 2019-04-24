tmp=tmp
cache=static/cache
webfonts=static/webfonts
fa-version=5.8.1
fa-name=fontawesome-free-$(fa-version)-web
fa-link=https://use.fontawesome.com/releases/v$(fa-version)/$(fa-name).zip

all: clean get-components build

get-components:
	wget -O $(tmp)/fa.zip $(fa-link)
	unzip -f -d $(tmp) $(tmp)/fa.zip

	cp $(tmp)/$(fa-name)/css/all.min.css $(cache)/all.min.css
	cp $(tmp)/$(fa-name)/webfonts/fa-solid-900.ttf $(webfonts)/
	cp $(tmp)/$(fa-name)/webfonts/fa-solid-900.woff $(webfonts)/
	cp $(tmp)/$(fa-name)/webfonts/fa-solid-900.woff2 $(webfonts)/
	cp $(tmp)/$(fa-name)/webfonts/fa-brands-400.woff2 $(webfonts)/

build:
	hugo

clean:
	rm -rf public/*