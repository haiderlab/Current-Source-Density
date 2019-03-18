%% CSD Construction
clear all
load('example_dataset')

% lfp - local field potential response to bar at center of receptive field
% depth - um 
% dz - spacing of channels
% tt - time from bar stimulus onset

depth = depth*cosd(30); %correct for manipulator angle (degree from vertical)

%% estimate CSD
% 5 point hamming filter from Ulbert et al. J Neurosci Methoods 2001 
% ('Multiple microelectrode-recording system for intracortical 
% applications') - equation 5 for spatial smoothing of signal
w = [0.23; 0.08; -0.62; 0.08; .23];
for i = 1:size(lfp,1)
    if i-2>0 && i+2<size(lfp,1)+1
        u1 = lfp(i-2,:);
        u2 = lfp(i-1,:);
        u3 = lfp(i,:);
        u4 = lfp(i+1,:);
        u5 = lfp(i+2,:);
        
        CSD(i,:) = -(w(1)*u1 + w(2)*u2 + w(3)*u3 + w(4)*u4 +w(5)*u5)/(2*dz*2*dz);
    end
end
CSD = CSD(3:end,:);

%% plot LFP and CSD as function of depth
z = [depth-dz*31:dz:depth];
v=1; % interpolation factor
figure
subplot  121
if isnan(z)
    z = [1:1:32];
end
imagesc(tt, z, interp2(lfp,v))
ylim([z(3) z(end-2)])
xlabel('time (s)')
ylabel('depth')
title('LFP (\muV)')

subplot 122
imagesc(tt, z(3:end-2), interp2(CSD,v))
xlabel('time (s)')
ylabel('depth')
colormap('hot')
title('CSD')

h = colorbar;
h.Ticks =  h.Limits;
h.TickLabels = {'sink' 'source'};

