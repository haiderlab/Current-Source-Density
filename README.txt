# CSD_construction.m
Code to construct CSD map for stimulus evoked responses

Speed et al. 2019 'Cortical State Fluctuations across Layers of V1
during Visual Spatial Perception'

Basic instructions:
1. Load trial-averaged stimulus evoked activity (LFP matrix is channel vs. time)
2. Subtract average baseline LFP from matrix (baseline is LFP averaged 100ms before stimulus)
2. Input depth of probe (depth is the last channel location below dura)
3. Run code; will construct CSD using 5 point hamming filter as described in Ulbert et al. 2001
4. L4 is identified by earliest and largest sink in CSD +/- 100 microns in mice, as described in (Niell and Stryker 2008, Pluta et al. 2015)

See paper for more details.

Citations:
Speed, A., Del Rosario, J.P., Burgess, C.P., Haider, B. 'Cortical state fluctuations across layers of V1 during visual spatial perception.' Cell Reports, 2019. https://doi.org/10.1016/j.celrep.2019.02.045
Ulbert, I., Halgren, E., Heit, G., Karmos, G. 'Multiple microelectrode-recording system for human intracortical applications. Journal of Neuroscience Methods, 2001.' https://doi.org/10.1016/S0165-0270(01)00330-2
Niel, C.M., Stryper M.P. 'Highly selective receptive fields in mouse visual cortex.' Journal of Neuroscience, 2008. https://doi.org/10.1523/JNEUROSCI.0623-08.2008
Pluta, S., Naka, A., Veut, J., Telian G., Yao, L., Hakim, R., Taylor, D. Adeskink, H. 'A direct translaminar inhibitory circuit tunes cortical output.' Nature Neuroscience, 2015. https://doi.org/10.1038/nn.4123