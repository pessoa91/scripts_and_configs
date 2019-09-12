import numpy as np
from scipy.optimize import curve_fit

factor_fwhm = 2*np.sqrt(2*np.log(2))

class GaussFit:
    def __init__(self, xx, yy, print_=False, sigma_00=3e-15):
        #p0 = (1e10, 3.5e-14, 1e-14)
        self.xx = xx
        self.yy = yy
        self.jacobi_arr = np.ones([len(xx), 4])
        const_0 = self.const_0 = min(yy[0], yy[-1])
        scale_0 = self.scale_0 = np.max(yy)-const_0
        mean_0 = self.mean_0 = np.squeeze(xx[np.argmax(yy)])

        # Third instead of half for better stability
        mask_above_half = yy-const_0 > scale_0/2

        if np.sum(mask_above_half) != 0:
            sigma_0 = abs(xx[mask_above_half][-1] - xx[mask_above_half][0])/factor_fwhm
        else:
            if sigma_00 is None:
                sigma_0 = 1
            else:
                sigma_0 = sigma_00

        if sigma_00 is not None:
            sigma_0 = max(sigma_0, sigma_00)
        self.sigma_0 = sigma_0

        p0 = self.p0 = (scale_0, mean_0, sigma_0, const_0)
        try:
            self.popt, self.pcov = curve_fit(self.fit_func, xx, yy, p0=p0, jac=self.jacobi)
        except RuntimeError as e:
            self.popt, self.pcov = p0, np.ones([len(p0), len(p0)], float)
            print(e)
            print('Fit did not converge. Using p0 instead!')

        self.scale, self.mean, self.sigma, self.const = self.popt
        self.reconstruction = self.fit_func(xx, *self.popt)

        if print_:
            print(p0, '\t\t', self.popt)

    @staticmethod
    def fit_func(xx, scale, mean, sig, const):
        #return scale*stats.norm.pdf(xx, mean, sig)
        return scale*np.exp(-(xx-mean)**2/(2*sig**2))+const

    def jacobi(self, xx, scale, mean, sig, const):
        g_minus_const = self.fit_func(xx, scale, mean, sig, 0)
        self.jacobi_arr[:,0] = g_minus_const/scale
        self.jacobi_arr[:,1] = g_minus_const * (xx-mean)/sig**2
        self.jacobi_arr[:,2] = g_minus_const * (xx-mean)**2/sig**3
        return self.jacobi_arr

    def plot_data_and_fit(self, sp):
        sp.plot(self.xx, self.yy, label='Data', marker='.')
        sp.plot(self.xx, self.reconstruction, label='Reconstruction', marker='.', ls='--')
        sp.axhline(self.scale_0+self.const_0, label='scale_0+const_0', color='black')
        sp.axhline(self.scale+self.const, label='scale+const', color='black', ls='--')

        sp.axhline(self.const_0, label='const_0', color='black')
        sp.axhline(self.const, label='const', color='black', ls='--')

        sp.axvline(self.mean_0, label='mean_0', color='red')
        sp.axvline(self.mean, label='mean', color='red', ls='--')

        sp.axvline(self.mean_0-self.sigma_0, label='sigma_0', color='green')
        sp.axvline(self.mean_0+self.sigma_0, color='green')
        sp.axvline(self.mean-self.sigma, label='sigma', color='green', ls='--')
        sp.axvline(self.mean+self.sigma, color='green', ls='--')
        sp.legend()

