# Intro
Here are the data used in paper [1].
[1] presents a novel method to generate salient montages from unconstrained videos, by finding ``montageable moments'' and identifying the salient people and actions to depict in each montage. Our method addresses the need for generating concise visualizations from the increasingly large number of videos being captured from portable devices. Our main contributions are (1) the process of finding salient people and moments to form a montage, and (2) the application of this method to videos taken ``in the wild'' where the camera moves freely. As such, we demonstrate results on head-mounted cameras, where the camera moves constantly, as well as on videos downloaded from YouTube. Our approach can operate on videos of any length; some will contain many montageable moments, while others may have none. We demonstrate that a novel ``montageability'' score can be used to retrieve results with relatively high precision which allows us to present high quality montages to users.

The video frames, ground truth person bounding boxes, ground truth salient person, and gaze are included in this dataset.
The code to visualize the frame, ground truth annotations are included as well.

# Contents
''
-data\ % 10 first-person videos
	- Beach1\
		-Gt\ % the ground truth annotations
			-saliency_wearer_GtPrs.mat % per frame gaze data and most salient person according to gaze
			-tracks.mat % per frame person bounding boxes annotation
		-Images\ % extracted frames from the video, where a face detector is used to blur faces
-code\ % code for visualization
	-doAll.m % script to visualization all 10 videos
	-visBoundingBoxGaze.m % function to visualize a specific video
	-util\ % utilities functinos
''

# Privacy requirement
Most faces are blurred by applying a standard face detector in opencv. However, not all faces are blurred.
When using this data, you must never show a frame in your public results without manually removing the faces.

# Reference
[1] Min Sun, Ali Farhadi, Ben Taskar, and Steve Seitz, "Salient Montages from Unconstrained Videos." ECCV 2014
