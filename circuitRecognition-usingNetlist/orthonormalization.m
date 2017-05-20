function E=gs_orthonormalization(V)
% V is a matrix where each column contains the vectors spanning the space of which we want to compute the orthonormal base
% E is a matrix where each column contains an ortho-normal vector of the base of the space

[numberLines,numberColumns]=size(V);

% U is a matrix containing the orthogonal vectors (non normalized)
U=zeros(numberLines,numberColumns);

for indexColumn=1:numberColumns
    U(:,indexColumn)=V(:,indexColumn);

    for index=1:(indexColumn-1)
        R(index,indexColumn) =U(:,index)'*V(:,indexColumn);
        U(:,indexColumn)=U(:,indexColumn)-R(index,indexColumn)*U(:,index);
    end

    R(indexColumn,indexColumn)=norm(U(:,indexColumn));
    U(:,indexColumn)=U(:,indexColumn)./R(indexColumn,indexColumn);

end

E=U;

return 