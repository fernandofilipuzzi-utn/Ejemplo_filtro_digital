function []=save_ecu(filename, ecu_latex)

   cadena=['\documentclass[informe.tex]{subfiles}\begin{document} $$',...
                            ecu_latex, ...
                             '$$\end{document}'...
                            ];
   saveImplementacion(filename, cadena);
end