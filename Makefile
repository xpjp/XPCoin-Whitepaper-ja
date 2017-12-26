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

manuscript.tex: manuscript.md
	@cat manuscript.md \
 	| sed s/.png/.eps/g \
	| pandoc -t latex \
	| sed 's/includegraphics/includegraphics[width=1.0\\columnwidth]/g' \
	| sed 's/\[htbp\]/\[t\]/g' \
	> manuscript.tex

#.png.eps:
#	convert $< $(<.png=.eps)
ms-icon-310x310.eps:
	convert ms-icon-310x310.png ms-icon-310x310.eps

view: $(PDF)
	open $(PDF)

clean:
	/bin/rm -f $(DVI) $(PDF) *.out *.aux *.log manuscript.tex *.eps
