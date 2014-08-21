function visBoundingBoxGaze(fpath,visGaze)

% this function is used to visualize the bounding boxes annotattions, salient people, and gaze.

if nargin < 2
	visGaze = false;
end

% settings
ImPath = fullfile(fpath,'Images');
GtPath = fullfile(fpath,'Gt');
ScratchPath = fullfile(fpath,'Scratch');
[status msg] = unix(sprintf('mkdir -p %s',ScratchPath));
GtBbsF = fullfile(GtPath,'tracks.mat');
GtGazeF = fullfile(GtPath,'saliency_wearer_GtPrs.mat');

% load data
load(GtBbsF,'dres_compute');
load(GtGazeF,'map_cand');

% vis each frame
frs = unique(dres_compute.fr');
fprintf('total %d frs:',length(frs));
for fr = frs
	if mod(fr,100) == 0
		fprintf('.');
	end
	saveF = fullfile(ScratchPath,sprintf('%05d.jpg',fr));
	if exist(saveF,'file')
		continue;
	end
	ImF = fullfile(ImPath,sprintf('%05d.jpg',fr));
	Im = imread(ImF);
	% get all bbs in fr
	mask = dres_compute.fr == fr;
	rects = [dres_compute.x(mask) dres_compute.y(mask) dres_compute.w(mask) dres_compute.h(mask)];
	FigId = figure('Visible','off');
	plotBs(Im, rects,'r'); % plot all bbs

	% plot gaze and salient bbx
	if visGaze
		mask = [map_cand.fr] == fr;
		if any(mask)
			cand = map_cand(mask);
			ptr = cand.bIds;
			rect = [dres_compute.x(ptr) dres_compute.y(ptr) dres_compute.w(ptr) dres_compute.h(ptr)];
			hold on; plotBs([], rect,'g'); % plot salient bbx
			hold on; plot(cand.gaze(1),cand.gaze(2),'go'); %plot gaze
		end
	end

	% save vis
	if FigId
		print('-djpeg', '-r50', saveF);
	end
end
