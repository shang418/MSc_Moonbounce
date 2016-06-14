function varargout = AZEL_conversion(varargin)
% AZEL_CONVERSION MATLAB code for AZEL_conversion.fig
% AZEL_CONVERSION, by itself, creates a new AZEL_CONVERSION or raises the existing
% singleton*.
%
% H = AZEL_CONVERSION returns the handle to a new AZEL_CONVERSION or the handle to
% the existing singleton*.
%
% AZEL_CONVERSION('CALLBACK',hObject,eventData,handles,...) calls the local
% function named CALLBACK in AZEL_CONVERSION.M with the given input arguments.
%
% AZEL_CONVERSION('Property','Value',...) creates a new AZEL_CONVERSION or raises the
% existing singleton*. Starting from the left, property value pairs are
% applied to the GUI before AZEL_conversion_OpeningFcn gets called. An
% unrecognized property name or invalid value makes property application
% stop. All inputs are passed to AZEL_conversion_OpeningFcn via varargin.
%
% *See GUI Options on GUIDE's Tools menu. Choose "GUI allows only one
% instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help AZEL_conversion
% Last Modified by GUIDE v2.5 18-May-2014 02:21:09
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
'gui_Singleton', gui_Singleton, ...
'gui_OpeningFcn', @AZEL_conversion_OpeningFcn, ...
'gui_OutputFcn', @AZEL_conversion_OutputFcn, ...
'gui_LayoutFcn', [] , ...
'gui_Callback', []);
if nargin && ischar(varargin{1})
gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
[varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before AZEL_conversion is made visible.

