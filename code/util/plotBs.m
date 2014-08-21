function plotBs(img, rect, color)
% Visualices and image and a set of rect
%
%   img = image
%   rect = each row is [xmin ymin width height]

bb = rect;
bb(:,3:4) = bb(:,3:4)+bb(:,1:2);

Nbb = size(bb,1);
if ~isempty(img)
    image(img); axis('off'); axis('equal')
end
hold on

colors = 'rrgbcmy';
for i = 1:Nbb
    plot([bb(i,1) bb(i,3) bb(i,3) bb(i,1) bb(i,1)], [bb(i,2) bb(i,2) bb(i,4) bb(i,4) bb(i,2)], color)
end
