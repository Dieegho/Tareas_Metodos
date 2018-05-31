%%
% How to use:
% tableGenerator(iterations, params, varNames)
%
% - Params is an array matrix that contains the info you want to show.
% - varNames is an object that contains the names of each column of your
%   table.
%
% ------------------------------
% Example:
% In your main of method function just call like this:
%
% varNames = {'Iteraciones', 'Raiz', 'Error'};
% [Table, latexT] = tableGenerator(it, [vecRaiz; vecError], varNames);
%
% disp(Table);
% disp(char(latexT)); % char() is necessary for copy and paste to your
%                       latex file.
% 
%%
function [T, latexTab] = tableGenerator(iterations, params, varNames)
mat = [];
auxArr = [];

for i = 1 : iterations
    auxArr(1) = i;
    for j = 1 : size(params)
        auxArr(j+1) = params(j, i);
    end
    mat = [mat; auxArr];
end

T = array2table(mat, ...
    'VariableNames', varNames);

sz = size(params(1:end,1)-1);
input.data = T;
input.dataFormat = {'$%.0f', 1,'%.5f', sz};
latexTab = latexTable(input);
end


% Original.
%
% function latex = generateTableLatex(vecRaiz, vecError, it)
% mat = [];
% varNames = {'Iteraciones', 'Raiz', 'Error'};
% 
% for i = 1 : it
%     mat = [mat; [i vecRaiz(i) vecError(i)]];
% end
% 
% T = array2table(mat, ...
%     'VariableNames', varNames)
% 
% input.data = T;
% input.dataFormat = {'$%.0f', 1,'%.5f',2};
% %latex = latexTable(input);
% end