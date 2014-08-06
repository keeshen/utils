#! /usr/bin/env python
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import datetime
import sys

from abc import ABCMeta, abstractmethod


class Plotter(object):
    '''
    "Abstract Interface" that all plot classes must implement

    Classes implementing this interface must override plot_method and
    prepare_data methods

    By default Plotter saves all plots as default_plot.png. 
    Pass 'filename' as kwarg to change filename 

    **kwargs list:

    filename   - Specify the output graph filename. Default 'default_plot.png'
    title      - Specify a title for the graph. Default 'X vs Y Graph'
    xlabel     - Specify the X-axis label. Default 'X axis'
    ylabel     - Specify the Y-axis label. Default 'Y axis'
    legend_loc - Specify the loc of the legend box. Default 'upper left'.
                 See matplotlib manpages for more formatting options

    '''
    __metaclass__ = ABCMeta
    def __init__(self, **kwargs):
        WIDTH_HEIGHT = plt.figaspect(0.67)
        self.fig = plt.figure(figsize=WIDTH_HEIGHT)
        self.filename = kwargs.get('filename',
            'default_plot.png')
        self.title = kwargs.get('title', 'X vs Y Graph')
        self.xlabel = kwargs.get('x_axis', None)
        self.ylabel = kwargs.get('y_axis', 'Y_axis')
        self.legend_loc = kwargs.get('legend_loc', 'upper left')
        self.legend_bool = kwargs.get('legend_on', True)
        self.legend_ncol = 2

    def plot_and_save(self):
        self.prepare_data()
        if self.title:
            plt.title(self.title, figure=self.fig)
        if self.xlabel:
            plt.xlabel(self.xlabel, figure=self.fig)
        plt.ylabel(self.ylabel, figure=self.fig)
        self.plot_method()
        if self.legend_bool:
            self._set_legend() 
 #       plt.tight_layout()
        self._savefig()

    def _savefig(self):
        '''
        Internal method for saving the graph to a file
        '''
        #plt.tight_layout()
        self.fig.savefig(self.filename)
    def _set_legend(self):
        '''
        Internal method for preparing the legends box
        '''
        plt.legend(loc=1, ncol=self.legend_ncol)
#
    @abstractmethod
    def prepare_data(self):
        pass
    @abstractmethod
    def plot_method(self):
        pass
