function AZEL_conversion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% varargin command line arguments to AZEL_conversion (see VARARGIN)
% Choose default command line output for AZEL_conversion
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.Start_moon,'UserData',false); %initiate 'Value' as flag for keep running
set(handles.Start_sun,'UserData',false);
axes(handles.google_map);
imageHandle = plot_google_map;
set(imageHandle,'ButtonDownFcn',@ImageClickCallback);
global a;
a = arduino('COM3'); %initiate arduino interface COM X
global az_pin_step;
global el_pin_step;
global az_pin_dir;
global el_pin_dir;
global step_angle;
step_angle = 0.05625;
az_pin_step = 4;
el_pin_step = 6;
az_pin_dir = 5;
el_pin_dir = 7;
pinMode(a,az_pin_step,'output'); %correspond to PUL on MA860H
pinMode(a,el_pin_step,'output');
pinMode(a,az_pin_dir,'output'); %correspond to DIR on MA860H
pinMode(a,el_pin_dir,'output');
% UIWAIT makes AZEL_conversion wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.