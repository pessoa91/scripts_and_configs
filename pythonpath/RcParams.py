import matplotlib.pyplot as plt

def init_pyplot(labelsize=15, fontsize=15, ticksize=12):


    plt.rcParams['lines.linewidth'] = 2.0
#    plt.rcParams['figure.titlesize'] = u'large'
    plt.rcParams['figure.titlesize'] = 20
    plt.rcParams['font.size'] = fontsize

    plt.rcParams['axes.grid'] = True

    plt.rcParams['figure.facecolor'] = u'w'
    plt.rcParams['figure.subplot.left'] = 0.1
    plt.rcParams['figure.subplot.right'] =  0.75
    plt.rcParams['figure.subplot.hspace'] =  0.45
    plt.rcParams['figure.subplot.wspace'] =  0.45
    plt.rcParams['figure.subplot.bottom'] = 0.1

    plt.rcParams['ytick.labelsize'] = ticksize
    plt.rcParams['xtick.labelsize'] = ticksize

    plt.rcParams['legend.loc'] = 'upper left'
    plt.rcParams['legend.fontsize'] = labelsize

    plt.rcParams['axes.linewidth'] = 2.0
    plt.rcParams['axes.labelsize'] = labelsize
    plt.rcParams['axes.titlesize'] = labelsize
    plt.rcParams['lines.markersize'] = 7.0
    plt.rcParams['ytick.major.pad'] = 12
    plt.rcParams['xtick.major.pad'] = 12
    plt.rcParams['lines.markeredgewidth'] = 1

    plt.rcParams['axes.prop_cycle'] = plt.cycler(u'color', [u'b', u'g', u'r', u'c', u'm', u'y', u'k',u'orange'])


# plt.rcParams

#{\
#          u'agg.path.chunksize': 0,
#          u'animation.avconv_args': [],
#          u'animation.avconv_path': u'avconv',
#          u'animation.bitrate': -1,
#          u'animation.codec': u'mpeg4',
#          u'animation.convert_args': [],
#          u'animation.convert_path': u'convert',
#          u'animation.ffmpeg_args': [],
#          u'animation.ffmpeg_path': u'ffmpeg',
#          u'animation.frame_format': u'png',
#          u'animation.html': u'none',
#          u'animation.mencoder_args': [],
#          u'animation.mencoder_path': u'mencoder',
#          u'animation.writer': u'ffmpeg',
#          u'axes.axisbelow': False,
#          u'axes.edgecolor': u'k',
#          u'axes.facecolor': u'w',
#          u'axes.formatter.limits': [-7, 7],
#          u'axes.formatter.use_locale': False,
#          u'axes.formatter.use_mathtext': False,
#          u'axes.formatter.useoffset': True,
#          u'axes.grid': False,
#          u'axes.grid.axis': u'both',
#          u'axes.grid.which': u'major',
#          u'axes.hold': True,
#          u'axes.labelcolor': u'k',
#          u'axes.labelpad': 5.0,
#          u'axes.labelsize': u'medium',
#          u'axes.labelweight': u'normal',
#          u'axes.linewidth': 1.0,
#          u'axes.prop_cycle': cycler(u'color', [u'b', u'g', u'r', u'c', u'm', u'y', u'k']),
#          u'axes.spines.bottom': True,
#          u'axes.spines.left': True,
#          u'axes.spines.right': True,
#          u'axes.spines.top': True,
#          u'axes.titlesize': u'large',
#          u'axes.titleweight': u'normal',
#          u'axes.unicode_minus': True,
#          u'axes.xmargin': 0.0,
#          u'axes.ymargin': 0.0,
#          u'axes3d.grid': True,
#          u'backend': u'TkAgg',
#          u'backend.qt4': u'PyQt4',
#          u'backend.qt5': u'PyQt5',
#          u'backend_fallback': True,
#          u'boxplot.bootstrap': None,
#          u'boxplot.boxprops.color': u'b',
#          u'boxplot.boxprops.linestyle': u'-',
#          u'boxplot.boxprops.linewidth': 1.0,
#          u'boxplot.capprops.color': u'k',
#          u'boxplot.capprops.linestyle': u'-',
#          u'boxplot.capprops.linewidth': 1.0,
#          u'boxplot.flierprops.color': u'b',
#          u'boxplot.flierprops.linestyle': u'none',
#          u'boxplot.flierprops.linewidth': 1.0,
#          u'boxplot.flierprops.marker': u'+',
#          u'boxplot.flierprops.markeredgecolor': u'k',
#          u'boxplot.flierprops.markerfacecolor': u'b',
#          u'boxplot.flierprops.markersize': 6.0,
#          u'boxplot.meanline': False,
#          u'boxplot.meanprops.color': u'r',
#          u'boxplot.meanprops.linestyle': u'-',
#          u'boxplot.meanprops.linewidth': 1.0,
#          u'boxplot.medianprops.color': u'r',
#          u'boxplot.medianprops.linestyle': u'-',
#          u'boxplot.medianprops.linewidth': 1.0,
#          u'boxplot.notch': False,
#          u'boxplot.patchartist': False,
#          u'boxplot.showbox': True,
#          u'boxplot.showcaps': True,
#          u'boxplot.showfliers': True,
#          u'boxplot.showmeans': False,
#          u'boxplot.vertical': True,
#          u'boxplot.whiskerprops.color': u'b',
#          u'boxplot.whiskerprops.linestyle': u'--',
#          u'boxplot.whiskerprops.linewidth': 1.0,
#          u'boxplot.whiskers': 1.5,
#          u'contour.corner_mask': True,
#          u'contour.negative_linestyle': u'dashed',
#          u'datapath': u'/usr/share/matplotlib/mpl-data',
#          u'docstring.hardcopy': False,
#          u'errorbar.capsize': 3.0,
#          u'examples.directory': u'',
#          u'figure.autolayout': False,
#          u'figure.dpi': 80.0,
#          u'figure.edgecolor': u'w',
#          u'figure.facecolor': u'0.75',
#          u'figure.figsize': [8.0, 6.0],
#          u'figure.frameon': True,
#          u'figure.max_open_warning': 20,
#          u'figure.subplot.bottom': 0.1,
#          u'figure.subplot.hspace': 0.2,
#          u'figure.subplot.left': 0.125,
#          u'figure.subplot.right': 0.9,
#          u'figure.subplot.top': 0.9,
#          u'figure.subplot.wspace': 0.2,
#          u'figure.titlesize': u'medium',
#          u'figure.titleweight': u'normal',
#          u'font.cursive': [u'Apple Chancery',
#                            u'Textile',
#                            u'Zapf Chancery',
#                            u'Sand',
#                            u'Script MT',
#                            u'Felipa',
#                            u'cursive'],
#          u'font.family': [u'sans-serif'],
#          u'font.fantasy': [u'Comic Sans MS',
#                            u'Chicago',
#                            u'Charcoal',
#                            u'ImpactWestern',
#                            u'Humor Sans',
#                            u'fantasy'],
#          u'font.monospace': [u'Bitstream Vera Sans Mono',
#                              u'DejaVu Sans Mono',
#                              u'Andale Mono',
#                              u'Nimbus Mono L',
#                              u'Courier New',
#                              u'Courier',
#                              u'Fixed',
#                              u'Terminal',
#                              u'monospace'],
#          u'font.sans-serif': [u'Bitstream Vera Sans',
#                               u'DejaVu Sans',
#                               u'Lucida Grande',
#                               u'Verdana',
#                               u'Geneva',
#                               u'Lucid',
#                               u'Arial',
#                               u'Helvetica',
#                               u'Avant Garde',
#                               u'sans-serif'],
#          u'font.serif': [u'Bitstream Vera Serif',
#                          u'DejaVu Serif',
#                          u'New Century Schoolbook',
#                          u'Century Schoolbook L',
#                          u'Utopia',
#                          u'ITC Bookman',
#                          u'Bookman',
#                          u'Nimbus Roman No9 L',
#                          u'Times New Roman',
#                          u'Times',
#                          u'Palatino',
#                          u'Charter',
#                          u'serif'],
#          u'font.size': 12.0,
#          u'font.stretch': u'normal',
#          u'font.style': u'normal',
#          u'font.variant': u'normal',
#          u'font.weight': u'normal',
#          u'grid.alpha': 1.0,
#          u'grid.color': u'k',
#          u'grid.linestyle': u':',
#          u'grid.linewidth': 0.5,
#          u'image.aspect': u'equal',
#          u'image.cmap': u'jet',
#          u'image.composite_image': True,
#          u'image.interpolation': u'bilinear',
#          u'image.lut': 256,
#          u'image.origin': u'upper',
#          u'image.resample': False,
#          u'interactive': False,
#          u'keymap.all_axes': [u'a'],
#          u'keymap.back': [u'left', u'c', u'backspace'],
#          u'keymap.forward': [u'right', u'v'],
#          u'keymap.fullscreen': [u'f', u'ctrl+f'],
#          u'keymap.grid': [u'g'],
#          u'keymap.home': [u'h', u'r', u'home'],
#          u'keymap.pan': [u'p'],
#          u'keymap.quit': [u'ctrl+w', u'cmd+w'],
#          u'keymap.save': [u's', u'ctrl+s'],
#          u'keymap.xscale': [u'k', u'L'],
#          u'keymap.yscale': [u'l'],
#          u'keymap.zoom': [u'o'],
#          u'legend.borderaxespad': 0.5,
#          u'legend.borderpad': 0.4,
#          u'legend.columnspacing': 2.0,
#          u'legend.edgecolor': u'inherit',
#          u'legend.facecolor': u'inherit',
#          u'legend.fancybox': False,
#          u'legend.fontsize': u'large',
#          u'legend.framealpha': None,
#          u'legend.frameon': True,
#          u'legend.handleheight': 0.7,
#          u'legend.handlelength': 2.0,
#          u'legend.handletextpad': 0.8,
#          u'legend.isaxes': True,
#          u'legend.labelspacing': 0.5,
#          u'legend.loc': u'upper right',
#          u'legend.markerscale': 1.0,
#          u'legend.numpoints': 2,
#          u'legend.scatterpoints': 3,
#          u'legend.shadow': False,
#          u'lines.antialiased': True,
#          u'lines.color': u'b',
#          u'lines.dash_capstyle': u'butt',
#          u'lines.dash_joinstyle': u'round',
#          u'lines.linestyle': u'-',
#          u'lines.linewidth': 1.0,
#          u'lines.marker': u'None',
#          u'lines.markeredgewidth': 0.5,
#          u'lines.markersize': 6.0,
#          u'lines.solid_capstyle': u'projecting',
#          u'lines.solid_joinstyle': u'round',
#          u'markers.fillstyle': u'full',
#          u'mathtext.bf': u'serif:bold',
#          u'mathtext.cal': u'cursive',
#          u'mathtext.default': u'it',
#          u'mathtext.fallback_to_cm': True,
#          u'mathtext.fontset': u'cm',
#          u'mathtext.it': u'serif:italic',
#          u'mathtext.rm': u'serif',
#          u'mathtext.sf': u'sans\\-serif',
#          u'mathtext.tt': u'monospace',
#          u'nbagg.transparent': True,
#          u'patch.antialiased': True,
#          u'patch.edgecolor': u'k',
#          u'patch.facecolor': u'b',
#          u'patch.linewidth': 1.0,
#          u'path.effects': [],
#          u'path.simplify': True,
#          u'path.simplify_threshold': 0.1111111111111111,
#          u'path.sketch': None,
#          u'path.snap': True,
#          u'pdf.compression': 6,
#          u'pdf.fonttype': 3,
#          u'pdf.inheritcolor': False,
#          u'pdf.use14corefonts': False,
#          u'pgf.debug': False,
#          u'pgf.preamble': [],
#          u'pgf.rcfonts': True,
#          u'pgf.texsystem': u'xelatex',
#          u'plugins.directory': u'.matplotlib_plugins',
#          u'polaraxes.grid': True,
#          u'ps.distiller.res': 6000,
#          u'ps.fonttype': 3,
#          u'ps.papersize': u'letter',
#          u'ps.useafm': False,
#          u'ps.usedistiller': False,
#          u'savefig.bbox': None,
#          u'savefig.directory': u'~',
#          u'savefig.dpi': 100.0,
#          u'savefig.edgecolor': u'w',
#          u'savefig.facecolor': u'w',
#          u'savefig.format': u'png',
#          u'savefig.frameon': True,
#          u'savefig.jpeg_quality': 95,
#          u'savefig.orientation': u'portrait',
#          u'savefig.pad_inches': 0.1,
#          u'savefig.transparent': False,
#          u'svg.fonttype': u'path',
#          u'svg.image_inline': True,
#          u'svg.image_noscale': False,
#          u'text.antialiased': True,
#          u'text.color': u'k',
#          u'text.dvipnghack': None,
#          u'text.hinting': u'auto',
#          u'text.hinting_factor': 8,
#          u'text.latex.preamble': [],
#          u'text.latex.preview': False,
#          u'text.latex.unicode': False,
#          u'text.usetex': False,
#          u'timezone': u'UTC',
#          u'tk.window_focus': False,
#          u'toolbar': u'toolbar2',
#          u'verbose.fileo': u'sys.stdout',
#          u'verbose.level': u'silent',
#          u'webagg.open_in_browser': True,
#          u'webagg.port': 8988,
#          u'webagg.port_retries': 50,
#          u'xtick.color': u'k',
#          u'xtick.direction': u'in',
#          u'xtick.labelsize': u'medium',
#          u'xtick.major.pad': 4.0,
#          u'xtick.major.size': 4.0,
#          u'xtick.major.width': 0.5,
#          u'xtick.minor.pad': 4.0,
#          u'xtick.minor.size': 2.0,
#          u'xtick.minor.visible': False,
#          u'xtick.minor.width': 0.5,
#          u'ytick.color': u'k',
#          u'ytick.direction': u'in',
#          u'ytick.labelsize': u'medium',
#          u'ytick.major.pad': 4.0,
#          u'ytick.major.size': 4.0,
#          u'ytick.major.width': 0.5,
#          u'ytick.minor.pad': 4.0,
#          u'ytick.minor.size': 2.0,
#          u'ytick.minor.visible': False,
#          u'ytick.minor.width': 0.5}
#
#
