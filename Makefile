PDF = XPCoin-Whitepaper-ja.pdf
DVI = XPCoin-Whitepaper-ja.dvi
TEX = XPCoin-Whitepaper-ja.tex

all: $(PDF)

dvi: $(DVI)
pdf: $(PDF)


$(PDF): $(DVI)
	dvipdfmx $(DVI)

$(DVI): $(TEX) manuscript.tex ms-icon-310x310.eps
	platex $(TEX)

manuscript.tex: whitepaper_ja.md
	@cat whitepaper_ja.md \
 	| sed s/.png/.eps/g \
	| pandoc -f markdown_strict+footnotes -t latex \
	| sed 's/includegraphics/includegraphics[width=1.0\\columnwidth]/g' \
	| sed 's/\[htbp\]/\[t\]/g' \
        | sed 's/section/section\*/g' \
	> manuscript.tex

#.png.eps:
#	convert $< $(<.png=.eps)
ms-icon-310x310.eps:
	convert ms-icon-310x310.png ms-icon-310x310.svg
	convert ms-icon-310x310.svg ms-icon-310x310.eps

view: $(PDF)
	open $(PDF)

clean:
	/bin/rm -f $(DVI) $(PDF) *.out *.aux *.log manuscript.tex *.eps *.svg
