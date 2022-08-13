$projname="biblatex-jamod";
$out_dir="build";

$my_interaction_mode="nonstopmode";
$my_synctex_mode = "-1";

$my_latex_args = "-synctex=$my_synctex_mode -file-line-error -halt-on-error -interaction=$my_interaction_mode";

$xelatex  = "xelatex  $my_latex_args %O %S";
$lualatex = "lualatex $my_latex_args %O %S";
$latex    = "platex   $my_latex_args %O %S";

# use dvipdfmx as dvipdf
$dvipdf  = 'dvipdfmx %O -o %D %S -z 0';

#3 for tex, 4 for lualatex, 5 for xetex
$pdf_mode = 4;

$postscript_mode = $dvi_mode = 0;
