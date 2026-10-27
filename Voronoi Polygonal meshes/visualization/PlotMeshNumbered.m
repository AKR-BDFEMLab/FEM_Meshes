function PlotMeshNumbered(n)

[Node,Element,s,ElemEdge] = LoadMesh(n);

figure;
hold on;

NT = numel(Element);
NE = size(s,2);
NV = size(Node,1);

for K = 1:NT
    vid = Element{K};
    patch(Node(vid,1),Node(vid,2),'w',...
        'EdgeColor','k','LineWidth',0.8);

    xc = mean(Node(vid,1));
    yc = mean(Node(vid,2));

    text(xc,yc,sprintf('T%d',K),...
        'Color','b','FontWeight','bold',...
        'HorizontalAlignment','center');
end

for i = 1:NV
    text(Node(i,1),Node(i,2),sprintf('N%d',i),...
        'Color','r','FontSize',8,...
        'HorizontalAlignment','right');
end

for e = 1:NE
    A = Node(s(1,e),:);
    B = Node(s(2,e),:);

    xm = (A(1)+B(1))/2;
    ym = (A(2)+B(2))/2;

    text(xm,ym,sprintf('E%d',e),...
        'Color',[0 0.5 0],...
        'FontSize',8,...
        'HorizontalAlignment','center',...
        'BackgroundColor','w');
end

axis equal tight;
box on;

xlabel('x');
ylabel('y');

title(sprintf('Polygonal mesh numbering (n=%d)',n));

end
