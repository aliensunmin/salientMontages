function doAll(list)
	if nargin <1
		list = 1:10;
	end
	Names = {'Beach1','Beach2','Ferry','Seaside','Campsite','Lakeside1','Lakeside2','Lakeside3','Playground2','Playground1'};
	%par
	for n = list
		wrapper(Names{n});
	end
end

function wrapper(name)
	fpath = fullfile('.','data',name)
	visBoundingBoxGaze(fpath,true);
end
