VIMRC_PATH = $(shell vim -u NONE -n -es --noplugin \
			 -c 'verbose echo get(split(&rtp, ","), 0)' -c 'qall' 2>&1)
PROJECT_NAME = readonly


all: install

install:
	mkdir -p $(VIMRC_PATH)/plugin
	cp plugin/$(PROJECT_NAME).vim $(VIMRC_PATH)/plugin/

clean:
	rm -f $(VIMRC_PATH)/plugin/$(PROJECT_NAME).vim
