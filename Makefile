.PHONY: build

all:
	@echo Please pick a target

clean:
	rm -rf build

init:
	git clone --depth=1 https://github.com/be5invis/Iosevka.git build/IosevkaCustom

build:
	cp private-build-plans.toml build/IosevkaCustom
	cd build/IosevkaCustom; 	\
	npm install; 	\
	npm run build -- ttf::iosevka-custom

patch:
	mkdir -p build/patched-fonts
	podman run -v ~/projects/IosevkaCustom/build/IosevkaCustom/dist/iosevka-custom/ttf/:/in -v ~/projects/IosevkaCustom/build/patched-fonts/:/out nerdfonts/patcher

install:
	rm -rf ~/.local/share/fonts/IosevkaCustom
	mkdir -p ~/.local/share/fonts/IosevkaCustom
	cp build/patched-fonts/*.ttf ~/.local/share/fonts/IosevkaCustom
	sudo fc-cache -f
