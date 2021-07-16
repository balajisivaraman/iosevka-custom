all:
	@echo Please pick a target

clean:
	rm -rf build

init: clean
	git clone --depth=1 git@github.com:be5invis/Iosevka.git build/IosevkaCustom
	cp private-build-plans.toml build/IosevkaCustom

build: init
	cd build/IosevkaCustom; 	\
	npm install; 	\
	npm run build -- ttf::iosevka-custom

install: build
	rm -rf ~/.local/share/fonts/IosevkaCustom
	mkdir -p ~/.local/share/fonts/IosevkaCustom
	cp build/IosevkaCustom/dist/iosevka-custom/ttf/*.ttf ~/.local/share/fonts/IosevkaCustom
	sudo fc-cache -f
