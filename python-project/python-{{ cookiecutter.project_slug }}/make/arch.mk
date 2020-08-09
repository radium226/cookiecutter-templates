packages/arch/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz: dist/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz
	cp "dist/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz" "packages/arch/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz"

packages/arch/{{ cookiecutter.project_slug }}-$(VERSION)-1-any.pkg.tar.zst: packages/arch/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz
	cd "packages/arch"
	PACMAN=yay \
		makepkg \
			--syncdeps \
			--cleanbuild \
			--clean \
			--noconfirm \
			--force

.PHONY: arch-package
arch-package: packages/arch/{{ cookiecutter.project_slug }}-$(VERSION)-1-any.pkg.tar.zst


.PHONY: arch-install
arch-install: arch-package
	yay -U 'packages/arch/{{ cookiecutter.project_slug }}-$(VERSION)-1-any.pkg.tar.zst' --noconfirm

.PHONY: arch-clean
arch-clean:
	find "packages/arch" \( -name "*.tar.gz" -o -name "*.pkg.tar.zst" \) -print | xargs -I {} rm -f "{}"
	
