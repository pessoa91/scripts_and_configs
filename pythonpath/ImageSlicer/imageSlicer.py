import numpy as np
import matplotlib.pyplot as plt

import myplotstyle as ms

from .gaussfit import GaussFit
#from h5_storage import loadH5Recursive

#dict_ = loadH5Recursive('/sf/data/measurements/2019/05/18/20190518_132817_SARCL02-DSCR280_camera_snapshot.h5')
#dict_ = loadH5Recursive('/afs/psi.ch/intranet/SF/data/2019/07/15/Bunch_length_meas_2019-07-15_04-00-36.h5')

#plt.close('all')

def image_analysis(image, x_axis, y_axis, n_sig, n_slices, title='', do_plot=True):

    mean_sliceX = np.zeros(n_slices)
    mean_sliceY = mean_sliceX.copy()
    current_arr = mean_sliceX.copy()
    width_sliceX = mean_sliceX.copy()

    image -= image.min()
    gauss = GaussFit.fit_func

    projY = np.sum(image, axis=1)
    projX = np.sum(image, axis=0)

    #import pdb; pdb.set_trace()
    gfY = GaussFit(y_axis, projY, sigma_00=None)
    gfX = GaussFit(x_axis, projX, sigma_00=None)

    if do_plot:

        plt.figure()
        plt.suptitle('Image analysis %s' % title)

        subplot = ms.subplot_factory(2,2)
        sp = subplot(1, title='Full y fit', xlabel='y [m]', ylabel='Intensity (arb. units')
        sp.plot(y_axis, projY)
        sp.axvline(gfY.mean, label='Y fit mean', color='red', ls='--')
        sp.plot(y_axis, gauss(y_axis, *gfY.p0), label='Initial guess')
        sp.plot(y_axis, gfY.reconstruction, label='Fit')
        sp.legend()

        sp = subplot(2, grid=False, title='Raw image')
        sp.imshow(image, aspect='auto', extent=(x_axis[0], x_axis[-1], y_axis[-1], y_axis[0]))

        sp1 = subplot(3, title='Slices 0 - %i' % (n_slices//2))
        sp2 = subplot(4, title='Slices %i - %i' % (n_slices//2+1, n_slices-1))

    # Slicing
    y_max = min(gfY.mean + n_sig*gfY.sigma, y_axis.max())
    y_min = max(gfY.mean - n_sig*gfY.sigma, y_axis.min())
    index_max = int(np.argmin((y_axis - y_max)**2))
    index_min = int(np.argmin((y_axis - y_min)**2))
    slice_borders = np.array(np.linspace(index_min, index_max, n_slices+1), int)

    # Get properties (means, intensity) for each slice
    for n_slice in range(n_slices):
        min_index = min(slice_borders[n_slice], slice_borders[n_slice+1])
        max_index = max(slice_borders[n_slice], slice_borders[n_slice+1])

        slice_image = image[min_index:max_index,:]
        projX_slice = np.sum(slice_image, axis=0)
        gf_slice = GaussFit(x_axis, projX_slice, sigma_00=None)
        meanX_slice = gf_slice.mean
        meanY_slice = (y_axis[min_index]+y_axis[max_index])/2

        mean_sliceX[n_slice] = meanX_slice
        mean_sliceY[n_slice] = meanY_slice
        current_arr[n_slice] = np.sum(slice_image)
        width_sliceX[n_slice] = gf_slice.sigma

        if do_plot:

            sp.plot(meanX_slice, meanY_slice, marker='+', color='red')

            if n_slice <= n_slices//2:
                sp_s = sp1
            else:
                sp_s = sp2
            color = ms.colorprog(n_slice, n_slices/2+1)
            sp_s.plot(x_axis, projX_slice, color=color)
            sp_s.plot(x_axis, gf_slice.reconstruction, color=color, ls='--')
            sp_s.axvline(gf_slice.mean, ls='--', color=color)

    # Obtain reference point
    ref_x = gfX.mean
    mean_sliceX -= ref_x
    ref_y = gfY.mean
    mean_sliceY -= ref_y

    outp = {
            'ref_x': ref_x,
            'ref_y': ref_y,
            'mean_sliceX': mean_sliceX,
            'mean_sliceY': mean_sliceY,
            'current_arr': current_arr,
            'width_sliceX': width_sliceX,
            }
    return outp


#images = dict_['Raw_data']['Beam images']
#n_images = images.shape[0]
#
#for n_image in range(n_images):
#    transpose = True
#    image = dict_['Raw_data']['Beam images'][n_image]
#    x_axis = dict_['Raw_data']['xAxis']
#    y_axis = dict_['Raw_data']['yAxis']
#    n_slices = 15
#    n_sig = 2
#
#
#    if transpose:
#        image, y_axis, x_axis = image.T, x_axis, y_axis
#
#    output = image_analysis(image, x_axis, y_axis, n_sig, n_slices, title=n_image)
#
#plt.show()

